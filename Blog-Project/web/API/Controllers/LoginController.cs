using System;
using System.Security.Claims;
using System.Text;
using System.Linq;
using API.EFCore;
using API.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private IConfiguration _config;
        private blogContext _bContext;

        public LoginController(IConfiguration config, blogContext bContext)
        {
            _config = config;
            _bContext = bContext;
        }

        [AllowAnonymous]
        [HttpPost]
        public IActionResult Login([FromBody] AdminLogin adminLogin)
        {
            var user = Authenticate(adminLogin);

            if (user != null)
            {
                var token = Generate(user);
                
                return Ok(token);
            }
            return NotFound("User not found");
        }

        private string Generate(Admin user)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            var claims = new[]
            {
                new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
                new Claim(ClaimTypes.Name, user.Name),
                new Claim(ClaimTypes.Email, user.Email),
                new Claim(ClaimTypes.Hash, user.Password)
            };

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.Now.AddHours(3),
                SigningCredentials = credentials
            };

            var tokenHandler = new JwtSecurityTokenHandler();

            var token = tokenHandler.CreateToken(tokenDescriptor);

            // var tokenDescriptor = new SecurityTokenDescriptor
            // {
            //     Subject = new ClaimsIdentity(claims),
            // };

            // var token = new JwtSecurityToken(
            //     _config["Jwt:Issuer"],
            //     _config["Jwt:Audience"],
            //     claims,
            //     expires: DateTime.Now.AddHours(3),
            //     signingCredentials: credentials
            // );

            // Console.WriteLine(DateTime.Now);

            // var tokenString = new JwtSecurityTokenHandler().WriteToken(token);
            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        private Admin Authenticate(AdminLogin adminLogin)
        {
            var currentUser = _bContext.Admin.FirstOrDefault(o => o.Email.ToLower() == adminLogin.email.ToLower());

            try
            {
                if (currentUser != null && BCrypt.Net.BCrypt.Verify(adminLogin.password, currentUser.Password))
                {
                    return currentUser;
                }
            }
            catch (System.Exception ex)
            {

                Console.WriteLine(ex.Message);
            }
            
            return null;
        }
    }
}
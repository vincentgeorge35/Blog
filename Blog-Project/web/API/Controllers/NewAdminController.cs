using System;
using System.Linq;
using API.EFCore;
using API.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NewAdminController : ControllerBase
    {
        private readonly blogContext _bContext;

        public NewAdminController(blogContext bContext)
        {
            _bContext = bContext;
        }

        [HttpGet]
        public IActionResult GetAll()
        {
            var admins = _bContext.Admin.ToList();
            if (admins is null)
            {
                return BadRequest("No data was found");
            }
            return Ok(admins);
        }

        [Route("Get/{id}")]
        [HttpGet]
        public IActionResult Get(int id)
        {
            var admin = _bContext.Admin.Find(id);

            if (admin is null)
            {
                return BadRequest("No Data was found");
            }
            return Ok(admin);
        }

        [Route("create")]
        [HttpPost]
        public IActionResult post(AdminModel admin)
        {
            try
            {
                Admin NewAdmin = new Admin();
                NewAdmin.Name = admin.name;
                NewAdmin.Email = admin.email;
                admin.password = BCrypt.Net.BCrypt.HashPassword(admin.password);
                NewAdmin.Password = admin.password;

                if (string.IsNullOrEmpty(NewAdmin.Name) || 
                    string.IsNullOrEmpty(NewAdmin.Email) || 
                    string.IsNullOrEmpty(NewAdmin.Password)
                    )
                {
                    return BadRequest(" Please no null is accepted");
                }
                try
                {
                    _bContext.Admin.Add(NewAdmin);
                    _bContext.SaveChanges();

                    return Ok(NewAdmin); 
                }
                catch (System.Exception exc)
                {

                    return BadRequest(exc.Message);
                }
                
            }
            catch (System.Exception ex)
            {

                return BadRequest(ex.Message);
            }
            
        }

        [Route("update")]
        [HttpPut]
        public IActionResult put(AdminModel admin)
        {
            try
            {
                var data = _bContext.Admin.Find(admin.id);
                if (data is null)
                {
                    return BadRequest("Incorrect Id");
                }
                data.Id = admin.id;
                data.Name = admin.name;
                data.Email = admin.email;
                admin.password = BCrypt.Net.BCrypt.HashPassword(admin.password);
                data.Password = admin.password;

                if (string.IsNullOrEmpty(data.Name) ||
                    string.IsNullOrEmpty(data.Email) ||
                    string.IsNullOrEmpty(data.Password) ||
                    data.Id == 0
                    )
                {
                    return BadRequest(" Please null value is not accepted");
                }
                try
                {
                    
                    _bContext.Admin.Attach(data);
                    _bContext.SaveChanges();

                    return Ok(data);
                }
                catch (System.Exception exc)
                {

                    return BadRequest(exc.Message);
                }

            }
            catch (System.Exception exc)
            {

                return BadRequest(exc.Message);
            }
        }


        [Route("Delete/{id}")]
        [HttpDelete]
        public IActionResult Delete(int id)
        {
            var admin = _bContext.Admin.Find(id);

            if (admin is null)
            {
                return BadRequest("No Data was found");
            }

            _bContext.Admin.Remove(admin);
            _bContext.SaveChanges();

            return Ok("Deleted successfuly...");
        }
    }
}
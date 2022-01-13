using System.Linq;
using API.EFCore;
using API.Models;
using API.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthorController : ControllerBase
    {
        private readonly blogContext _bContext;

        public AuthorController(blogContext bContex)
        {
            _bContext = bContex;
        }


        //api/author/getall
        [Route("GetAll")]
        [HttpGet]
        public IActionResult GetAll()
        {
            
            try
            {
                var authors = _bContext.Author.ToList();
                if (authors is null)
                {
                    return BadRequest("No Author in the database");
                }

                return Ok(authors);

            }
            catch (System.Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }


        //api/author/get/{id}
        [Route("Get/{id}")]
        [HttpGet]
        public IActionResult get(int Id)
        {
            try
            {
                var author = _bContext.Author.Find(Id);
                if (author is null)
                {
                    return BadRequest("Author not found");
                }

                return Ok(author);
            }
            catch (System.Exception ex)
            {

                return BadRequest(ex.Message);
            }

        }

        //api/author/create
        [Route("Create")]
        [HttpPost]
        public IActionResult post(AuthorModel author)
        {
            try
            {
                Author newAuthor = new Author();
                newAuthor.FirstName = author.FirstName;
                newAuthor.LastName = author.LastName;
                newAuthor.Age = author.Age;

                if (newAuthor.Age <= 0 )
                {
                    return BadRequest("Invalid Age");
                }

                if (string.IsNullOrEmpty(newAuthor.FirstName) || string.IsNullOrEmpty(newAuthor.LastName))
                {
                    return BadRequest("Null values not accepted");

                }
                try
                {
                    _bContext.Add(newAuthor);
                    _bContext.SaveChanges();

                    return Ok(newAuthor);
                }
                catch (System.Exception innerEx)
                {

                    return BadRequest(innerEx.Message);
                }
            }
            catch (System.Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }

        //api/author/update
        [Route("Update")]
        [HttpPut]
        public IActionResult Edit(AuthorModel author)
        {
            try
            {
                var data = _bContext.Author.Find(author.Id);

                data.Id = author.Id;
                data.FirstName = author.FirstName;
                data.LastName = author.LastName;
                data.Age = author.Age;

                if (data.Age <= 0)
                {
                    return BadRequest("Invalid Age");
                }

                if (string.IsNullOrEmpty(data.FirstName) || string.IsNullOrEmpty(data.LastName))
                {
                    return BadRequest("Null values not accepted");

                }
                try
                {
                    _bContext.Author.Attach(data);
                    _bContext.SaveChanges();

                    return Ok(data);
                }
                catch (System.Exception innerEx)
                {

                    return BadRequest(innerEx.Message);
                }
            }
            catch (System.Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }

        //api/author/Delete/{id}
        [Route("Delete/{id}")]
        [HttpDelete]
        public IActionResult Delete(int Id)
        {
            try
            {
                var author = _bContext.Author.Find(Id);

                if (author is null)
                {
                    return BadRequest("No author was found");
                }

                _bContext.Author.Remove(author);
                _bContext.SaveChanges();

                return Ok("Author deleted sucessfully");
            }
            catch (System.Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }


    }
}
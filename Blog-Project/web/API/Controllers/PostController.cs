using System;
using System.Globalization;
using System.Linq;
using API.EFCore;
using API.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PostController : ControllerBase
    {
        private readonly blogContext _bContext;

        public PostController(blogContext bContext)
        {
            _bContext = bContext;
        }

        //api/post
        [HttpGet]
        public IActionResult GetAll()
        {
            // var allpost = _bContext.Post.ToList();
            try
            {
                var posts = _bContext.Post.ToList();
                Console.WriteLine(posts);
                if (posts is null)
                {
                    return BadRequest("No post was found");
                }
                return Ok(posts);
            }
            catch (System.Exception ex)
            {

                return BadRequest(ex.Message);
            }

            // return Ok(allpost);
        }

        [Route("Get/{id}")]
        [HttpGet]
        //api/post/get/id
        public IActionResult Get(int id)
        {
            var post = _bContext.Post.Find(id);

            if (post is null)
            {
                return BadRequest("No Data was found");
            }
            return Ok(post);
        }

        [Route("create")]
        [HttpPost]
        public IActionResult post(PostModel post)
        {
            try
            {
                Post newpost = new Post();
                newpost.Title = post.title;
                newpost.Author = post.author;
                newpost.CreatedAt = DateTime.Now.ToString("F", CultureInfo.CreateSpecificCulture("en-US"));
                newpost.Body= post.body;

                if (string.IsNullOrEmpty(newpost.Title) || 
                    string.IsNullOrEmpty(newpost.Body) || 
                    string.IsNullOrEmpty(newpost.Author)
                    )
                {
                    return BadRequest(" Please no null is accepted");
                }
                try
                {
                    _bContext.Post.Add(newpost);
                    _bContext.SaveChanges();

                    return Ok(newpost); 
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
        public IActionResult put(PostModel post)
        {
            try
            {
                var data = _bContext.Post.Find(post.id);
                if (data is null)
                {
                    return BadRequest("Incorrect Id");
                }
                data.Id = post.id;
                data.Title = post.title;
                data.Body = post.body;
                data.Author = post.author;

                if (string.IsNullOrEmpty(data.Title) ||
                    string.IsNullOrEmpty(data.Body) ||
                    string.IsNullOrEmpty(data.Author) ||
                    data.Id == 0
                    )
                {
                    return BadRequest(" Please null value is not accepted");
                }
                try
                {
                    
                    _bContext.Post.Attach(data);
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
            var post = _bContext.Post.Find(id);

            if (post is null)
            {
                return BadRequest("No Post was found");
            }

            _bContext.Post.Remove(post);
            _bContext.SaveChanges();

            return Ok("Post Deleted successfuly...");
        }
    }
}
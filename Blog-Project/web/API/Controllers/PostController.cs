using System.Data;
using System.Data.SqlClient;
using API.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PostController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public PostController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet]
        public JsonResult Get()
        {
            string query = @"
                select * from dbo.post
            ";
            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("BlogAppCon");
            SqlDataReader myReader;
            using(SqlConnection myCon = new SqlConnection(sqlDataSource))
            {
                myCon.Open();
                using(SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                    myCon.Close();
                }
            }

            return new JsonResult(table);
        }

        [HttpGet("{id}")]
        public JsonResult Get(int id)
        {
            string query = @"
                select * from dbo.post
                where id = @id
            ";
            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("BlogAppCon");
            SqlDataReader myReader;
            using (SqlConnection myCon = new SqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myCommand.Parameters.AddWithValue("@id", id);
                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                    myCon.Close();
                }
            }

            return new JsonResult(table);
        }

        [HttpPost]
        public JsonResult Post(Post post)
        {
            string query = @"
                insert into dbo.post
                values(@author, @title, @body, @created_at)
                
            ";
            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("BlogAppCon");
            SqlDataReader myReader;
            using (SqlConnection myCon = new SqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myCommand.Parameters.AddWithValue("@author", post.author);
                    myCommand.Parameters.AddWithValue("@title", post.title);
                    myCommand.Parameters.AddWithValue("@body", post.body);
                    myCommand.Parameters.AddWithValue("@created_at", post.created_at);
                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                    myCon.Close();
                }
            }

            return new JsonResult("Post Created Successfuly");
        }

        [HttpPut]
        public JsonResult Put(Post post)
        {
            string query = @"
                update dbo.Post
                set title = @title, author = @author, body = @body, created_at = @created_at
                where id = @id
                
            ";
            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("BlogAppCon");
            SqlDataReader myReader;
            using (SqlConnection myCon = new SqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myCommand.Parameters.AddWithValue("@id", post.id);
                    myCommand.Parameters.AddWithValue("@title", post.title);
                    myCommand.Parameters.AddWithValue("@author", post.author);
                    myCommand.Parameters.AddWithValue("@body", post.body);
                    myCommand.Parameters.AddWithValue("@created_at", post.created_at);
                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                    myCon.Close();
                }
            }

            return new JsonResult("Post Updated Successfuly");
        }

        [HttpDelete("{id}")]
        public JsonResult Delete(int id)
        {
            string query = @"
                delete from dbo.Post
                where id = @id
                
            ";
            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("BlogAppCon");
            SqlDataReader myReader;
            using (SqlConnection myCon = new SqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myCommand.Parameters.AddWithValue("@id", id);
                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                    myCon.Close();
                }
            }

            return new JsonResult("Post Deleted Successfuly");
        }
    }
}
namespace API.Models
{
    public class Post
    {
        public int id { get; set; }
        public string title { get; set; }
        public string body { get; set; }
        public string author { get; set; }
        public string created_at { get; set; }
    }
}
using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace API.EFCore
{
    public partial class Post
    {
        public string Author { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }
        public int Id { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}

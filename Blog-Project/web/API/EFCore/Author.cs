using System.ComponentModel.DataAnnotations;

namespace API.EFCore
{
    public class Author
    {
        public int Id { get; set; }

        [Required]
        [MaxLength(100)]
        public string FirstName { get; set; }

        [Required]
        [MaxLength(100)]
        public string LastName { get; set; }

        [Required]
        [MaxLength(10)]
        public int Age { get; set; }
    }
}
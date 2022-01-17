using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace API.EFCore
{
    public partial class Admin
    {
        public string Name { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }
        public int Id { get; set; }

        
    }
}

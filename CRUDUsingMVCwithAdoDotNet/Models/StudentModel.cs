using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CRUDUsingMVC.Models
{
    public class StudentModel
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Please Enter Name e.g.Supraja")]
        [StringLength(30, MinimumLength = 3)]
        public string Name { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        //[Compare("Email")]
        public string RetypeEmail { get; set; }
        [Required]
        [DisplayName("Phone Number")]
        public string Phone { get; set; }

        [Required, Display(Name = "Country")]
        public int Country { get; set; }

        [Required, Display(Name = "State")]
        public int State { get; set; }

        [Required, Display(Name = "City")]
        public int City { get; set; }


        //[Required]
        //[Display(Name = "Country")]
        //public string SelectedCountryIso3 { get; set; }
        //public IEnumerable<SelectListItem> Countries { get; set; }

        //[Required]
        //[Display(Name = "State")]
        //public string SelectedStateIso3 { get; set; }
        //public IEnumerable<SelectListItem> States { get; set; }

        //[Required]
        //[Display(Name = "City")]
        //public string SelectedCityIso3 { get; set; }
        //public IEnumerable<SelectListItem> cities { get; set; }

        [Required(ErrorMessage = "Please Provide Gender")]
        public string Gender { get; set; }


        //[Required]
        //public bool Course { get; set; }


    }
}
    

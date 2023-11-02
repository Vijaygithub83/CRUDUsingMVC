using CRUDUsingMVC.Models;
using CRUDUsingMVC.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CRUDUsingMVC.Controllers
{
    public class StudentController : Controller
    {
        // GET: Student
        public ActionResult Index()
        {
            StdRepository stdRepo = new StdRepository();
            //ModelState.Clear();
            return View(stdRepo.GetAllStudent());
        }

        // GET: Student/Details/5
        public ActionResult Details(int id)
        {
            StdRepository stdRepo = new StdRepository();
            //ModelState.Clear();
            return View(stdRepo.GetAllStudent().Find(std => std.Id == id));
        }

        public ActionResult FillState(int CountryId)
        {
            StdRepository stdRepo = new StdRepository();
            var stateList = stdRepo.GetStates(CountryId);
            
            ViewBag.StateList = stateList;

            return Json(stateList, JsonRequestBehavior.AllowGet);
        }
        public ActionResult FillCity(int StateId)
        {
            StdRepository stdRepo = new StdRepository();
            var CityList = stdRepo.GetCity(StateId);
            ViewBag.CityList = CityList;
            return Json(CityList, JsonRequestBehavior.AllowGet);
        }

        // GET: Student/Create
        public ActionResult Create()

        {

            StdRepository stdRepo = new StdRepository();
            var countryList = stdRepo.GetCountries();
            var StateList = stdRepo.GetStates(0);
            var cityList = stdRepo.GetCity(0);

            //StudentModel student = new StudentModel();
            //student.Countries = countryList;
            //student.States = StateList;
            //student.cities = cityList;

            ViewBag.CountryList= countryList;
            ViewBag.StateList = StateList;
            ViewBag.CityList = cityList;

            return View();

            
        }
        
        




        // POST: Student/Create
        [HttpPost]
        public ActionResult Create(StudentModel std)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    StdRepository stdRepo = new StdRepository();

                    if (stdRepo.Create(std))
                    {
                        ViewBag.Message = "Student details added successfully";
                    }
                }

                return View();
            }
            catch
            {
                return View();
            }
        }

        // GET: Student/Edit/5
        public ActionResult Edit(int id)
        {
            StdRepository stdRepo = new StdRepository();
            //ModelState.Clear();
            return View(stdRepo.GetAllStudent().Find(std => std.Id == id));
        }

        // POST: Student/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, StudentModel obj)
        {
            try
            {
                StdRepository stdRepo = new StdRepository();
                stdRepo.UpdateStudent(obj);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        public ActionResult Delete(int id)
        {
            StdRepository stdRepo = new StdRepository();
            //ModelState.Clear();
            return View(stdRepo.GetAllStudent().Find(std => std.Id == id));
        }
            // POST: Student/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, StudentModel obj)
        {
            try
            {
                StdRepository stdRepo = new StdRepository();
                if (stdRepo.DeleteStudent(id))
                {
                    ViewBag.AlertMsg = "Student details deleted successfully";

                }
                return RedirectToAction("Index");

            }
            catch
            {
                return View();
            }
        }
    }
}

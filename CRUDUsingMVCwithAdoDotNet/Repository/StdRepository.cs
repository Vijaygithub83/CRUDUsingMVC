using CRUDUsingMVC.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using CRUDUsingMVCwithAdoDotNet.Models;

namespace CRUDUsingMVC.Repository
{
    public class StdRepository
    {
        private SqlConnection con;
        private void connection()
        {
            string constr = ConfigurationManager.ConnectionStrings["getconn"].ToString();
            con = new SqlConnection(constr);

        }

        public bool Create(StudentModel obj)
        {

            connection();
            SqlCommand com = new SqlCommand("AddNewstdDetails", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Name", obj.Name);
            com.Parameters.AddWithValue("@Email", obj.Email);
            com.Parameters.AddWithValue("@RetypeEmail", obj.RetypeEmail);
            com.Parameters.AddWithValue("@Phone", obj.Phone);
            com.Parameters.AddWithValue("@Country", obj.Country);
            com.Parameters.AddWithValue("@State", obj.State);
            com.Parameters.AddWithValue("@City", obj.City);
            com.Parameters.AddWithValue("@Gender", obj.Gender);

            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
            {

                return true;

            }
            else
            {

                return false;
            }


        }

        public IList<Country> GetCountries()
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT CountryId,CountryName FROM Country";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                    }
                }
            }

            List<Country> countries = new List<Country>();

            foreach (DataRow row in dt.Rows)
            {
                countries.Add(new Country()
                {
                    CountryName = row["CountryName"].ToString(),
                    CountryId = Convert.ToInt32(row["CountryId"].ToString())
                });
            }

            return countries;

        }

        public IList<State> GetStates(int CountryId)
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = string.Empty;

                if (CountryId != 0)
                {
                    query = "SELECT StateId,StateName FROM countryState where CountryId=" + CountryId;
                }
                else
                {
                    query = "SELECT StateId,StateName FROM countryState";
                }
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                    }
                }
            }

            List<State> States = new List<State>();
            
            foreach (DataRow row in dt.Rows)
            {
                States.Add(new State()
                {
                    StateName = row["StateName"].ToString(),
                    StateId = Convert.ToInt32(row["StateId"].ToString()),
                });
            }

            return States;

        }

        public IList<City> GetCity(int StateId)
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = string.Empty;
                if (StateId!=0)
                {
                    query = "SELECT CityId,CityName FROM stateCity where StateId=" + StateId;
                }
                else
                {
                    query = "SELECT CityId,CityName FROM stateCity";
                }
                
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                    }
                }
            }

            List<City> Cities = new List<City>();

            foreach (DataRow row in dt.Rows)
            {
                Cities.Add(new City()
                {
                    CityName = row["CityName"].ToString(),
                    CityId = Convert.ToInt32(row["CityId"].ToString()),
                });
            }
            return Cities;
        }

        public List<StudentModel> GetAllStudent()
        {
            connection();
            List<StudentModel> stdList = new List<StudentModel>();


            SqlCommand com = new SqlCommand("Getstudentmvc", con);
            com.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();

            con.Open();
            da.Fill(dt);
            con.Close();
            foreach (DataRow dr in dt.Rows)
            {

                stdList.Add(

                    new StudentModel
                    {

                        Id = Convert.ToInt32(dr["Id"]),
                        Name = Convert.ToString(dr["Name"]),
                        Email = Convert.ToString(dr["Email"]),
                        RetypeEmail = Convert.ToString(dr["RetypeEmail"]),
                        Phone = Convert.ToString(dr["Phone"]),
                        Country = Convert.ToInt32(dr["Country"]),
                        State = Convert.ToInt32(dr["State"]),
                        City = Convert.ToInt32(dr["City"]),
                        Gender = Convert.ToString(dr["Gender"]),
                    }
                    );
            }

            return stdList;

        }

        public bool UpdateStudent(StudentModel obj)
        {

            connection();
            SqlCommand com = new SqlCommand("UpdatestdDetails", con);

            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Id", obj.Id);
            com.Parameters.AddWithValue("@Name", obj.Name);
            com.Parameters.AddWithValue("@Email", obj.Email);
            com.Parameters.AddWithValue("@RetypeEmail", obj.RetypeEmail);
            com.Parameters.AddWithValue("@Phone", obj.Phone);
            com.Parameters.AddWithValue("@Country", obj.Country);
            com.Parameters.AddWithValue("@State", obj.State);
            com.Parameters.AddWithValue("@City", obj.City);
            com.Parameters.AddWithValue("@Gender", obj.Gender);
            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
            {

                return true;

            }
            else
            {

                return false;
            }


        }
        public bool DeleteStudent(int Id)
        {

            connection();
            SqlCommand com = new SqlCommand("DeletestdById", con);

            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Id", Id);

            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
            {

                return true;

            }
            else
            {

                return false;
            }


        }
    }
}


using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School_Form
{
    public partial class FormDesign : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolForm"].ToString());
        SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["Country"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            if (con1.State == ConnectionState.Open)
            {
                con1.Close();
            }
            con1.Open();

            if (!IsPostBack)
            {
                loadcountry();
            }

        }

        private void loadcountry()
        {
            string CountryQurey = "select * from Countries";
            SqlCommand cmd = new SqlCommand(CountryQurey, con1);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dtCountry = new DataTable();
            ad.Fill(dtCountry);
            cmd.ExecuteNonQuery();
            if (dtCountry.Rows.Count > 0)
            {
                ddlCountry.DataSource = dtCountry;
                ddlCountry.DataValueField = "CountryID";
                ddlCountry.DataTextField = "CountryName";
                ddlCountry.DataBind();
                ddlCountry.Items.Insert(0, new ListItem("Select Country", "0"));
            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            StateRegion.Items.Clear();
            loadStates(Convert.ToInt32(ddlCountry.SelectedValue));
        }
        private void loadStates(int CountryID)
        {
            string StateQurey = "select * from TBL_STATE where CountryId=" + CountryID + "";
            SqlCommand cmd = new SqlCommand(StateQurey, con1);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dtStates = new DataTable();
            ad.Fill(dtStates);
            cmd.ExecuteNonQuery();
            if (dtStates.Rows.Count > 0)
            {
                StateRegion.DataSource = dtStates;
                StateRegion.DataValueField = "ID";
                StateRegion.DataTextField = "STATENAME";
                StateRegion.DataBind();
                StateRegion.Items.Insert(0, new ListItem("Select State", "0"));
            }
        }

        protected void StateRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCity.Items.Clear();  
            loadCity(Convert.ToInt32(StateRegion.SelectedValue));
        }
        private void loadCity(int StateID)
        {
            string CityQurey = "select * from Cities where StatesID=" +StateID+ "";
            SqlCommand cmd = new SqlCommand(CityQurey, con1);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dtCity = new DataTable();
            ad.Fill(dtCity);
            cmd.ExecuteNonQuery();
            if (dtCity.Rows.Count > 0)
            {
                ddlCity.DataSource = dtCity;
                ddlCity.DataValueField = "CityID";
                ddlCity.DataTextField = "Cities";
                ddlCity.DataBind();
                ddlCity.Items.Insert(0, new ListItem("Select City", "0"));
            }
        }

        protected void radioMedical_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (radioMedical.SelectedValue == "Yes")
            {
                txtProvideMedicalInfo.Visible = true;
            }
            else
            {
                txtProvideMedicalInfo.Visible = false;
            }
        }

        protected void FoodAllergy_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (FoodAllergy.SelectedValue == "Yes")
            {
                txtFoodAllergyDetails.Visible = true;
            }
            else
            {
                txtFoodAllergyDetails.Visible = false;
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string schoolQurey = " [dbo].[StudentData] 'INSERT' , 0,'" + txtStudentFirstName.Text + "','" + StudentLastName.Text + "','" + StudentGrade.Text + "','" + ParentFirstName.Text + "','" + ParentLastName.Text + "','" + contact.Text + "','" + EmergencyContact.Text + "','" + StreetAddress.Text + "','" + AddressLine2.Text + "','" + ddlCity.Text + "'," + PostalCode.Text + ",'" + StateRegion.Text + "','" + ddlCountry.Text + "','" + ExcursionPlace.Text + "','" + radioMedical.Text + "','" + MedicalDetails.Text + "','" + MealRequirement.Text + "','" + FoodAllergy.Text + "','" + FoodAllergyDetails.Text + "'";
            SqlCommand cmd = new SqlCommand(schoolQurey, con);
            cmd.ExecuteNonQuery();

            txtStudentFirstName.Text = "";
            StudentLastName.Text = "";
            StudentGrade.SelectedValue = "0";
            ParentFirstName.Text = "";
            ParentLastName.Text = "";
            contact.Text = "";
            EmergencyContact.Text = "";
            StreetAddress.Text = "";
            AddressLine2.Text = "";
            ddlCity.SelectedValue = "0";
            PostalCode.Text = "";
            StateRegion.SelectedValue = "0";
            ddlCountry.SelectedValue = "0";
            ExcursionPlace.Text = "";
            MedicalDetails.Text = "";
            MealRequirement.Text = "";
            FoodAllergyDetails.Text = "";
        }

    }
}
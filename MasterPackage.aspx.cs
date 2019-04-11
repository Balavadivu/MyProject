using BusinessLayer;
using Newtonsoft.Json;
using ObjectLibrary;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DocumentManagementSystem.EmployeePages
{
    public partial class MasterPackage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["event"] != null && Request.Form["event"] == "GetCategory")
            {
                Response.Clear();
                Response.Write(GetCategory());
                Response.End();
            }
            if (Request.Form["event"] != null && Request.Form["event"] == "GetsubCategory")
            {
                Response.Clear();
                Response.Write(GetsubCategory());
                Response.End();
            }
        }

        public string GetsubCategory()
        {
            try
            {
                string Result = string.Empty;
                string Event = "";
                DataTable dt = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var ds = mgr.GetsubCategory();
                if (ds.Tables[0].Rows.Count >= 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr["TypeName"].ToString() == "SubCategory")
                        {
                            Event += "<option value='" + dr["ID"] + "'>" + dr["Name"] + "</option>";
                        }
                    }
                    Result = Event;
                }
                else
                {
                    Result = "NoData";
                }
                return Result;
            }
            catch (Exception Ex)
            {
                // return "Failure";
                return Ex.Message;
            }
            
        }     
        public string GetCategory()
        {
            try
            {
                string Result = string.Empty;
                string Event = "";
                DataTable dt = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var ds = mgr.GetCategory();
                if (ds.Tables[0].Rows.Count >= 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr["TypeName"].ToString() == "Category")
                        {
                            Event += "<option value='" + dr["ID"] + "'>" + dr["Name"] + "</option>";
                        }
                    }
                    Result = Event;
                }
                else
                {
                    Result = "NoData";
                }
                return Result;
            }
            catch (Exception Ex)
            {
                // return "Failure";
                return Ex.Message;
            }
        }
        [WebMethod]
        public static string SaveMasterPackage(clsCommonPackage objMasterPackage)
        {
            try
            {
                //string result="";
                BusinessManager mgr = new BusinessManager();
                return (mgr.SaveMasterPackageDetails(objMasterPackage));
            }
            catch (Exception ex)
            {
                throw ex;
            }

            //objbm = objemployeedetails;
            //bo obj = new bo();
            //string s = obj.add_customer_enquiry(param);
            //return s;

        }
        [WebMethod]
        public static string GetMasterPackageDetails(long ID)
        {
            try
            {
                DataTable ds = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var dt = (mgr.GetMasterPackageDetails(ID));
                return JsonConvert.SerializeObject(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
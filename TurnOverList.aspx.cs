using BusinessLayer;
using Newtonsoft.Json;
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
    public partial class TurnOverList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["event"] != null && Request.Form["event"] == "GetTurnOverList")
            {
                Response.Clear();
                Response.Write(GetTurnOverList());
                Response.End();
            }
        }

        public string GetTurnOverList()
        {
            BusinessManager mgrTurnOver = new BusinessManager();
            var dtReturndata = mgrTurnOver.GetTurnOverList();
            return JsonConvert.SerializeObject(dtReturndata);
        }
        [WebMethod]
        public static string GetTurnOverCompany(long CompanyId)
        {
            try
            {
                DataSet ds = new DataSet();
                BusinessManager mgr = new BusinessManager();
                var st = (mgr.GetTurnOverCompany(CompanyId));
                return JsonConvert.SerializeObject(st);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [WebMethod]
        public static string GetEmailBasedDropDown(string EmailId)
        {
            try
            {
                DataSet ds = new DataSet();
                BusinessManager mgr = new BusinessManager();
                var st = (mgr.GetEmailBasedDropDown(EmailId));
                return JsonConvert.SerializeObject(st);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
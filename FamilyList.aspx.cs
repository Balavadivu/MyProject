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
    public partial class FamilyList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["event"] != null && Request.Form["event"] == "GetFamilyList")
            {
                Response.Clear();
                Response.Write(GetFamilyList());
                Response.End();
            }
        }

        public string GetFamilyList()
        {
            BusinessManager mgrFamilyDetail = new BusinessManager();
            var dtReturndata = mgrFamilyDetail.GetFamilyDetail();
            return JsonConvert.SerializeObject(dtReturndata); ;
        }

        [WebMethod]
        public static string GetSubFamilyMember(long intEmployeeid)
        {
            try
            {
                DataTable ds = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var dt = (mgr.GetSubFamilyMember(intEmployeeid));
                return JsonConvert.SerializeObject(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [WebMethod]
        public static string GetFamilyCompanyList(long CompanyId)
        {
            try
            {
                DataSet ds = new DataSet();
                BusinessManager mgr = new BusinessManager();
                var st = (mgr.GetFamilyCompanyList(CompanyId));
                return JsonConvert.SerializeObject(st);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        //public string GetPendingMailsDetails(long userId, string strSubject)
        //{
        //    BusinessManager mgrFamilyDetail = new BusinessManager();
        //    //contact.SendAllMail(objclsMassMail);
        //    //return JsonConvert.SerializeObject(contact.GetPendingMailsDetails(userId, strSubject));
        //}
    }
}
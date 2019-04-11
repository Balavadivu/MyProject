using BusinessLayer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DocumentManagementSystem.EmployeePages
{
    public partial class MasterPackageList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["event"] != null && Request.Form["event"] == "GetMasterPackageList")
            {
                Response.Clear();
                Response.Write(GetMasterPackageList());
                Response.End();
            }

        }

        public string GetMasterPackageList()
        {
            BusinessManager mgrTurnOver = new BusinessManager();
            var dtReturndata = mgrTurnOver.GetMasterPackageList();
            return JsonConvert.SerializeObject(dtReturndata);
        }
    }
}
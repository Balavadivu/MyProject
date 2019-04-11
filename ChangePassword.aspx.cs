using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DocumentManagementSystem.EmployeePages
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string ExternalChangePassword(long ClientId, string Password)
        {
            try
            {
                BusinessManager mgr = new BusinessManager();
                return (mgr.ChangePassword(ClientId, Password));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
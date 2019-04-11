using BusinessLayer;
using Newtonsoft.Json;
using ObjectLibrary;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace DocumentManagementSystem.EmployeePages
{
    public partial class BulkEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // GetClientData();
        }

        [WebMethod]
        public static string GetEmployeeData()
        {
            try
            {
                DataTable dt = new DataTable();
                BusinessManager mgrClient = new BusinessManager();
                var ds = mgrClient.GetEmployeeData();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                // return serializer.Serialize(ds);  
                return JsonConvert.SerializeObject(ds);
            }
            catch (Exception Ex)
            {
                return "Failure";
            }
        }

        //[System.Web.Services.WebMethod]
        //public static string SaveFrmDetails(List<TestEmployee> Testemployee)
        //{
        //    string connectionString = ConfigurationManager.ConnectionStrings["Main.ConnectionString.Dev"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(connectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("INSERT INTO tbl_Test1(FirstName, LastName, Job, City, state) VALUES (@FirstName, @LastName, @Job, @City, @State )", con))
        //        {                    
        //            for (int i = 0; i < Testemployee.Count; i++)
        //            {
        //                cmd.CommandType = CommandType.Text;
        //                cmd.Parameters.Clear();
        //                cmd.Parameters.AddWithValue("@FirstName", Testemployee[i].FirstName);
        //                cmd.Parameters.AddWithValue("@LastName", Testemployee[i].LastName);
        //                cmd.Parameters.AddWithValue("@Job", Testemployee[i].Job);
        //                cmd.Parameters.AddWithValue("@City", Testemployee[i].City);
        //                cmd.Parameters.AddWithValue("@State", Testemployee[i].State);
        //                cmd.Connection = con;
        //                con.Open();
        //                cmd.ExecuteNonQuery();
        //                con.Close();

        //            }                    

        //        }

        //    }
        //    return Testemployee.ToString();

        //}

        [System.Web.Services.WebMethod]
        public static string UpdateFrmDetails(List<UpdateEmployeeStatus> Testemployee)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Main.ConnectionString.Dev"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE MasterEmployee SET bitStatus = @bitStatus Where intemployeeID = @intemployeeID", con))
                {
                    for (int i = 0; i < Testemployee.Count; i++)
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("@intemployeeID", Testemployee[i].intemployeeID);
                        cmd.Parameters.AddWithValue("@bitStatus", Testemployee[i].bitStatus);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }

                }

            }
            return Testemployee.ToString();

        }


        [WebMethod]
        public static string UpdateemployeeBitStatus(int intEmployeeID)
        {
            DataTable dtoldvalue = new DataTable();

            try
            {
                BusinessManager mgr = new BusinessManager();
                return (mgr.UpdateemployeeBitStatus(intEmployeeID));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public static string AlertMailFromInternalUser(long ClientId)
        {
            try
            {
                string Subject = "Welcome to James And Associates";
                var CompanyName = "";
                var ClientMailId = "";
                var ClientPassword = "";
                var ClientUserName = "";
                var clientId = 0;

                BusinessManager mgr = new BusinessManager();
                var dt = (mgr.GetclientRegsiter(ClientId));
                JsonConvert.SerializeObject(dt);

                foreach (DataRow drow in dt.Rows)
                {
                    CompanyName = drow["vchClientName"].ToString();
                    ClientMailId = drow["vchEmail"].ToString();
                    ClientPassword = drow["ClientPassword"].ToString();
                    ClientUserName = drow["userName"].ToString();
                    clientId = Convert.ToInt32(drow["intCID"]);

                }

                using (MailMessage mail = new MailMessage())
                {
                    string body = string.Empty;
                    using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/UploadImage/template/Email_Template.html")))
                    {
                        body = reader.ReadToEnd();
                    }
                    body = body.Replace("{logo}", "http://demo8.templecitytech.com/UploadImage/Jameslogo.jpg");

                    body = body.Replace("{CompanyName}", CompanyName);
                    body = body.Replace("{ClientUserName}", ClientUserName);
                    body = body.Replace("{content1}", "This client " + ClientUserName + " Added the Employee Please Check");
                    body = body.Replace("{boldcontent1}", ClientUserName);
                    body = body.Replace("{content2}", " <br/> Password ");//
                    body = body.Replace("{boldcontent2}", ClientPassword);//


                    body = body.Replace("{content3}", " If you have any problems using our services, click here for our support services or call ");
                    body = body.Replace("{reflink1}", "http://www.jaa-sxm.com/online");

                    var url = HttpContext.Current.Request.Url.Authority;
                    var httpcontent = "http://";
                    var LoginPage = "/ClientLogin.aspx";
                    var LoginUrl = httpcontent + url + LoginPage;
                    //body = body.Replace("{refActivelink1}", "http://localhost:52723/ClientLogin.aspx?data=" + clientId);
                    body = body.Replace("{refActivelink1}", "" + LoginUrl + "?data=" + clientId);


                    body = body.Replace("{signature}", "James and Associates");

                    var FileName1 = HttpContext.Current.Server.MapPath("~/UploadImage/") + "TestXml.xml";
                    // var newFileName = HttpContext.Current.Server.MapPath(@"C:\TestXml.xml");



                    mail.Body = body;
                    mail.To.Clear();
                    mail.To.Add(new MailAddress(ClientMailId));

                    mail.From = new MailAddress(ConfigurationManager.AppSettings["smtpFromUser"]);
                    mail.Subject = Subject;

                    mail.IsBodyHtml = true;

                    SmtpClient smtp = new SmtpClient();
                    smtp.EnableSsl = true;
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.UseDefaultCredentials = true;

                    smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["smtpFromUser"], ConfigurationManager.AppSettings["smtpPass"]);
                    // smtp.Credentials = new System.Net.NetworkCredential(ClientMailId, ClientPassword);
                    smtp.EnableSsl = true;
                    smtp.Send(mail);

                    smtp.Dispose();

                }
                return "Success";

            }

            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}

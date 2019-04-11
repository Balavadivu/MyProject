using BusinessLayer;
using Newtonsoft.Json;
using ObjectLibrary;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DocumentManagementSystem.EmployeePages
{
    public partial class FamilyDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["event"] != null && Request.Form["event"] == "GetDropDownEmployee")
            {
                Response.Clear();
                Response.Write(GetDropDownEmployee());
                Response.End();
            }
            if (Request.Form["event"] != null && Request.Form["event"] == "GetClientBasedEmployee")
            {
                Response.Clear();
                Response.Write(GetClientBasedEmployee(ClientId));
                Response.End();
            }
            if (Request.Form["event"] != null && Request.Form["event"] == "GetClient")
            {
                Response.Clear();
                Response.Write(GetClient());
                Response.End();
            }
        }

        public string GetClient()
        {
            try
            {
                string Result = string.Empty;
                string Event = "";
                DataTable dt = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var ds = mgr.GetDropDownClientList();
                if (ds.Tables[0].Rows.Count >= 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr["TypeName"].ToString() == "CLIENT")
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

        public string GetDropDownEmployee()
        {
            try
            {
                string Result = string.Empty;
                string Event = "";
                DataTable dt = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var ds = mgr.GetDropDownEmployeeList();
                if (ds.Tables[0].Rows.Count >= 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr["TypeName"].ToString() == "Employee")
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
        public static string GetClientBasedEmployee(long ClientId)
        {
            try
            {
                string Result = string.Empty;
                string Event = "";
                DataTable dt = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var ds = mgr.GetClientBasedEmployee(ClientId);
                if (ds.Tables[0].Rows.Count >= 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr["TypeName"].ToString() == "Employee")
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
        public static string SaveFamily(CommonFamily objFamily)
        {
            try
            {
                //string result="";
                BusinessManager mgr = new BusinessManager();
                return (mgr.SaveFamilyDetails(objFamily));
            }
            catch (Exception ex)
            {
                throw ex;
            }

            //objBM = objEmployeeDetails;
            //BO obj = new BO();
            //string s = obj.Add_Customer_Enquiry(param);
            //return s;

        }
        [WebMethod]
        public static string GetAddSubFamilyMember(long intEmployeeId)
        {
            try
            {
                DataTable ds = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var dt = (mgr.GetAddSubFamilyMember(intEmployeeId));
                return JsonConvert.SerializeObject(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [WebMethod]
        public static string GetSubFamilyMemberLink(long EmployeeID, string Mode)
        {
            try
            {
                string excelResult = "";
                string Subject = "Family List";
                var CompanyName = "";
                var MainBody = "";
                var CommonURL = "";
                DataTable dt = new DataTable();
                BusinessManager mgrEmployee = new BusinessManager();
                var dtReturndata = mgrEmployee.GetSubMembarEdit(EmployeeID);
                JsonConvert.SerializeObject(dtReturndata);
                if (dtReturndata.Rows.Count > 0)
                {
                    if (Mode == "update")
                    {
                        CommonURL = HttpContext.Current.Request.UrlReferrer.ToString();
                    }
                    else
                    {
                        var url1 = HttpContext.Current.Request.UrlReferrer.ToString();
                        var urlContent = ("?id=" +  EmployeeID);
                        CommonURL = url1 + urlContent;
                    }
                    
                    // dtReturndata.TableName = "Employee Data";             
                    string path = HttpContext.Current.Server.MapPath("~/UploadImage");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    //DataSet ds = new DataSet();
                    //ds.Tables.Add(dtReturndata);
                    foreach (DataRow drow in dtReturndata.Rows)
                    {
                        CompanyName = drow["vchclientName"].ToString();
                    }
                    if (Mode == "Update")
                    {
                        MainBody = "The client " + "<b>" + CompanyName + "</b>" + " has modified the following data in Family screen";
                    }
                    else
                    {
                        MainBody = "The client " + "<b>" + CompanyName + "</b>" + " has Added the following data in Family screen";
                    }
                    using (MailMessage mail = new MailMessage())
                    {
                        mail.To.Clear();
                        mail.To.Add(ConfigurationManager.AppSettings["AgreementEmail"]);
                        //mail.To.Add(ConfigurationManager.AppSettings["ConfirmMailTo1"]);
                        mail.From = new MailAddress(ConfigurationManager.AppSettings["smtpFromUser"]);
                        mail.Subject = Subject;
                        mail.Body = MainBody + "<br><br>" + CommonURL;
                        //mail.Attachments.Add(new Attachment(fullfilename));
                        //mail.Attachement.Add(path);
                        mail.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.EnableSsl = true;
                        smtp.Host = "smtp.gmail.com";
                        smtp.Port = 587;
                        smtp.UseDefaultCredentials = false;
                        smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["smtpFromUser"], ConfigurationManager.AppSettings["smtpPass"]);
                        smtp.EnableSsl = true;
                        smtp.Send(mail);

                        smtp.Dispose();
                    }

                }
                return excelResult = "Success";
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
        [WebMethod]
        public static string Getemployee(long EmployeeId)
        {
            try
            {
                string Result = string.Empty;
                string Event = "";
                DataSet ds = new DataSet();
                BusinessManager mgr = new BusinessManager();
                var dt = (mgr.Getemployee(EmployeeId));
                if (dt.Tables[0].Rows.Count >= 0)
                {
                    foreach (DataRow dr in dt.Tables[0].Rows)
                    {
                        if (dr["TypeName"].ToString() == "Employee")
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
                //return JsonConvert.SerializeObject(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public static string GetSubMembarEdit(long intFamilyDetailId)
        {
            try
            {
                DataTable ds = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var dt = (mgr.GetSubMembarEdit(intFamilyDetailId));
                return JsonConvert.SerializeObject(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [WebMethod]
        public static string GetfamiyLink(long EmployeeID, long ID1, string Mode)
        {
            try
            {
                string excelResult = "";
                string Subject = "Family List";
                var CompanyName = "";
                var MainBody = "";
                DataTable dt = new DataTable();
                BusinessManager mgrEmployee = new BusinessManager();
                var dtReturndata = mgrEmployee.GetEmailLink(ID1);
                JsonConvert.SerializeObject(dtReturndata);
                if (dtReturndata.Rows.Count > 0)
                {
                    var url = HttpContext.Current.Request.UrlReferrer;  
                    // dtReturndata.TableName = "Employee Data";             
                    string path = HttpContext.Current.Server.MapPath("~/UploadImage");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    DataSet ds = new DataSet();
                    ds.Tables.Add(dtReturndata);
                    foreach (DataRow drow in ds.Tables[0].Rows)
                    {
                        CompanyName = drow["ClientName"].ToString();
                    }
                    if (Mode == "update")
                    {
                        MainBody = "The client " + "<b>" + CompanyName + "</b>" + " has modified the following data in Family screen";
                    }
                    if (Mode == "Add")
                    {
                        MainBody = "The client " + "<b>" + CompanyName + "</b>" + " has Added the following data in Family screen";
                    }
                    using (MailMessage mail = new MailMessage())
                    {
                        mail.To.Clear();
                        mail.To.Add(ConfigurationManager.AppSettings["AgreementEmail"]);
                        //mail.To.Add(ConfigurationManager.AppSettings["ConfirmMailTo1"]);
                        mail.From = new MailAddress(ConfigurationManager.AppSettings["smtpFromUser"]);
                        mail.Subject = Subject;
                        mail.Body = MainBody + "<br><br>" + url;
                        //mail.Attachments.Add(new Attachment(fullfilename));
                        //mail.Attachement.Add(path);
                        mail.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.EnableSsl = true;
                        smtp.Host = "smtp.gmail.com";
                        smtp.Port = 587;
                        smtp.UseDefaultCredentials = false;
                        smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["smtpFromUser"], ConfigurationManager.AppSettings["smtpPass"]);
                        smtp.EnableSsl = true;
                        smtp.Send(mail);

                        smtp.Dispose();
                    }

                }
                return excelResult = "Success";
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
        [WebMethod]
        public static string SynchronizedFamilyConfirmationMail(long EmployeeIds1, long FamilyId)
        {
            var CompanyName = "";            
            string Result = "";
            string Subject = "FamilyDetails Synchronized Success";
            var ClientEmailId = "";
            
            try
            {
                BusinessManager mgrEmployee = new BusinessManager();
                var dtReturndata = mgrEmployee.SynchronizedFamilyConfirmationMail(EmployeeIds1, FamilyId);
                JsonConvert.SerializeObject(dtReturndata);
                foreach (DataRow drow in dtReturndata.Tables[0].Rows)
                {
                    CompanyName = drow["vchClientName"].ToString();
                    ClientEmailId = drow["vchEmail"].ToString();
                }
                
                string MainBody = "<b>" + CompanyName + "</b>" + " Your  Family has Registered";
                
                using (MailMessage mail = new MailMessage())
                {
                    mail.To.Clear();
                    mail.To.Add(ClientEmailId);
                    //mail.To.Add(ConfigurationManager.AppSettings["ConfirmMailTo1"]);
                    mail.From = new MailAddress(ConfigurationManager.AppSettings["smtpFromUser"]);
                    mail.Subject = Subject;
                    mail.Body = MainBody;
                    //mail.Attachments.Add(new Attachment(fullfilename))+ "<br><br>" + CommonURL;
                    //mail.Attachement.Add(path);
                    mail.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.EnableSsl = true;
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["smtpFromUser"], ConfigurationManager.AppSettings["smtpPass"]);
                    smtp.EnableSsl = true;
                    smtp.Send(mail);

                    smtp.Dispose();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return Result;
        }

     

        public long ClientId { get; set; }
    }
}
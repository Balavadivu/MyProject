using BusinessLayer;
using Bytescout.Spreadsheet;
using Newtonsoft.Json;
using ObjectLibrary;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DocumentManagementSystem.EmployeePages
{
    public partial class TurnOverDecelartion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["event"] != null && Request.Form["event"] == "GetDropDownClient")
            {
                Response.Clear();
                Response.Write(GetDropDownClient());
                Response.End();
            }
            if (Request.Form["event"] != null && Request.Form["event"] == "GetDropDownTaxType")
            {
                Response.Clear();
                Response.Write(GetDropDownTaxType());
                Response.End();
            }
            if (Request.Form["event"] != null && Request.Form["event"] == "GetDropDownCurrency")
            {
                Response.Clear();
                Response.Write(GetDropDownCurrency());
                Response.End();
            }
        }

        public string GetDropDownCurrency()
        {
            try
            {
                string Result = string.Empty;
                string Event = "";
                DataTable dt = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var ds = mgr.GetDropDownCurrencyList();
                if (ds.Tables[0].Rows.Count >= 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr["TypeName"].ToString() == "Currency")
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

        public string GetDropDownTaxType()
        {
            try
            {
                string Result = string.Empty;
                string Event = "";
                DataTable dt = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var ds = mgr.GetDropDownTaxTypeList();
                if (ds.Tables[0].Rows.Count >= 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr["TypeName"].ToString() == "TAX")
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

        public string GetDropDownClient()
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


        [WebMethod]
        public static string saveturnover(clscommonTurnOver objTurnOver)
        {
            try
            {
                //string result="";
                BusinessManager mgr = new BusinessManager();
                return (mgr.SaveTurnOverDetails(objTurnOver));
            }
            catch (Exception ex)
            {
                throw ex;
            }           
        }


        [WebMethod]
        public static string GetTurnOverDecelartion(long ID)
        {
            try
            {
                DataTable ds = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var dt = (mgr.GetTurnOverDecelartionEdit(ID));
                return JsonConvert.SerializeObject(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public static string GetEmailTurnOver(long EmployeeID, string Mode)
        {

            try
            {
                string excelResult = "";
                string Subject = "TurnOver List";
                var CompanyName = "";
                var MainBody = "";
                var CommonURL = "";
                
                BusinessManager mgr = new BusinessManager();
                var dt = (mgr.GetEmailTurnOver(EmployeeID));
                JsonConvert.SerializeObject(dt);
                if (Mode == "update")
                {
                    CommonURL = HttpContext.Current.Request.UrlReferrer.ToString();
                }
                else
                {
                    var url1 = HttpContext.Current.Request.UrlReferrer.ToString();
                    var urlContent = ("?id=" + EmployeeID);
                    CommonURL = url1 + urlContent;
                }                                          
                string path = HttpContext.Current.Server.MapPath("~/UploadImage");               
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                DataSet ds = new DataSet();
                ds.Tables.Add(dt);
                foreach (DataRow drow in ds.Tables[0].Rows)
                {
                    CompanyName = drow["ClientName"].ToString();
                    //CompanyName = "<b>" + CompanyName + "</b>";
                }

                const string fileName = "Employee.xlsx";
                string fullfilename = Path.Combine(path, fileName);

                if (File.Exists(fullfilename))
                { File.Delete(fullfilename); }


                //Spreadsheet spreadsheet = new Spreadsheet();
                //spreadsheet.ImportFromDataSet(ds);


                ////FORMATTING PLANNED DAYS SHEET WITH HEADERS.
                //Worksheet worksheetByName1 = spreadsheet.Workbook.Worksheets.ByName("Employee Data");

                //// Add new row
                //worksheetByName1.Rows.Insert(0, 1);

                //int count = 0;
                //worksheetByName1.Rows[0].Font = new System.Drawing.Font("Arial", 10, FontStyle.Bold);
                //for (var col = 0; col < ds.Tables[0].Columns.Count; col++)
                //{
                //    worksheetByName1.Cell(0, col).Value = ds.Tables[0].Columns[col].ColumnName;
                //    worksheetByName1.Columns[col].AutoFit();
                //}

                if (Mode == "update")
                {
                    MainBody = "The client " + "<b>" + CompanyName + "</b>" + " has modified the following data in TurnOver Declaration screen";
                }
                else
                {
                    MainBody = "The client " + "<b>" + CompanyName + "</b>" + " has Added the following data in TurnOver Declaration screen";
                }

                //spreadsheet.SaveAs(fullfilename);
                //spreadsheet.Close();
                // Process.Start(fileName);
                // return dtReturndata
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
                return excelResult = "Success";

            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public static string SynchronizedTurnOverConfirmationMail(long ID, long clientid)
        {
            string Result = "";
            string Subject = "TurnOverDetail Synchronized Success";

            var CompanyName = "";
            var ClientEmailId = "";
            //var EmployeeFirstName = "";
            //var EmployeeLastName = "";
            //var EmployeeName = "";
            try
            {
                BusinessManager mgrEmployee = new BusinessManager();
                var dtReturndata = mgrEmployee.SynchronizedTurnOverConfirmationMail(ID, clientid);
                JsonConvert.SerializeObject(dtReturndata);
                foreach (DataRow drow in dtReturndata.Tables[0].Rows)
                {
                    CompanyName = drow["vchClientName"].ToString();
                    ClientEmailId = drow["vchEmail"].ToString();
                    //EmployeeFirstName = drow["strEmployeeFirstName"].ToString();
                    //EmployeeLastName = drow["strEmployeLastName"].ToString();
                }
                //EmployeeName = EmployeeFirstName + " " + EmployeeLastName;
                string MainBody =  "<b>" + CompanyName + "</b>" + " Your  TurnOver has Registered";
                //string MainBody = "Your"  +(EmployeeName)+"  Employee has Register";
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
    }
}
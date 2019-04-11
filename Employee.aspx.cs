using BusinessLayer;
using Bytescout.Spreadsheet;
using Newtonsoft.Json;
using System;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Net.Mail;
using System.Web;
using System.Web.Services;


namespace DocumentManagementSystem.EmployeePages
{
    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["event"] != null && Request.Form["event"] == "GetEmployeeList")
            {
                Response.Clear();
                Response.Write(GetEmployeeList());
                Response.End();
            }
            if (Request.Form["event"] != null && Request.Form["event"] == "GetDropDownPlaceBirth")
            {
                Response.Clear();
                Response.Write(GetDropDownPlaceBirth());
                Response.End();
            }
            if (Request.Form["event"] != null && Request.Form["event"] == "GetStatus")
            {
                Response.Clear();
                Response.Write(GetStatus());
                Response.End();
            }
            if (Request.Form["event"] != null && Request.Form["event"] == "GetDropDownWagePeriod")
            {
                Response.Clear();
                Response.Write(GetWagePeriod());
                Response.End();
            }


        }


        //[WebMethod]
        public string GetEmployeeList()
        {
            BusinessManager mgrClient = new BusinessManager();
            var dtReturndata = mgrClient.GetEmployeeList();
            return JsonConvert.SerializeObject(dtReturndata);
        }
        public string GetWagePeriod()
        {
            try
            {
                string Result = string.Empty;
                string Event = "";
                DataTable dt = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var ds = mgr.GetWagePeriod();
                if (ds.Tables[0].Rows.Count >= 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr["TypeName"].ToString() == "WagePeriod")
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
        public string GetStatus()
        {
            try
            {
                string Result = string.Empty;
                string Event = "";
                DataTable dt = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var ds = mgr.GetStatus();
                if (ds.Tables[0].Rows.Count >= 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr["TypeName"].ToString() == "Status")
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
        public static string GetStatusEmployeeList(long StatusId)
        {
            try
            {
                DataSet ds = new DataSet();
                BusinessManager mgr = new BusinessManager();
                var st = (mgr.GetStatusEmployeeList(StatusId));
                return JsonConvert.SerializeObject(st);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public string GetDropDownPlaceBirth()
        {
            try
            {
                string Result = string.Empty;
                string Event = "";
                DataTable dt = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var ds = mgr.GetDropDownPlaceOfBirth();
                if (ds.Tables[0].Rows.Count >= 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr["TypeName"].ToString() == "PlaceOfBirth")
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
        public static string GetCompanyList(long CompanyId)
        {
            try
            {
                DataSet ds = new DataSet();
                BusinessManager mgr = new BusinessManager();
                var st = (mgr.GetCompanyList(CompanyId));
                return JsonConvert.SerializeObject(st);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        [WebMethod]
        public static string GetClientIdBasedDropDownCompany(int ClientID)
        {
            try
            {
                DataSet ds = new DataSet();
                BusinessManager mgr = new BusinessManager();
                var st = (mgr.GetClientIdBasedDropDownCompany(ClientID));
                return JsonConvert.SerializeObject(st);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        [WebMethod]
        public static string ValidateTrialEmployee(string clientid)
        {
            string trial = "";
            try
            {
                DataSet ds = new DataSet();
                BusinessManager mgr = new BusinessManager();
                var st = (mgr.GetClientAdd(clientid));
                if (st != null)
                {
                    return JsonConvert.SerializeObject(st);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return trial;
        }
        [WebMethod]
        public static DataTable GetExportData(long intStatusId)
        {
            try
            {
                string excelResult = "";

                string Subject = "Employee synchronized List Attachment";
                var MainBody = "";
                //Attachment attachements = new Attachment();
                BusinessManager mgrEmployee = new BusinessManager();
                var dtReturndata = mgrEmployee.GetExportData(intStatusId);
                JsonConvert.SerializeObject(dtReturndata);
                //DataTable periodicTable = GetDataTable();
                // DataTable ds = dtReturndata;
                dtReturndata.TableName = "Employee Data";
                //dtReturndata1.Tables.Add(dtReturndata.Tables[0].Copy());
                string path = HttpContext.Current.Server.MapPath("~/UploadImage");
                //if (System.IO.File.Exists(path + "Employee.xls"))
                //{
                //    File.Delete(path + "Employee.xls"); path +"\\"+
                //}

                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                DataSet ds = new DataSet();
                ds.Tables.Add(dtReturndata);
                //DateTime dateTime = DateTime.UtcNow.Date;

                const string fileName = "Employee.xlsx";
                string fullfilename = Path.Combine(path, fileName);

                if (File.Exists(fullfilename))
                { File.Delete(fullfilename); }


                Spreadsheet spreadsheet = new Spreadsheet();

                //spreadsheet.ImportFromDataTable(dtReturndata);

                spreadsheet.ImportFromDataSet(ds);


                //FORMATTING PLANNED DAYS SHEET WITH HEADERS.
                Worksheet worksheetByName1 = spreadsheet.Workbook.Worksheets.ByName("Employee Data");

                // Add new row
                worksheetByName1.Rows.Insert(0, 1);

                int count = 0;
                worksheetByName1.Rows[0].Font = new System.Drawing.Font("Arial", 10, FontStyle.Bold);
                for (var col = 0; col < ds.Tables[0].Columns.Count; col++)
                {
                    worksheetByName1.Cell(0, col).Value = ds.Tables[0].Columns[col].ColumnName;
                    worksheetByName1.Columns[col].AutoFit();
                }

                spreadsheet.SaveAs(fullfilename);
                spreadsheet.Close();
                // Process.Start(fileName);
                // return dtReturndata
                using (MailMessage mail = new MailMessage())
                {
                    mail.To.Clear();
                    mail.To.Add(ConfigurationManager.AppSettings["AgreementEmail"]);
                    //mail.To.Add(ConfigurationManager.AppSettings["ConfirmMailTo1"]);
                    mail.From = new MailAddress(ConfigurationManager.AppSettings["smtpFromUser"]);
                    mail.Subject = Subject;
                    mail.Body = MainBody;
                    mail.Attachments.Add(new Attachment(fullfilename));
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
                return dtReturndata;

            }

            catch (Exception ex)
            {
                throw ex;
            }
        }




        [WebMethod]
        public static string GetClientExcel(long intStatusId, long clientid)
        {
            try
            {
                string excelResult = "";

                string Subject = "Employee synchronized List Attachment";
                var MainBody = "";
                //Attachment attachements = new Attachment();
                BusinessManager mgrEmployee = new BusinessManager();
                var dtReturndata = mgrEmployee.GetClientExcel(intStatusId, clientid);
                JsonConvert.SerializeObject(dtReturndata);
                //DataTable periodicTable = GetDataTable();
                // DataTable ds = dtReturndata;
                dtReturndata.TableName = "Employee Data";
                //dtReturndata1.Tables.Add(dtReturndata.Tables[0].Copy());
                string path = HttpContext.Current.Server.MapPath("~/UploadImage");
                //if (System.IO.File.Exists(path + "Employee.xls"))
                //{
                //    File.Delete(path + "Employee.xls"); path +"\\"+
                //}

                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                DataSet ds = new DataSet();
                ds.Tables.Add(dtReturndata);
                //DateTime dateTime = DateTime.UtcNow.Date;

                const string fileName = "Employee.xlsx";
                string fullfilename = Path.Combine(path, fileName);

                if (File.Exists(fullfilename))
                { File.Delete(fullfilename); }


                Spreadsheet spreadsheet = new Spreadsheet();

                //spreadsheet.ImportFromDataTable(dtReturndata);

                spreadsheet.ImportFromDataSet(ds);


                //FORMATTING PLANNED DAYS SHEET WITH HEADERS.
                Worksheet worksheetByName1 = spreadsheet.Workbook.Worksheets.ByName("Employee Data");

                // Add new row
                worksheetByName1.Rows.Insert(0, 1);

                int count = 0;
                worksheetByName1.Rows[0].Font = new System.Drawing.Font("Arial", 10, FontStyle.Bold);
                for (var col = 0; col < ds.Tables[0].Columns.Count; col++)
                {
                    worksheetByName1.Cell(0, col).Value = ds.Tables[0].Columns[col].ColumnName;
                    worksheetByName1.Columns[col].AutoFit();
                }



                spreadsheet.SaveAs(fullfilename);
                spreadsheet.Close();
                // Process.Start(fileName);
                // return dtReturndata
                using (MailMessage mail = new MailMessage())
                {
                    mail.To.Clear();
                    mail.To.Add(ConfigurationManager.AppSettings["AgreementEmail"]);
                    //mail.To.Add(ConfigurationManager.AppSettings["ConfirmMailTo1"]);
                    mail.From = new MailAddress(ConfigurationManager.AppSettings["smtpFromUser"]);
                    mail.Subject = Subject;
                    mail.Body = MainBody;
                    mail.Attachments.Add(new Attachment(fullfilename));
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
        public static string GetStatusBasedClientList(long StatusId, long ClientId)
        {
            try
            {
                DataTable ds = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var dt = (mgr.GetStatusBasedClientList(StatusId, ClientId));
                return JsonConvert.SerializeObject(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

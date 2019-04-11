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
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace DocumentManagementSystem.EmployeePages
{
    public partial class EmpScreen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["event"] != null && Request.Form["event"] == "GetDropDownClient")
            {
                Response.Clear();
                Response.Write(GetDropDownClient());
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
        public static string SaveEmployee(clsEmployeeScreen objEmployee)
        {
            try
            {
                //string result="";
                BusinessManager mgr = new BusinessManager();
                return (mgr.SaveEmployeeDetails(objEmployee));
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
        public static string GetEmployeeEdit(long intclientid, long ID)
        {
            try
            {
                DataTable ds = new DataTable();
                BusinessManager mgr = new BusinessManager();
                var dt = (mgr.GetEmployeeEdit(intclientid, ID));
                return JsonConvert.SerializeObject(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public static string GetEmployeeUpdatedExcel_Old(long EmployeeID, long clientid, string Mode, string UserType)
        {

            try
            {
                string excelResult = "";
                string Subject = "Employee synchronized List";
                var CompanyName = "";
                var MainBody = "";
                var CommonURL = "";
                var ClientEmailId = "";
                var ClientPassword = "";

                BusinessManager mgrEmployee = new BusinessManager();
                var dtReturndata = mgrEmployee.GetEmployeeUpdatedExcel(EmployeeID, clientid);
                JsonConvert.SerializeObject(dtReturndata);

                //XmlDocument doc = new XmlDocument();
                //XmlNode docNode = doc.CreateXmlDeclaration("1.0", "UTF-8", null);
                //doc.AppendChild(docNode);

                //XmlNode TrackingDataNode = doc.CreateElement("TrackingData");
                //XmlAttribute TrackingDataNodeAttribute = doc.CreateAttribute("generated");
                //TrackingDataNodeAttribute.Value = DateTime.Now.ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss");
                //TrackingDataNode.Attributes.Append(TrackingDataNodeAttribute);
                //doc.AppendChild(TrackingDataNode);

                foreach (DataRow drow in dtReturndata.Rows)
                {
                    CompanyName = drow["vchClientName"].ToString();
                    ClientEmailId = drow["vchEmail"].ToString();
                    ClientPassword = drow["clientpassword"].ToString();
                }

                if (Mode == "update")
                {
                    CommonURL = HttpContext.Current.Request.UrlReferrer.ToString();
                    //   var urlContent = ("&UserType=" + UserType);
                    // CommonURL = CommonURL + urlContent;
                }
                else
                {
                    var url1 = HttpContext.Current.Request.UrlReferrer.ToString();
                    var urlContent = ("?id=" + clientid + ',' + EmployeeID + "&UserType=" + UserType);
                    CommonURL = url1 + urlContent;
                }
                dtReturndata.TableName = "Employee Data";
                //string path = HttpContext.Current.Server.MapPath("~/UploadImage");               
                //if (!Directory.Exists(path))
                //{
                //    Directory.CreateDirectory(path);
                //}
                //DataSet ds = new DataSet();
                //ds.Tables.Add(dtReturndata);
                //foreach (DataRow drow in ds.Tables[0].Rows)
                //{
                //   CompanyName = drow["vchClientName"].ToString();

                //}                
                //const string fileName = "Employee.xlsx";
                //string fullfilename = Path.Combine(path, fileName);

                //if (File.Exists(fullfilename))
                //{ File.Delete(fullfilename); }
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
                    MainBody = "The client " + "<b>" + CompanyName + "</b>" + " has modified the following data in Employee screen";
                }
                else
                {
                    MainBody = "The client " + "<b>" + CompanyName + "</b>" + " has Added the following data in Employee screen";
                }

                //spreadsheet.SaveAs(fullfilename);
                //spreadsheet.Close();
                // Process.Start(fileName);
                // return dtReturndata
                using (MailMessage mail = new MailMessage())
                {
                    mail.To.Clear();
                    mail.To.Add(ConfigurationManager.AppSettings["smtpFromUser"]);

                    mail.From = new MailAddress(ClientEmailId);
                    mail.Subject = Subject;
                    mail.Body = MainBody + "<br><br>" + CommonURL;

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
        public static string GetEmployeeUpdatedExcel(long EmployeeID, long clientid, string Mode, string UserType)
        {
            string excelResult = "";
            try
            {

                string Subject = "Employee synchronized List";
                var CompanyName = "";
                var MainBody = "";
                var CommonURL = "";
                var ClientEmailId = "";
                var ClientPassword = "";

                var EmployeeFirstName = "";
                var EmployeeLastName = "";

                var bitIsland = "";
                var bitLanguage = "";

                

                BusinessManager mgrEmployee = new BusinessManager();
                var dtReturndata = mgrEmployee.GetEmployeeUpdatedExcel(EmployeeID, clientid);
                JsonConvert.SerializeObject(dtReturndata);

                BusinessManager mgrEmployee1 = new BusinessManager();
                var dtReturndata1 = mgrEmployee.SynchronizedConfirmationMail(EmployeeID, clientid);
                JsonConvert.SerializeObject(dtReturndata1);

                XmlDocument doc = new XmlDocument();
                XmlNode docNode = doc.CreateXmlDeclaration("1.0", "UTF-8", null);
                doc.AppendChild(docNode);

                XmlNode TrackingDataNode = doc.CreateElement("TrackingData");
                XmlAttribute TrackingDataNodeAttribute = doc.CreateAttribute("generated");
                TrackingDataNodeAttribute.Value = DateTime.Now.ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss");
                TrackingDataNode.Attributes.Append(TrackingDataNodeAttribute);
                doc.AppendChild(TrackingDataNode);

                foreach (DataRow drowsyn in dtReturndata1.Tables[0].Rows)
                {
                    CompanyName = drowsyn["vchClientName"].ToString();
                    ClientEmailId = drowsyn["vchEmail"].ToString();
                    EmployeeFirstName = drowsyn["strEmployeeFirstName"].ToString();
                    EmployeeLastName = drowsyn["strEmployeLastName"].ToString();

                    bitIsland = drowsyn["bitIsland"].ToString();
                    bitLanguage= drowsyn["bitLanguage"].ToString();

                    if((bitIsland == "True")&& (bitLanguage == "True"))
                            {
                        bitIsland = "sxm";
                        bitLanguage = "E";
                    }

                   // if ((bitIsland == "False") && (bitLanguage == "False"))
                   // {
                   //     bitIsland = "";
                   //     bitLanguage = "";
                   // }

                   // else if (bitIsland=="True")
                   // {
                   //     bitIsland = "sxm";
                   //     bitLanguage = "";
                   // }
                    
                   //else if (bitLanguage == "True")
                   // {
                   //     bitLanguage = "E";
                   //     bitIsland = "";
                   // }
                  

                    XmlNode ClientNode = doc.CreateElement("Client");
                    TrackingDataNode.AppendChild(ClientNode);

                    XmlNode NewClientNode = doc.CreateElement("NewClient");
                    NewClientNode.AppendChild(doc.CreateTextNode(drowsyn["vchClientName"].ToString()));
                    ClientNode.AppendChild(NewClientNode);

                    XmlNode NameNode = doc.CreateElement("Name");
                    NameNode.AppendChild(doc.CreateTextNode(drowsyn["vchClientName"].ToString()));
                    ClientNode.AppendChild(NameNode);

                    XmlNode CrbiNumberNode = doc.CreateElement("CrbiNumber");
                    CrbiNumberNode.AppendChild(doc.CreateTextNode(drowsyn["intCribNo"].ToString()));
                    ClientNode.AppendChild(CrbiNumberNode);

                    XmlNode EmployeeNode = doc.CreateElement("Employee");
                    ClientNode.AppendChild(EmployeeNode);

                    XmlNode NewEmployeeNode = doc.CreateElement("NewEmployee");
                    NewEmployeeNode.AppendChild(doc.CreateTextNode(drowsyn["intEmployeeID"].ToString()));
                    EmployeeNode.AppendChild(NewEmployeeNode);

                    XmlNode FirstNameNode = doc.CreateElement("FirstName");
                    FirstNameNode.AppendChild(doc.CreateTextNode(drowsyn["strEmployeeFirstName"].ToString()));
                    EmployeeNode.AppendChild(FirstNameNode);

                    XmlNode LastNameNode = doc.CreateElement("LastName");
                    LastNameNode.AppendChild(doc.CreateTextNode(drowsyn["strEmployeLastName"].ToString()));
                    EmployeeNode.AppendChild(LastNameNode);

                    XmlNode SalaryNode = doc.CreateElement("Salary");
                    SalaryNode.AppendChild(doc.CreateTextNode(drowsyn["numGrossSalaryANG"].ToString()));
                    EmployeeNode.AppendChild(SalaryNode);

                    XmlNode WagePeriodIDNode = doc.CreateElement("WagePeriodID");
                    WagePeriodIDNode.AppendChild(doc.CreateTextNode(drowsyn["intWagePeriodId"].ToString()));
                    EmployeeNode.AppendChild(WagePeriodIDNode);

                    XmlNode XmlbitIsland = doc.CreateElement("Island");
                    XmlbitIsland.AppendChild(doc.CreateTextNode("sxm"));
                    EmployeeNode.AppendChild(XmlbitIsland);

                    XmlNode XmlbitLanguage = doc.CreateElement("Language");
                    XmlbitLanguage.AppendChild(doc.CreateTextNode("E"));
                    EmployeeNode.AppendChild(XmlbitLanguage);

                    ClientNode.AppendChild(EmployeeNode);
                    TrackingDataNode.AppendChild(ClientNode);
                }

                foreach (DataRow drow in dtReturndata.Rows)
                {
                    CompanyName = drow["vchClientName"].ToString();
                    ClientEmailId = drow["vchEmail"].ToString();
                    ClientPassword = drow["clientpassword"].ToString();
                }

                if (Mode == "update")
                {
                    CommonURL = HttpContext.Current.Request.UrlReferrer.ToString();

                }
                else
                {
                    var url1 = HttpContext.Current.Request.UrlReferrer.ToString();
                    var urlContent = ("?id=" + clientid + ',' + EmployeeID + "&UserType=" + UserType);
                    CommonURL = url1 + urlContent;
                }
                dtReturndata.TableName = "Employee Data";

                if (Mode == "update")
                {
                    MainBody = "The client " + "<b>" + CompanyName + "</b>" + " has modified the following data in Employee screen";
                }
                else
                {
                    MainBody = "The client " + "<b>" + CompanyName + "</b>" + " has Added the following data in Employee screen";
                }

                var newFileName = HttpContext.Current.Server.MapPath("~/UploadImage/XMlFile/") + "NewEmployeeXml" + "_" + dtReturndata1.Tables[0].Rows[0]["vchClientName"].ToString() + "_" + dtReturndata1.Tables[0].Rows[0]["intEmployeeID"].ToString() + ".xml";
                doc.Save(newFileName);

                using (MailMessage mail = new MailMessage())
                {
                    mail.To.Clear();
                    mail.To.Add(ConfigurationManager.AppSettings["smtpToUser"]);

                    mail.From = new MailAddress(ConfigurationManager.AppSettings["smtpFromUser"]);
                    mail.Subject = Subject;

                    var FileName1 = HttpContext.Current.Server.MapPath("~/UploadImage/XMlFile/") + "NewEmployeeXml" + "_" + dtReturndata1.Tables[0].Rows[0]["vchClientName"].ToString() + "_" + dtReturndata1.Tables[0].Rows[0]["intEmployeeID"].ToString() + ".xml";
                    mail.Attachments.Add(new Attachment(FileName1));

                    mail.Body = MainBody + "<br><br>" + CommonURL;

                    mail.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.EnableSsl = true;
                   // smtp.Host = "smtp.office365.com";
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["smtpFromUser"], ConfigurationManager.AppSettings["smtpPass"]);
                    smtp.EnableSsl = true;
                    smtp.Send(mail);

                    smtp.Dispose();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return excelResult = "Success";
        }

        [WebMethod]
        public static string SynchronizedConfirmationMail(long EmployeeID, long clientid)
        {
            string Result = "";
            string Subject = "Employee Registration Success";

            var CompanyName = "";
            var ClientEmailId = "";
            var EmployeeFirstName = "";
            var EmployeeLastName = "";
            var EmployeeName = "";
            try
            {
                BusinessManager mgrEmployee = new BusinessManager();
                var dtReturndata = mgrEmployee.SynchronizedConfirmationMail(EmployeeID, clientid);
                JsonConvert.SerializeObject(dtReturndata);

                XmlDocument doc = new XmlDocument();
                XmlNode docNode = doc.CreateXmlDeclaration("1.0", "UTF-8", null);
                doc.AppendChild(docNode);

                XmlNode TrackingDataNode = doc.CreateElement("TrackingData");
                XmlAttribute TrackingDataNodeAttribute = doc.CreateAttribute("generated");
                TrackingDataNodeAttribute.Value = DateTime.Now.ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss");
                TrackingDataNode.Attributes.Append(TrackingDataNodeAttribute);
                doc.AppendChild(TrackingDataNode);

                foreach (DataRow drow in dtReturndata.Tables[0].Rows)
                {
                    CompanyName = drow["vchClientName"].ToString();
                    ClientEmailId = drow["vchEmail"].ToString();
                    EmployeeFirstName = drow["strEmployeeFirstName"].ToString();
                    EmployeeLastName = drow["strEmployeLastName"].ToString();

                    XmlNode ClientNode = doc.CreateElement("Client");
                    TrackingDataNode.AppendChild(ClientNode);

                    XmlNode NewClientNode = doc.CreateElement("NewClient");
                    NewClientNode.AppendChild(doc.CreateTextNode(drow["vchClientName"].ToString()));
                    ClientNode.AppendChild(NewClientNode);

                    XmlNode NameNode = doc.CreateElement("Name");
                    NameNode.AppendChild(doc.CreateTextNode(drow["vchClientName"].ToString()));
                    ClientNode.AppendChild(NameNode);

                    XmlNode CrbiNumberNode = doc.CreateElement("CrbiNumber");
                    CrbiNumberNode.AppendChild(doc.CreateTextNode(drow["intCribNo"].ToString()));
                    ClientNode.AppendChild(CrbiNumberNode);

                    XmlNode EmployeeNode = doc.CreateElement("Employee");
                    ClientNode.AppendChild(EmployeeNode);

                    XmlNode NewEmployeeNode = doc.CreateElement("NewEmployee");
                    NewEmployeeNode.AppendChild(doc.CreateTextNode(drow["intEmployeeID"].ToString()));
                    EmployeeNode.AppendChild(NewEmployeeNode);

                    XmlNode FirstNameNode = doc.CreateElement("FirstName");
                    FirstNameNode.AppendChild(doc.CreateTextNode(drow["strEmployeeFirstName"].ToString()));
                    EmployeeNode.AppendChild(FirstNameNode);

                    XmlNode LastNameNode = doc.CreateElement("LastName");
                    LastNameNode.AppendChild(doc.CreateTextNode(drow["strEmployeLastName"].ToString()));
                    EmployeeNode.AppendChild(LastNameNode);

                    XmlNode SalaryNode = doc.CreateElement("Salary");
                    SalaryNode.AppendChild(doc.CreateTextNode(drow["numGrossSalaryANG"].ToString()));
                    EmployeeNode.AppendChild(SalaryNode);

                    XmlNode WagePeriodIDNode = doc.CreateElement("WagePeriodID");
                    WagePeriodIDNode.AppendChild(doc.CreateTextNode(drow["intWagePeriodId"].ToString()));
                    EmployeeNode.AppendChild(WagePeriodIDNode);


                    ClientNode.AppendChild(EmployeeNode);
                    TrackingDataNode.AppendChild(ClientNode);
                }

                var FileName = "NewEmployeeXml.xml";
                var newFileName = HttpContext.Current.Server.MapPath("~/UploadImage/XMlFile/") + "NewEmployeeXml" + "_" + dtReturndata.Tables[0].Rows[0]["vchClientName"].ToString() + "_" + dtReturndata.Tables[0].Rows[0]["intEmployeeID"].ToString() + ".xml";
                // FileName = HttpContext.Current.Server.MapPath("~/UploadImage/XMlFile/") + "NewEmployeeXml" + "_" + dtReturndata.Tables[0].Rows[0]["vchClientName"].ToString() + DateTime.Now.ToString("ddMMyyyyhhmmss") + ".xml";
                doc.Save(newFileName);
                EmployeeName = EmployeeFirstName + " " + EmployeeLastName;
                string MainBody = "Your Employee " + "<b>" + EmployeeName + "</b>" + " has been Registered...Please Use the PayRoll Process";
                //string MainBody = "Your"  +(EmployeeName)+"  Employee has Register";
                using (MailMessage mail = new MailMessage())
                {
                    mail.To.Clear();
                    mail.To.Add(ClientEmailId);

                    mail.From = new MailAddress(ConfigurationManager.AppSettings["SmtpPayRollUser"]);
                    mail.CC.Add(new MailAddress(ConfigurationManager.AppSettings["smtpFromUser"]));
                    mail.Subject = Subject;
                    mail.Body = MainBody;
                    var FileName1 = HttpContext.Current.Server.MapPath("~/UploadImage/XMlFile/") + "NewEmployeeXml" + "_" + dtReturndata.Tables[0].Rows[0]["vchClientName"].ToString() + "_" + dtReturndata.Tables[0].Rows[0]["intEmployeeID"].ToString() + ".xml";
                    mail.Attachments.Add(new Attachment(FileName1));
                    mail.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.EnableSsl = true;
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.UseDefaultCredentials = false;
                    // smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["SmtpPayRollUser"], ConfigurationManager.AppSettings["smtpPayrollPass"]);
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

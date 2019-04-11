using ObjectLibrary;
using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using Newtonsoft.Json;
using System.IO;
using Bytescout.Spreadsheet;
using System.Drawing;
using System.Configuration;
using System.Net.Mail;
using Spire.Doc;
using Spire.Doc.Documents;
using System.Data.SqlClient;
using A = DocumentFormat.OpenXml.Drawing;
using DW = DocumentFormat.OpenXml.Drawing.Wordprocessing;
using PIC = DocumentFormat.OpenXml.Drawing.Pictures;
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Wordprocessing;
using DataLayer.Repository;
using System.Data.OleDb;
using DataAccess;


namespace DocumentManagementSystem.EmployeePages
{
    public partial class PayRoll : System.Web.UI.Page
    {
        BusinessManager BO = new BusinessManager();
        OleDbConnection Econ;
        string sqlconn = ConfigurationManager.ConnectionStrings["Main.ConnectionString.Dev"].ToString();
        CommonDataAccess objCommonRepository = new CommonDataAccess();
        //string constr, Query, sqlconn;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string GetClientDetails(long ClientId)
        {
            BusinessManager mgrTurnOver = new BusinessManager();
            var dtReturndata = mgrTurnOver.GetClientDetails(ClientId);
            return JsonConvert.SerializeObject(dtReturndata);
        }
        [WebMethod]
        public static string VaildatePreviousPayRoll(long ClientId)
        {
            BusinessManager mgr = new BusinessManager();
            var dtReturndata = mgr.VaildatePreviousPayRoll(ClientId);
            return JsonConvert.SerializeObject(dtReturndata);
        }

        [WebMethod]
        public static string DeleteActiveEmployee(long InactiveId)
        {
            BusinessManager mgr = new BusinessManager();
            var dtReturndata = mgr.DeleteActiveEmployee(InactiveId);
            return JsonConvert.SerializeObject(dtReturndata);
        }
        [WebMethod]
        public static string GetPastEmployee(long EmployeeId)
        {
            BusinessManager mgr = new BusinessManager();
            var dtReturndata = mgr.GetPastEmployee(EmployeeId);
            return JsonConvert.SerializeObject(dtReturndata);
        }

        /// <summary>
        /// METHOD FOR GET EMPLOYEE LIST FROM DB AS SALARIED EMPLOYEES OR NON SALARIED EMPLOYEES.
        /// </summary>
        /// <param name="Month"></param>
        /// <param name="Year"></param>
        /// <returns></returns>
        [WebMethod]
        public static string GetEmployeeList(string Month, int Year, int clientID, int intMonth)
        {
            BusinessManager BO = new BusinessManager();

            DataSet ds = new DataSet();
            try
            {
                ds = BO.GetEmployeeList(Month, Year, clientID, intMonth);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message.ToString());
            }

            return JsonConvert.SerializeObject(ds);
        }

        [WebMethod]
        public static string SavePayRoll(ClsCommonPayRoll objPayRoll)
        {
            try
            {
                //string result="";
                BusinessManager mgr = new BusinessManager();
                return (mgr.SavePayRoll(objPayRoll));
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [WebMethod]
        public static string PaymentHistroy(InsertPaymentHistory objPaymentHistroy)
        {
            try
            {
                //string result="";
                BusinessManager mgr = new BusinessManager();
                return (mgr.InsertPaymentHistroy(objPaymentHistroy));
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }


        [WebMethod]
        public static string InvoiceReport(long clientid, string FileName, int Count, string PackageName)
        {
            string result = "";
            var CompanyName = "";
            var MainBody = "";
            var Month = "";
            var Year = "";
            var TotalCount = "";
            string Subject = "Invoice Report";
            var ClientEmailId = "";
            //var Amount = "";
            var PayRollAmount = "";
            var TurnOverAmount1 = "";
            var TurnOverAmount = "";
            var TotalAmount = "";
            var InvoiceDate = "";
            DataSet dt = new DataSet();
            BusinessManager mgrEmployee = new BusinessManager();
            var dtReturndata = mgrEmployee.GetInvoiceReport(clientid);
            JsonConvert.SerializeObject(dtReturndata);
            foreach (DataRow drow in dtReturndata.Tables[0].Rows)
            {
                CompanyName = drow["vchClientName"].ToString();
                if ((drow["payRollAmount"]).ToString() != "")
                {
                    PayRollAmount = Convert.ToDecimal(drow["payRollAmount"]).ToString();
                }

                if ((drow["TurnOverAmount"]).ToString() != "")
                {
                    TurnOverAmount = Convert.ToDecimal(drow["TurnOverAmount"]).ToString();
                }

                ClientEmailId = drow["vchEmail"].ToString();
                DateTime dM = DateTime.ParseExact(drow["dateCreatedDate"].ToString(), "MM/dd/yyyy", null);
                //var dtime = Convert.ToDateTime(drow["dateCreatedDate"] != null ? drow["dateCreatedDate"].ToString() : "MM/dd/yyyy");
                //var dtime = DateTime.ParseExact(Convert.ToDateTime(drow["PackageStartDate"].ToString(),"d/MM/yyyy",ParsingCulture);
                var dateValue = dM.Day;
                Month = dM.ToString("MMMM");
                Year = dM.Year.ToString();
            }
            TotalCount = Count.ToString();
            if (PackageName == "PayRoll Only")
            {
                TotalAmount = (Convert.ToInt32(TotalCount) * Convert.ToDecimal(PayRollAmount)).ToString();
            }
            else if (PackageName == "Trial")
            {
                TotalAmount = (Convert.ToInt32(TotalCount) * Convert.ToDecimal(PayRollAmount)).ToString();
            }
            else if (PackageName == "PayRoll and TurnOver declaration")
            {
                if (TurnOverAmount1 == "" || TurnOverAmount1 == null)
                {
                    decimal TurnOverAmount2 = 00.0m;
                    TurnOverAmount = TurnOverAmount2.ToString();
                }
                else
                {

                }

                var TotalAmount1 = (Convert.ToInt32(TotalCount) * Convert.ToDecimal(TurnOverAmount)).ToString();
                var TotalAmount2 = (Convert.ToInt32(TotalCount) * Convert.ToDecimal(PayRollAmount)).ToString();
                TotalAmount = ((TotalAmount1) + (TotalAmount2)).ToString();
            }
            //TotalAmount = (Convert.ToInt32(TotalCount) * Convert.ToDecimal(Amount)).ToString();
            var newFileName = HttpContext.Current.Server.MapPath("~/UploadImage/" + FileName);
            FileName = HttpContext.Current.Server.MapPath("~/UploadImage/") + CompanyName + "_" + "Invoice_Report" + "_" + DateTime.Now.ToString("ddMMyyyyhhmmss") + ".doc";
            System.IO.File.Copy(newFileName, FileName);
            using (DocumentFormat.OpenXml.Packaging.WordprocessingDocument doc =
                            DocumentFormat.OpenXml.Packaging.WordprocessingDocument.Open(FileName, true))
            {
                DocumentFormat.OpenXml.Packaging.MainDocumentPart mainPart = doc.MainDocumentPart;

                IDictionary<String, DocumentFormat.OpenXml.Wordprocessing.BookmarkStart> bookmarkMap =
                new Dictionary<String, DocumentFormat.OpenXml.Wordprocessing.BookmarkStart>();
                foreach (DocumentFormat.OpenXml.Wordprocessing.BookmarkStart bookmarkStart in doc.MainDocumentPart.RootElement.Descendants<DocumentFormat.OpenXml.Wordprocessing.BookmarkStart>())
                {
                    bookmarkMap[bookmarkStart.Name] = bookmarkStart;
                }
                foreach (DocumentFormat.OpenXml.Wordprocessing.BookmarkStart bookmarkStart in bookmarkMap.Values)
                {
                    DocumentFormat.OpenXml.Wordprocessing.Run bookmarkText = bookmarkStart.NextSibling<DocumentFormat.OpenXml.Wordprocessing.Run>();

                    DocumentFormat.OpenXml.Wordprocessing.FontSize fontSize = new DocumentFormat.OpenXml.Wordprocessing.FontSize();
                    fontSize.Val = "20";

                    if (bookmarkStart.Name.Value.ToString() == "ContactPerson")
                    {
                        InsertText_Template(bookmarkStart.Name.Value.ToString(), bookmarkStart, dtReturndata.Tables[0].Rows[0]["strContactPerson"].ToString(), false, "000000");
                    }
                    else if (bookmarkStart.Name.Value.ToString() == "Address")
                    {
                        InsertText_Template(bookmarkStart.Name.Value.ToString(), bookmarkStart, dtReturndata.Tables[0].Rows[0]["vchAddress"].ToString(), false, "000000");
                    }
                    else if (bookmarkStart.Name.Value.ToString() == "ClientName")
                    {
                        InsertText_Template(bookmarkStart.Name.Value.ToString(), bookmarkStart, dtReturndata.Tables[0].Rows[0]["vchClientName"].ToString(), false, "000000");
                    }
                    else if (bookmarkStart.Name.Value.ToString() == "InvoiceDate")
                    {
                        DateTime da = DateTime.ParseExact(dtReturndata.Tables[0].Rows[0]["PackageStartDate"].ToString(), "MM/dd/yyyy", null);
                        var time1 = string.Format("{0:MMMM dd, yyyy}", da);
                        InsertText_Template(bookmarkStart.Name.Value.ToString(), bookmarkStart, time1, false, "000000");
                    }
                    else if (bookmarkStart.Name.Value.ToString() == "BillingDate")
                    {
                        DateTime da = DateTime.ParseExact(dtReturndata.Tables[0].Rows[0]["PackageStartDate"].ToString(), "MM/dd/yyyy", null);
                        var time1 = string.Format("{0:MMMM dd, yyyy}", da);
                        InsertText_Template(bookmarkStart.Name.Value.ToString(), bookmarkStart, time1, false, "000000");
                    }
                    else if (bookmarkStart.Name.Value.ToString() == "TotalAmountDue")
                    {
                        InsertText_Template(bookmarkStart.Name.Value.ToString(), bookmarkStart, TotalAmount, false, "000000");
                    }
                    else if (bookmarkStart.Name.Value.ToString() == "TotalAmountDue1")
                    {
                        InsertText_Template(bookmarkStart.Name.Value.ToString(), bookmarkStart, TotalAmount, false, "000000");
                    }
                    else if (bookmarkStart.Name.Value.ToString() == "InvoiceNumber")
                    {
                        InsertText_Template(bookmarkStart.Name.Value.ToString(), bookmarkStart, dtReturndata.Tables[0].Rows[0]["strInvoiceNumberCode"].ToString(), false, "000000");
                    }

                    if (bookmarkStart.Name.Value.ToString() == "TaxFillingProcess")
                    {
                        InsertText_Template(bookmarkStart.Name.Value.ToString(), bookmarkStart, Month + " " + Year + " " + "for " + TotalCount + " " + "Employee " + "@" + TurnOverAmount, false, "000000");
                    }
                    else if (bookmarkStart.Name.Value.ToString() == "PayRollProcess")
                    {
                        InsertText_Template(bookmarkStart.Name.Value.ToString(), bookmarkStart, Month + " " + Year + " " + "for " + TotalCount + " " + "Employee " + "@" + PayRollAmount, false, "000000");
                    }
                }
                doc.Close();
            }
            result = FileName;
            using (MailMessage mail = new MailMessage())
            {
                mail.To.Clear();
                mail.To.Add(ClientEmailId);
                //mail.To.Add(ConfigurationManager.AppSettings["ConfirmMailTo1"]);
                mail.From = new MailAddress(ConfigurationManager.AppSettings["SmtpPayRollUser"]);
                mail.Subject = Subject;
                mail.Body = MainBody;
             mail.Attachments.Add(new Attachment(FileName));

                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.EnableSsl = true;
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["SmtpPayRollUser"], ConfigurationManager.AppSettings["smtpPayrollPass"]);
                smtp.EnableSsl = true;
                smtp.Send(mail);

                smtp.Dispose();
            }
            //System.IO.File.Copy(HttpContext.Current.Server.MapPath("~/UploadImage/") + FileName);

            return result;
        }

        private static void InsertText_Template(string bookMarkName, DocumentFormat.OpenXml.Wordprocessing.BookmarkStart bookmarkStart, string strname, bool isBold, string color)
        {
            DocumentFormat.OpenXml.Wordprocessing.Run run = new DocumentFormat.OpenXml.Wordprocessing.Run(new DocumentFormat.OpenXml.Wordprocessing.RunProperties());
            DocumentFormat.OpenXml.Wordprocessing.RunProperties runprop = new DocumentFormat.OpenXml.Wordprocessing.RunProperties();
            DocumentFormat.OpenXml.Wordprocessing.FontSize fontSize = new DocumentFormat.OpenXml.Wordprocessing.FontSize();
            fontSize.Val = "21.5";

            if (bookMarkName.Contains("Footer"))
            {
                fontSize.Val = "17.5";
            }
            DocumentFormat.OpenXml.Wordprocessing.Text text = new DocumentFormat.OpenXml.Wordprocessing.Text(strname);
            if (isBold)
            {
                runprop = run.AppendChild(new DocumentFormat.OpenXml.Wordprocessing.RunProperties(new DocumentFormat.OpenXml.Wordprocessing.Bold()));
            }
            else
            {
                runprop = run.AppendChild(new DocumentFormat.OpenXml.Wordprocessing.RunProperties());
            }

            DocumentFormat.OpenXml.Wordprocessing.RunFonts runFont = new DocumentFormat.OpenXml.Wordprocessing.RunFonts();
            runFont.Ascii = "Times New Roman";
            DocumentFormat.OpenXml.Wordprocessing.Color fontColor = new DocumentFormat.OpenXml.Wordprocessing.Color() { Val = color };//Red color
            //DocumentFormat.OpenXml.Wordprocessing.Color fontColor = new DocumentFormat.OpenXml.Wordprocessing.Color() { Val = "FF0000" };//Red color
            //DocumentFormat.OpenXml.Wordprocessing.Color fontColor = new DocumentFormat.OpenXml.Wordprocessing.Color() { Val = "00B04E" };//Green

            //run.PrependChild(runFont);
            runprop.AppendChild(runFont);
            runprop.AppendChild(fontColor);
            runprop.AppendChild(fontSize);
            run.Append(text);


            //DocumentFormat.OpenXml.Wordprocessing.Paragraph newParagraph = new DocumentFormat.OpenXml.Wordprocessing.Paragraph(run);

            // insert after bookmark parent
            bookmarkStart.InsertAfterSelf(run);

        }
       // [WebMethod]
        //public static string GetExportData_Old(long year, string month, int clientId, int intMonth)
        //{
        //    try
        //    {
        //        string excelResult = "";
        //        var CompanyName = "";
        //        var CompanyCode = "";
        //        var MainBody = "";
        //        var Date1 = "";
        //        var Date2 = "";
        //        string Subject = "Employee PayRoll List";
        //        var Period = "";
        //        var TotalSalary = "";
        //        var DateTiming = "";
        //        var time1 = "";
        //        var month1 = 0;

        //        DataTable dt = new DataTable();
        //        BusinessManager mgrEmployee = new BusinessManager();
        //        var dtReturndata = mgrEmployee.GetExportDataPayroll(year, month, clientId, intMonth);
        //        JsonConvert.SerializeObject(dtReturndata);
        //        if (dtReturndata.Rows.Count > 0)
        //        {
        //            //DataSet dtRequiredData = new DataSet();
        //            //string CompanyName = dtReturndata.Rows[0].Field<string>(0);
        //            dtReturndata.TableName = "PayRoll Data";
        //            string path = HttpContext.Current.Server.MapPath("~/UploadImage");
        //            if (!Directory.Exists(path))
        //            {
        //                Directory.CreateDirectory(path);
        //            }
        //            DataSet ds = new DataSet();
        //            ds.Tables.Add(dtReturndata);
        //            foreach (DataRow drow in ds.Tables[0].Rows)
        //            {
        //                CompanyName = drow["vchClientName"].ToString();
        //                Period = drow["Wage Period Days"].ToString();
        //                CompanyCode = drow["vchClientNo"].ToString();
        //                TotalSalary = drow["TotalGrossWages"].ToString();
        //                var dtime = Convert.ToDateTime(drow["dateCreatedDate"] != null ? drow["dateCreatedDate"].ToString() : DateTime.Now.ToString());
        //                var dateValue = dtime.Day;
        //                month1 = dtime.Month;
        //                var year1 = dtime.Year.ToString().Substring(2, 2);
        //                time1 = year1 + "" + month1 + "" + dateValue;
        //                // time1 = string.Format("{0:MMMM dd, yyyy}", DateTiming);                       
        //            }
        //            ds.Tables[0].Columns.Remove("vchClientName");
        //            ds.Tables[0].Columns.Remove("vchClientNo");
        //            ds.Tables[0].Columns.Remove("TotalGrossWages");
        //            ds.Tables[0].Columns.Remove("dateCreatedDate");
        //            //var CompanyName1 = CompanyName;
        //            //var Period = Period1;
        //            //var Month = ds.Tables[0].Columns[12].ColumnName;
        //            //var Period = ds.Tables[0].Columns[11].ColumnName;
        //            string fileName = CompanyCode + "-M" + "-PIR" + "18" + month1 + "-" + time1 + " " + ".xls";
        //            //string fileName = "PayRoll" + DateTime.Now.ToString("HH.mm.ss") + ".xlsx";
        //            string fullfilename = Path.Combine(path, fileName);

        //            if (File.Exists(fullfilename))
        //            {
        //                File.Delete(fullfilename);
        //            }
        //            Spreadsheet spreadsheet = new Spreadsheet();
        //            spreadsheet.ImportFromDataSet(ds);
        //            Worksheet worksheetByName1 = spreadsheet.Workbook.Worksheets.ByName("PayRoll Data");

        //            // Add new row
        //            worksheetByName1.Rows.Insert(0, 8);
        //            //set values
        //            //Merge Cells
        //            int cl = 5;//worksheet.UsedRangeColumnMax / 2;
        //            worksheetByName1.Rows[0][cl].Value = "CompanyName:" + CompanyName;
        //            worksheetByName1.Rows[0].Font = new System.Drawing.Font("Arial", 12, FontStyle.Bold);
        //            worksheetByName1.Rows[0][cl].AlignmentHorizontal = Bytescout.Spreadsheet.Constants.AlignmentHorizontal.Centered;

        //            // Shrink text                                
        //            worksheetByName1.Cell(0, 0).ShrinkToFit = true;

        //            worksheetByName1.Range("A1:D6").Merge();
        //            var ImagePath = HttpContext.Current.Server.MapPath("~/assets/img/Picture1.png");
        //            worksheetByName1.Pictures.Add(1, 1, ImagePath);
        //            //worksheetByName1.Pictures.Add(1, 1, @"D:\suruthi\James\Images\Picture1.png");
        //            // worksheetByName1.Pictures.Add(1, 1, @"C:\Images\Picture1.png");
        //            worksheetByName1.Rows[2][cl].Value = "Year:" + year;
        //            worksheetByName1.Rows[2].Font = new System.Drawing.Font("Arial", 10, FontStyle.Bold);
        //            worksheetByName1.Rows[2][cl].AlignmentHorizontal = Bytescout.Spreadsheet.Constants.AlignmentHorizontal.Centered;
        //            // setting centered alignment for the cell


        //            worksheetByName1.Rows[4][cl].Value = "Month : " + month;
        //            worksheetByName1.Rows[4][cl].Font = new System.Drawing.Font("Arial", 10, FontStyle.Bold);
        //            worksheetByName1.Rows[4][cl].AlignmentHorizontal = Bytescout.Spreadsheet.Constants.AlignmentHorizontal.Centered;
        //            worksheetByName1.Rows[3][cl].Value = "Period : " + Period;
        //            worksheetByName1.Rows[3][cl].Font = new System.Drawing.Font("Arial", 10, FontStyle.Bold);
        //            worksheetByName1.Rows[3][cl].AlignmentHorizontal = Bytescout.Spreadsheet.Constants.AlignmentHorizontal.Centered;

        //            worksheetByName1.Rows[0][10].Value = "Total gross wages : " + TotalSalary;
        //            worksheetByName1.Rows[0][10].Font = new System.Drawing.Font("Arial", 10, FontStyle.Bold);
        //            worksheetByName1.Rows[0][10].AlignmentHorizontal = Bytescout.Spreadsheet.Constants.AlignmentHorizontal.Centered;
        //            worksheetByName1.Rows[1][10].Value = "Employee count: " + ds.Tables[0].Rows.Count;
        //            worksheetByName1.Rows[1][10].Font = new System.Drawing.Font("Arial", 10, FontStyle.Bold);
        //            worksheetByName1.Rows[1][10].AlignmentHorizontal = Bytescout.Spreadsheet.Constants.AlignmentHorizontal.Centered;
        //            // setting centered alignment for the cell
        //            //worksheetByName1.Rows[3][cl].AlignmentHorizontal = Bytescout.Spreadsheet.Constants.AlignmentHorizontal.Centered;
        //            int count = 0;
        //            worksheetByName1.Rows[7].Font = new System.Drawing.Font("Arial", 10, FontStyle.Bold);

        //            for (var col = 0; col < ds.Tables[0].Columns.Count; col++)
        //            {
        //                worksheetByName1.Cell(7, col).Value = ds.Tables[0].Columns[col].ColumnName;
        //                // worksheetByName1.Columns.Delete(14, 13);


        //                //worksheetByName1.Columns.Delete(1, 11);
        //                //worksheetByName1.Columns[col].AutoFit();

        //                worksheetByName1.Columns[col].AutoFit();
        //            }
        //            //worksheetByName1.Columns.Insert(14, 14);
        //            // worksheetByName1.Rows[7][13].Value = "Description of extraordinary wage";
        //            worksheetByName1.Rows[7][13].Value = "Deduction";
        //            worksheetByName1.Rows[7][14].Value = "Gross Compensation";
        //            worksheetByName1.Rows[7][15].Value = "Nett Compensation";
        //            worksheetByName1.Rows[7][16].Value = "Naf Total";
        //            spreadsheet.SaveAs(fullfilename);
        //            using (MailMessage mail = new MailMessage())
        //            {
        //                mail.To.Clear();
        //                mail.To.Add(ConfigurationManager.AppSettings["AgreementEmail"]);
        //                //mail.To.Add(ConfigurationManager.AppSettings["ConfirmMailTo1"]);
        //                mail.From = new MailAddress(ConfigurationManager.AppSettings["smtpFromUser"]);
        //                mail.Subject = Subject;
        //                mail.Body = MainBody;
        //             //   mail.Attachments.Add(new Attachment(fullfilename));
        //             //  mail.Attachement.Add(path);
        //                mail.IsBodyHtml = true;
        //                SmtpClient smtp = new SmtpClient();
        //                smtp.EnableSsl = true;
        //                smtp.Host = "smtp.gmail.com";
        //                smtp.Port = 587;
        //                smtp.UseDefaultCredentials = false;
        //                smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["smtpFromUser"], ConfigurationManager.AppSettings["smtpPass"]);
        //                smtp.EnableSsl = true;
        //                smtp.Send(mail);

        //                smtp.Dispose();
        //            }
        //            return excelResult = "Success";
        //        }
        //        else
        //        {
        //            return excelResult = "Not Success";
        //        }

        //        // spreadsheet.Close();

        //        //context.Response.Write(excelResult);
        //        // return fileName;
        //        //excelResult = "Excel Success";
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        [WebMethod]
        public static string GetExportData(long year, string month, int clientId, int intMonth)
        {
            try
            {
                OleDbConnection Econ;
                string excelResult = "";
                var CompanyName = "";
                var CompanyCode = "";
                var MainBody = "";
              
                string Subject = "Employee PayRoll List";
                var Period = "";
                var Period1 = "Monthly";
                var TotalSalary = "";
            
                var Salary = "";
               
                string workbookPath = "";
            
               
                var ClientEmailId = "";
                var ClientPassword = "";
                // var TotalCount = 0;
                string constr = ConfigurationManager.ConnectionStrings["Main.ConnectionString.Dev"].ToString(), Query, sqlconn;

                DataTable dt = new DataTable();
                BusinessManager mgrEmployee = new BusinessManager();
                var dtReturndata = mgrEmployee.GetExportDataPayroll(year, month, clientId, intMonth);
                JsonConvert.SerializeObject(dtReturndata);
                if (dtReturndata.Rows.Count > 0)
                {

                    var Employeecount = dtReturndata.Rows.Count;
                    DataSet ds = new DataSet();
                    ds.Tables.Add(dtReturndata);

                    string OrinalName = "";
                    foreach (DataRow drow in ds.Tables[0].Rows)
                    {
                        //var test=ds.Tables[0].Columns.Count;
                        CompanyName = drow["vchClientName"].ToString();
                        Period = drow["Wage Period Days"].ToString();
                        CompanyCode = drow["vchClientNo"].ToString();
                        TotalSalary = drow["TotalGrossWages"].ToString();
                        Salary = drow["Salary"].ToString();
                        ClientEmailId = drow["VchEmail"].ToString();
                        ClientPassword = drow["clientpassword"].ToString();

                       
                        if (drow["dateCreatedDate"].ToString() != "")
                        {
                            var dtime = Convert.ToDateTime(drow["dateCreatedDate"] != null ? drow["dateCreatedDate"].ToString() : DateTime.Now.ToString());
                            if (dtime != null)
                            {

                                OrinalName = CompanyCode + "-M" + "-PIR" + "-" + dtime.ToString("yyMMdd") + "-" + dtime.ToString("HHmmss");
                            }
                        }

                    }
            
              
                    
                    dtReturndata.TableName = "PayRoll Data";
                    string path = HttpContext.Current.Server.MapPath("~/UploadImage");

                    string CopyFilePath = copyfile("PayRoll Templeate.xlsx", OrinalName);
                    string path1 = HttpContext.Current.Server.MapPath("~/UploadImage/");
                    workbookPath = HttpContext.Current.Server.MapPath("~/UploadImage/" + CopyFilePath);
                    string fullfilename = Path.Combine(path1, CopyFilePath);
                    string fileExtension = Path.GetExtension(workbookPath);

                    if (fileExtension == ".xlsx")
                    {
                        constr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + workbookPath + ";Extended Properties=\"Excel 12.0 xml;HDR=Yes;IMEX=1;TypeGuessRows=0;ImportMixedTypes=Text\"";
                    }
                    if (fileExtension == ".xls")
                    {
                        constr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + workbookPath + ";Extended Properties=\"Excel 12.0 xml;HDR=Yes;IMEX=1;TypeGuessRows=0;ImportMixedTypes=Text\"";
                        //constr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + workbookPath + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
                    }
                    Econ = new OleDbConnection(constr);
                    //string conn = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fileLocation1 + ";Password=password;Extended Properties='Excel 8.0;HDR=YES'";
                    Query = string.Format("Select * FROM [{0}]", "Sheet1$");
                    OleDbCommand Ecom = new OleDbCommand(Query, Econ);
                    Econ.Open();

                    //DataSet ds = new DataSet("testsss");

                    //System.Data.DataTable dt = new System.Data.DataTable();
                    OleDbDataAdapter oda = new OleDbDataAdapter(Query, Econ);
                    oda.Fill(ds);
                    Econ.Close();
                    Microsoft.Office.Interop.Excel.Application xlApp;
                    Microsoft.Office.Interop.Excel.Workbook xlWorkBook;
                    Microsoft.Office.Interop.Excel._Worksheet xlWorkSheet;
                    Microsoft.Office.Interop.Excel.Range xlRange = null;
                    object misValue = System.Reflection.Missing.Value;
                    xlApp = new Microsoft.Office.Interop.Excel.Application();
                    Microsoft.Office.Interop.Excel.Workbook excelWorkbook = xlApp.Workbooks.Open(workbookPath,
                   0, false, 5, "", "", false, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "",
                   true, false, 0, true, false, false);

                    //xlWorkBook = xlApp.Workbooks.Open(workbookPath, misValue, false, misValue, misValue, misValue, true, misValue, misValue, misValue, misValue, misValue, false, misValue, misValue);
                    //xlWorkBook = xlApp.Workbooks.Open(fileLocation1, misValue, misValue, misValue, misValue, misValue, misValue, misValue, misValue, misValue, misValue, misValue, misValue, misValue, misValue);
                    xlWorkSheet = (Microsoft.Office.Interop.Excel.Worksheet)excelWorkbook.Worksheets.get_Item(1);
                    xlWorkSheet = (Microsoft.Office.Interop.Excel.Worksheet)excelWorkbook.ActiveSheet;

                    xlWorkSheet.Activate();

                    int rw = 0;
                    int cl = 0;
                    string StartRange = "A1";
                    string EndRange = "W23";
                    int colIndex = 1;
                    int rowIndex = 2;
                    xlRange = xlWorkSheet.UsedRange;
                    rw = xlRange.Rows.Count;
                    cl = xlRange.Columns.Count;
                    int i = 8;
                    for (int j = 0; j < dtReturndata.Rows.Count; j++)
                    {
                        xlWorkSheet.Cells[i, 1].Value = dtReturndata.Rows[j]["Emp#"].ToString();
                        xlWorkSheet.Cells[i, 2].Value = dtReturndata.Rows[j]["ID"].ToString();
                        xlWorkSheet.Cells[i, 3].Value = dtReturndata.Rows[j]["Last Name"].ToString();
                        xlWorkSheet.Cells[i, 4].Value = dtReturndata.Rows[j]["First Name"].ToString();
                        xlWorkSheet.Cells[i, 5].Value = dtReturndata.Rows[j]["Wage Period Days"].ToString();
                        xlWorkSheet.Cells[i, 7].Value = dtReturndata.Rows[j]["Hours"].ToString();
                        xlWorkSheet.Cells[i, 8].Value = dtReturndata.Rows[j]["Hourly Wage"].ToString();
                        xlWorkSheet.Cells[i, 9].Value = dtReturndata.Rows[j]["Salary"].ToString();
                        xlWorkSheet.Cells[i, 10].Value = dtReturndata.Rows[j]["OT Hours"].ToString();
                        xlWorkSheet.Cells[i, 11].Value = dtReturndata.Rows[j]["OT Rate"].ToString();
                        xlWorkSheet.Cells[i, 12].Value = dtReturndata.Rows[j]["Overtime Wage"].ToString();
                        xlWorkSheet.Cells[i, 13].Value = dtReturndata.Rows[j]["Naf extraord wg"].ToString();
                        xlWorkSheet.Cells[i, 14].Value = dtReturndata.Rows[j]["Description of extraordinary wage"].ToString();
                        i++;
                    }

                    xlWorkSheet.Cells[5, 7].Value = Period1.ToString();
                    xlWorkSheet.Cells[2, 7].Value = dtReturndata.Rows[0]["vchClientName"].ToString();
                    xlWorkSheet.Cells[2, 11].Value = dtReturndata.Rows[0]["TotalGrossWages"].ToString();
                    xlWorkSheet.Cells[3, 11].Value = Employeecount.ToString();
                    xlWorkSheet.Cells[3, 7].Value = year.ToString();
                    xlWorkSheet.Cells[4, 7].Value = month.ToString();
                    xlWorkSheet.Name = "Hours";
                    excelWorkbook.Save();
                    excelWorkbook.Close();
                    xlApp.Quit();

                    xlWorkSheet = null;
                    excelWorkbook = null;
                    System.Runtime.InteropServices.Marshal.FinalReleaseComObject(xlApp);
                    if (xlApp != null)
                    {
                        xlApp = null;
                    }
                    GC.WaitForPendingFinalizers();
                    GC.Collect();
                    GC.WaitForPendingFinalizers();
                    GC.Collect();
                    //AppendLog("Filesaved");

                    using (MailMessage mail = new MailMessage())
                    {
                        mail.To.Clear();
                        mail.To.Add(ConfigurationManager.AppSettings["smtpFromUser"]);
                        mail.From = new MailAddress(ClientEmailId);
                        mail.Subject = Subject;
                        mail.Body = MainBody;
                     mail.Attachments.Add(new Attachment(fullfilename));
                        mail.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.EnableSsl = true;
                        //smtp.Host = "smtp.office365.com";
                        smtp.Host = "smtp.gmail.com";
                        smtp.Port = 587;
                        smtp.UseDefaultCredentials = false;
                        smtp.Credentials = new System.Net.NetworkCredential(ClientEmailId,ClientPassword);
                        smtp.EnableSsl = true;
                        smtp.Send(mail);
                        smtp.Dispose();
                    }
                    return excelResult = "Success";
                }
                else
                {
                    return excelResult = "Not Success";
                }

       
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static string copyfile(string filename, string OrinalName)
        {
            int count = 1;
            //string Find = "";
            string file = filename;
            // string fileName = CompanyCode + "-M" + "-PIR" + "18" + month1 + "-" + time1 + " " + ".xlsx";
            string OriginalPath = HttpContext.Current.Server.MapPath("~/UploadImage/Excel/ExcelTemplate/" + file);
            //string DestinationPath = HttpContext.Current.Server.MapPath("~/UploadImage/ExcelFile/" + Path.GetFileNameWithoutExtension(OriginalPath) + "_" + DateTime.Now.ToString("yyyy.MM.dd-HH.mm.ss") + Path.GetExtension(OriginalPath));
            string DestinationPath = HttpContext.Current.Server.MapPath("~/UploadImage/" + OrinalName + Path.GetExtension(OriginalPath));
            string DestFileName = Path.GetFileName(DestinationPath);
            try
            {
                if (File.Exists(OriginalPath))
                {
                    if (File.Exists(DestinationPath))
                    {
                        OrinalName = OrinalName + "(" + count.ToString() + ").xlsx";
                        count++;
                        //goto Find;
                    }
                    else
                    {
                        File.Copy(OriginalPath, DestinationPath);
                        //Add your logic here
                        // File.Create(OrinalName);
                    }
                    // string destination= @"c:\test\foo.txt";

                }
            }
            catch (IOException ex)
            {

            }
            return DestFileName;
        }
    }

}
<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="EmpScreen.aspx.cs" Inherits="DocumentManagementSystem.EmployeePages.EmpScreen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/global/plugins/bootstrap-datetimepickerNew/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <style>
        .bootstrap-datetimepicker-widget.dropdown-menu {
            width: 15em;
        }

        .bootstrap-datetimepicker-widget table td {
            height: 30px;
            line-height: 30px;
            width: 30px;
        }

        .bootstrap-datetimepicker-widget a[data-action] {
            padding: 2px 0;
        }

        .bootstrap-datetimepicker-widget table td span {
            width: 30px;
            height: 30px;
            line-height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" runat="server">
    <div class="messageboxdropback">
        <div class="MessageDiv">
            <div class="MessageContent">
                <div class="MessageIcon">
                    <i class="fa fa-info-circle fa-2x"></i>
                </div>
                <div class="MessageText">
                    Message content Text
                </div>
            </div>
        </div>
    </div>

    <div class="Confirmboxdropback">
        <div class="ConfirmDiv">
            <div class="ConfirmContent">
                <div class="ConfirmHeader">
                    <div class="MessageIcon">
                        <i class="fa fa-info-circle fa-2x"></i>
                    </div>
                    <div class="MessageText">
                        Message content Text
                    </div>
                </div>
                <div class="ConfirmConterntText">
                    Confirmation box Content MESSAGE Here only Text        
                </div>
                <div class="ConfirmAction">
                    <button type="button" class="btn btn-primary btn-sm">OK</button>
                    <button id="btnclose" type="button" class="btn btn-default btn-sm">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="col-md-12 maincontentbg">
            <div class="space-medium">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="section-title">
                            <h2>Employee Details</h2>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-horizontal">
                                    <div class="form-body">
                                        <div class="form-group">
                                            <label class="control-label col-md-4">
                                                Company Name
                                            </label>
                                            <div class="col-md-8">
                                                <select class="form-control" name="ddlClient" id="ddlClient">
                                                    <option value="0">--Select Company--</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <fieldset>
                                    <legend>Personal Details</legend>
                                    <div class="form-horizontal frmhr">
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    First Name
                                                </label>
                                                <div class="col-md-8">
                                                    <input type="text" id="txtFirstName" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Last Name
                                                </label>
                                                <div class="col-md-8">
                                                    <input type="text" id="txtLastName" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="form-group mb-0">
                                                <label class="control-label col-md-4">
                                                    Gender
                                                </label>
                                                <div class="col-md-8">
                                                    <div class="p-t-5">
                                                        <input type="radio" id="radiomale" value="M" name="Gender" checked="checked" />
                                                        <label for="radiomale">Male</label>

                                                        <input type="radio" id="radiofemale" value="F" name="Gender" />
                                                        <label for="radiofemale">FeMale</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mb-0">
                                                <label class="control-label col-md-4">
                                                    Married
                                                </label>
                                                <div class="col-md-8">
                                                    <div class="p-t-5">
                                                        <input type="checkbox" name='Married' id="chkMarried" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Place Of Birth
                                                </label>
                                                <div class="col-md-8">
                                                    <asp:HiddenField runat="server" ID="HiddenField5" />
                                                    <input type="text" class="form-control" id="txtPlaceofBirth" aria-multiline="true" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Date Of Birth
                                                </label>
                                                <div class="col-md-8">
                                                    <div class="input-group input-xlarge date date-picker1"  data-date-format="mm-dd-yyyy">
                                                        <input type="text" class="form-control" data-date-end-date="0d" id="dateDOB" name="date" /><%--data-date="01-01-1990"--%>
                                                        <span class="input-group-btn">
                                                            <button class="btn btn-default" id="DOBcalender" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    ID_Number
                                                </label>
                                                <div class="col-md-8">
                                                    <asp:HiddenField runat="server" ID="HiddenField2" />
                                                    <input type="text" class="form-control" id="txtIdnumber" aria-multiline="true"  />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Emp_ID
                                                </label>
                                                <div class="col-md-8">
                                                    <asp:HiddenField runat="server" ID="HiddenField3" />
                                                    <input type="text" class="form-control" id="txtEmpId" aria-multiline="true"  />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Nationality
                                                </label>
                                                <div class="col-md-8">
                                                    <asp:HiddenField runat="server" ID="HiddenField1" />
                                                    <input type="text" class="form-control" id="txtnationality" aria-multiline="true" />
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Address
                                                </label>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control" id="txtaddress" aria-multiline="true" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Phone
                                                </label>
                                                <div class="col-md-8">
                                                    <asp:HiddenField runat="server" ID="HiddenField4" />
                                                    <input type="text" class="form-control" name="Phone" id="txtPhone" data-mask="0000 000 0000" placeholder="1721 599 9999" onkeypress="return isNumber(event)" ondrop="return false;" onpaste="return false;" />
                                                    <span style="font-size: 12px;">Phone Number Example:1721 599 9999 </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                            </div>
                            <div class="col-md-6">
                                <fieldset>
                                    <legend>Basic Wage Data</legend>
                                    <div class="form-horizontal frmhr">
                                        <div class="form-body ">
                                            <div class="form-group mb-0">
                                                <label class="control-label col-md-4">
                                                    Salary Type
                                                </label>
                                                <div class="col-md-8">
                                                    <div class="p-t-5">
                                                        <input type="radio" id="fixed" value="1" name="Salary" checked="checked" />
                                                        <label for="radiofixed">Fixed</label>
                                                        <input type="radio" id="hourly" value="0" name="Salary" />
                                                        <label for="radiohours">Hourly</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Job_description
                                                </label>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control" name="txtjob" id="txtjob" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Days_Per_week
                                                </label>
                                                <div class="col-md-8">

                                                    <input type="text" class="form-control" name="txtdays" id="txtdays" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Hours_Worked
                                                </label>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control" name="txthours" id="txthours"  />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Gross salary in ANG
                                                </label>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control" name="txtsalary" id="txtGrosssalary" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Hourly Wage in ANG
                                                </label>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control" name="txtsalary" id="txthoursWage" disabled />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Date in Service
                                                </label>
                                                <div class="col-md-8">
                                                    <div class="input-group input-xlarge date date-picker-right" data-date-format="mm-dd-yyyy">
                                                        <input type="text" class="form-control" id="dateinservice" name="date" />
                                                        <span class="input-group-btn">
                                                            <button class="btn btn-default" id="DateInservice" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Date Out of service
                                                </label>
                                                <div class="col-md-8">
                                                    <div class="input-group input-xlarge date date-picker-right" data-date-format="mm-dd-yyyy">
                                                        <input type="text" class="form-control" id="dateoutservice" name="date" />
                                                        <span class="input-group-btn">
                                                            <button class="btn btn-default" id="DateOutservice" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Wage Period
                                                </label>
                                                <div class="col-md-8">
                                                    <select class="form-control" name="ddlWagePeriod" id="ddlWagePeriod" disabled>
                                                        <%--<option value="0">--Select WagePeriod--</option>--%>
                                                        <option value="1">MONTHLY</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Last year Gross wages for
                                                </label>
                                                <div class="col-md-8">
                                                    <input type="text" id="LastyearWage" class="form-control" data-toggle="tooltip"  data-placement="bottom" title="ONLY TO BE FILLEDWHEN CALCULATING TAXES ON A BONUS OR EXTRAORDINARY PAYMENT"  />
                                                    <%--<div class="">Hover over me onfocus="ShowTooltip();"--%>
                                                        <%--<span class="tooltiptext">ONLY TO BE FILLEDWHEN CALCULATING TAXES ON A BONUS OR EXTRAORDINARY PAYMENT</span>--%>
                                                     <%--</div>--%>
                                                    <%--<span class="tooltiptext">ONLY TO BE FILLEDWHEN CALCULATING TAXES ON A BONUS OR EXTRAORDINARY PAYMENT</span>--%>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">
                                                    Status
                                                </label>
                                                <div class="col-md-8">
                                                    <select class="form-control" name="ddlplaceofbirth" id="ddlStatus">
                                                        <option value="1">Update</option>
                                                        <%--<option value="0">--Select Status--</option>--%>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <fieldset>
                                    <legend>Additional Wage data</legend>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-horizontal frmhr">
                                                <div class="form-body">
                                                    <div class="form-group" id="txtPeriodMortgage" style="display: none;">
                                                        <label class="control-label col-md-4">
                                                            Period Mortgage Deductions Started
                                                        </label>
                                                        <div class="col-md-4">
                                                            <input type="text" class="form-control" name="Periodmortgoge" id="txtPeriodmortgoge" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id="checkboxAov" style="display: none;">
                                                        <label class="control-label col-md-2">
                                                            AOV
                                                        </label>
                                                        <div class="col-md-1" >
                                                            <div class="p-t-5">
                                                                <input type="checkbox" name="Aov" id="chkAov" />
                                                            </div>
                                                        </div>
                                                        <label class="control-label col-md-1">
                                                            ZV
                                                        </label>
                                                        <div class="col-md-1">
                                                            <div class="p-t-5">
                                                                <input type="checkbox" name="ZV" id="chkZV" />
                                                            </div>
                                                        </div>
                                                        <label class="control-label col-md-2">
                                                            Old_Age_Allowance
                                                        </label>
                                                        <div class="col-md-1">
                                                            <div class="p-t-5">
                                                                <input type="checkbox" class="form-controltest" name="Old_Age" id="chkoldage" />
                                                            </div>
                                                        </div>
                                                        <label class="control-label col-md-2">
                                                            Sole Earner
                                                        </label>
                                                        <div class="col-md-1">
                                                            <div class="p-t-5">
                                                                <input type="checkbox" name="Sole" id="chksole" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <%--  <div class="form-group">
                                                   
                                                </div>--%>
                                                    <div class="form-group">

                                                        <label class="control-label col-md-2">
                                                            Pay  in USD
                                                        </label>
                                                        <div class="col-md-2">
                                                            <div class="p-t-5">
                                                                <input type="checkbox" name="Pay" id="chkpay" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <button type="button" class="btn btn-primary btnprime" onclick="SubmitMethod()" id="btnSave">Save</button>
                                            <button class="btn btn-default btndefault" type="button" id="btncancel" onclick="Cancel()">Cancel</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="customScript" runat="server">
    <script src="../assets/global/plugins/bootstrap-datetimepickerNew/js/moment.min.js"></script>
    <script src="../assets/global/plugins/bootstrap-datetimepickerNew/js/bootstrap-datetimepicker.min.js"></script>
    <script>
        $('.date-picker').datepicker({
            //rtl: Metronic.isRTL(),
            orientation: "left",
            //autoclose: true
        });
        $('.date-picker-right').datepicker({
            //rtl: Metronic.isRTL(),
            orientation: "right",
            //autoclose: true
        });
    </script>
    <script>
        var CreatedDate = new Date();
        var MasterEmployeeId = 0;
        var EmployeeWageid = 0;
        var AddtionalWageId = 0;
      var bitStatus = false;
        var mode = '';
        var SalaryType = 0;
        var IDNumber = 0;
        var strEmp_IdUpdate = 0;
        var CommonUserId = 0;
       
        var EmployeeEditId = getParameterByName('id');
        
        var UserName = "<%= Session["userName"]%>";
        var ClientName = "<%= Session["ClientName"]%>";
        var userid = "<%= Session["userId"]%>";
        var ClientId = "<%= Session["intCID"]%>";
        var PackageName = "<%= Session["strPackageName"]%>";
        //var UserType = $.cookie("UserType");
        var UserType = "<%=Session["UserType"]%>";
        var StatusName = "";

       // var UserType =getParameterByName(Type[1]);
        $(document).ready(function () {
            debugger;
            $('#dateoutservice').val('12-31-2099');           
            if (PackageName == 'Tax Only' || PackageName == 'TurnOver Only') {
                window.location = "../EmployeePages/TurnOverDecelartion.aspx";
                return;
            }

            if ((ClientId == "" && userid == "") || (ClientId == "0" && userid == "0")) {
                debugger;
                alert("Session has Expired.Please Login Again.")
                if (UserType == "External")
                    window.open('/clientLogin.aspx', "_self");
                else if (UserType == "Internal")
                    window.open('/Login.aspx', "_self");
            }            
            $('[data-toggle="tooltip"]').tooltip();
            debugger;           
            if (ClientId == 0 || ClientId == null)
            {
                $('#txtEmpId').removeAttr('disabled');
                $('#ddlStatus').removeAttr('disabled');
                $('#txtIdnumber').attr('disabled', 'disabled');
                
            }
            else {                                
                $('#txtEmpId').attr('disabled', 'disabled');
                $('#ddlStatus').attr('disabled', 'disabled');
                $('#txtIdnumber').removeAttr('disabled');                
            }
            if (ClientId != 0) {
                EmailId = "<%= Session["Email"]%>";
                GetEmailBasedDropDown(ClientId);
             }
             else {
                 GetDropDownClient();
             }
            $('#dateoutservice').attr('disabled', 'disabled');
            $('#DateOutservice').attr('disabled', 'disabled');
            
            function DisableMonday(date) {
                var day = date.getDay();
                // If day == 1 then it is MOnday
                if (day == 1) {

                    return [false];

                } else {

                    return [true];
                }
            }
            $(function () {
                $("#datepicker").datepicker({
                    beforeShowDay: DisableMonday
                });
            });

            if (userid == 0||userid==null||userid=='undefined')
            {
                CommonUserId = "<%= Session["intCID"]%>";
            }
            else {
                CommonUserId = "<%= Session["userId"]%>";
            }
            function GetEmailBasedDropDown(ClientID) {
                debugger
                $.ajax({
                    type: "POST",
                    url: "Employee.aspx/GetClientIdBasedDropDownCompany",
                    datatype: "json",
                    contentType: "application/json; charset=utf-8",
                    cache: false,
                    async: false,
                    data: "{'ClientID':" + ClientID + "}",
                    success: function (result) {
                        var data = result.d;
                        var DataSource = JSON.parse(data);
                        var result = DataSource.Table;
                        $.each(result, function (data, value) {

                            $("#ddlClient").append($("<option></option>").val(value.ID).html(value.Name));
                        })
                        $('#ddlClient').val(ClientId);
                    }
                })
            }
            //GetDropDownPlaceofBirth();
            GetStatus();
            GetWagePeriod();
            GetDate();


            if ((EmployeeEditId != "0" && EmployeeEditId != null) && (EmployeeEditId != null && EmployeeEditId != '')) {
                $('#lblTitle').text("Edit Customer");
                var Employeeids = EmployeeEditId.split(',');
                EmployeeEditId = Employeeids[0];
                ID = Employeeids[1];
                EmployeeEdit(EmployeeEditId, ID);          
            }
            else {
                $('#lblTitle').text("Add Customer");
            }
            //To Get Query String Value
        })
       // })
    function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
        return results === null ? 0 : decodeURIComponent(results[1].replace(/\+/g, " "));
    }
    function GetDropDownClient() {
        CommonUserId = "<%= Session["intCID"]%>";
        debugger;
        arrSearchData = new Array(0);
        arrSearchData[0] = new Array(0);
        arrSearchData[0][0] = 'event';
        arrSearchData[0][1] = 'GetDropDownClient';

        var returnData = initiateAjaxRequest(arrSearchData, "EmpScreen.aspx");
        debugger;
        $('#ddlClient option[value!="0"]').remove();

        $("#ddlClient").append(returnData);
       
    }
    function initiateAjaxRequest(arrsearchdata, url) {
        var _strReturn = null;
        parameters = '';
        if (arrsearchdata.length > 0) {
            for (i = 0; i < arrsearchdata.length; i++) {
                if (parameters == '')
                    parameters = parameters + arrsearchdata[i][0] + '=' + escape(arrsearchdata[i][1]);
                else
                    parameters = parameters + '&' + arrsearchdata[i][0] + '=' + escape(arrsearchdata[i][1]);
            }
        }
        $.ajax({
            url: url,
            type: "POST",
            async: false,
            data: parameters,
            success: function (req) {
                if (req != "") {
                    _strReturn = req;
                }
            },
            error: function () {
                ServerError();
            }
        });
        return _strReturn;
    }
    function ShowTooltip() {
        debugger;
        document.getElementById("LastyearWage").title = "ONLY TO BE FILLEDWHEN CALCULATING TAXES ON A BONUS OR EXTRAORDINARY PAYMENT";
       
    }
   
    function GetStatus() {
        debugger;
        arrSearchData = new Array(0);
        arrSearchData[0] = new Array(0);
        arrSearchData[0][0] = 'event';
        arrSearchData[0][1] = 'GetStatus';

        var returnData = initiateAjaxRequest(arrSearchData, "EmpScreen.aspx");
        debugger;
        $('#ddlStatus option[value!="0"]').remove();

        $("#ddlStatus").append(returnData);
    }
    function GetWagePeriod() {
        debugger;
        arrSearchData = new Array(0);
        arrSearchData[0] = new Array(0);
        arrSearchData[0][0] = 'event';
        arrSearchData[0][1] = 'GetDropDownWagePeriod';

        var returnData = initiateAjaxRequest(arrSearchData, "EmpScreen.aspx");
        debugger;
        $('#ddlWagePeriod option[value!="0"]').remove();

        $("#ddlWagePeriod").append(returnData);
    }

    function SubmitMethod() {
        debugger;
        //var Type = UserType.split('=');
        var WageDataArray = [];
        var AddtionalWagesArray = [];
      
       
        var Id = $('#txtIdnumber').val();
        var test = Id.split('X');

        if (test[0].length == 10) {
            strEmp_IdUpdate = test[0];
        }
        else {
            strEmp_IdUpdate = IDNumber;
        }



        if (bitStatus == false && ($('#ddlStatus option:selected').text() == 'synchronized')) {
            debugger;
            StatusName = 'synchronized'
            bitStatus = true;
        }
        else if (bitStatus == true && ($('#ddlStatus option:selected').text() == 'synchronized') && StatusName != 'synchronized') {
            //StatusName = '';
            StatusName = 'synchronized'
        }
        
        //if ($('#ddlStatus option:selected').text() == 'synchronized') {
        //    bitStatus = true;
        //}
        //else {
        //    bitStatus = false;
        //}
        if (MasterEmployeeId == 0) {
            mode = 'Add';
            
            if ($('#ddlClient').val() == null || $('#ddlClient').val() == 0) {
                toastr.warning('Please Select Client');
                return;
            }
            else if ($('#txtFirstName').val().trim() == "" || $('#txtFirstName').val().trim() == 'undefined') {             
               
                toastr.options = {                    
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Enter The FirstName');

                $('#txtFirstName').focus();
                return;
            }
            else if ($('#txtLastName').val().trim() == "" || $('#txtLastName').val().trim() == 'undefined') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Enter The LastName');
                $('#txtLastName').focus();
                return;
            }
            else if ($('#dateDOB').val() == "" || $('#dateDOB').val() == 'undefined' || $('#dateDOB').val() == null) {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Enter The DateOfBirth');
                $('#dateDOB').focus();
                return;
            }
               

            else if ($('#txtPhone').val().trim() == "" || $('#txtPhone').val().trim() == 'undefined') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Enter The Phone Number');
                $('#txtPhone').focus();
                return;
            }
            else if ($('input:radio[name=Salary]:checked').val() == 1 && ($('#txtGrosssalary').val() == '' || $('#txtGrosssalary').val() == 'undefined')) {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Enter Gross Salary in ANG');
                $('#txtGrosssalary').focus();
                return;
            }
            else if ($('input:radio[name=Salary]:checked').val() == 0 && ($('#txthoursWage').val() == '' || $('#txthoursWage').val() == 'undefined')) {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Enter Hours Wages in ANG');
                $('#txthoursWage').focus();
                return;
            }
           
            else if ($('#dateinservice').val() == "" || $('#dateinservice').val() == 'undefined') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Select InDate Service');
                return;               
            }
            else {
                $('#ddlStatus').val(1);
            }
           // bitStatus = false;
            
           
        }
        else {
            mode = 'update';
            var Id = $('#txtIdnumber').val();
            var test = Id.split('X');
            if (test[0].length ==8) {
                strEmp_IdUpdate = test[0] + '' + MasterEmployeeId;
            }
            else if (test[0].length >7) {
            //var test = $('#txtIdnumber').val();
            //if (test.length >7) {
                strEmp_IdUpdate = test[0];
            }
            else if (IDNumber.length == 8)
            {               
                strEmp_IdUpdate = IDNumber + '' + MasterEmployeeId;
            }
            else {
                strEmp_IdUpdate = IDNumber;
            }
            
            
            if (ClientId == 0 || ClientId == null) {
                if ($('#txtEmpId').val().trim() == "" || $('#txtEmpId').val().trim() == 'undefined') {
                    toastr.options = {
                        "positionClass": "toast-bottom-right",
                    }
                    toastr.warning('Enter the Emp_id');
                    $('#txtEmpId').focus();
                    return;
                }
                else if ($('#dateinservice').val() == "" || $('#dateinservice').val() == 'undefined') {
                    toastr.options = {
                        "positionClass": "toast-bottom-right",
                    }
                    toastr.warning('please Select InDate Service');
                    return;
                }
                else if ($('#dateoutservice').val() == "" || $('#dateoutservice').val() == 'undefined') {
                    toastr.options = {
                        "positionClass": "toast-bottom-right",
                    }
                    toastr.warning(' please Select OutDate Service');
                    return;
                }
                else if ($('input:radio[name=Salary]:checked').val() == 1 && ($('#txtGrosssalary').val() == '' || $('#txtGrosssalary').val() == 'undefined')) {
                    toastr.options = {
                        "positionClass": "toast-bottom-right",
                    }
                    toastr.warning('Enter Gross Salary in ANG');
                    return;
                }
                else if ($('input:radio[name=Salary]:checked').val() == 0 && ($('#txthoursWage').val() == '' || $('#txthoursWage').val() == 'undefined')) {
                    toastr.options = {
                        "positionClass": "toast-bottom-right",
                    }
                    toastr.warning('Enter Hours Wages in ANG');
                    return;
                }               
            }            
            else if ($('#dateinservice').val() == "" || $('#dateinservice').val() == 'undefined') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('please Select InDate Service');
                return;
            }
            else if ($('#dateoutservice').val() == "" || $('#dateoutservice').val() == 'undefined') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning(' please Select OutDate Service');
                return;
            }
            else if ($('input:radio[name=Salary]:checked').val() == 1 && ($('#txtGrosssalary').val() == '' || $('#txtGrosssalary').val() == 'undefined')) {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Enter Gross Salary in ANG');
                return;
            }
            else if ($('input:radio[name=Salary]:checked').val() == 0 && ($('#txthoursWage').val() == '' || $('#txthoursWage').val() == 'undefined')) {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Enter Hours Wages in ANG');
                return;
            }
            //else {
            //    $('#ddlStatus').val(2);
            //}
        }
        var clsEmployeeWages = {
            intEmployeeWageId: EmployeeWageid,
            intEmployeeID: MasterEmployeeId,
            bitIsFixed: $('input:radio[name=Salary]:checked').val() == 1 ? true : $('input:radio[name=Salary]:checked').val() == undefined ? false : false,//$('input:radio[name=Salary]:checked').val(),
            strJobDescription: $('#txtjob').val().trim(),
            strDaysPerWeek: $('#txtdays').val().trim(),
            strHoursWorked: $('#txthours').val().trim(),
            numGrossSalaryANG: $('#txtGrosssalary').val(),
            numHourlyWagANG: $('#txthoursWage').val(),
            dateInServiceDate: $('#dateinservice').val(),
            dateOutServiceDate: $('#dateoutservice').val(),
            intWagePeriodId: $('#ddlWagePeriod').val(),
            strLastYearGrossWagesFor: $('#LastyearWage').val().trim()
        }
        WageDataArray.push(clsEmployeeWages);
        var clsAddtionalWages = {
            intAdditionalWageId: AddtionalWageId,
            intEmployeeID: MasterEmployeeId,
            strPeriodMortageDeductionStarted: $('#txtPeriodmortgoge').val().trim(),
            bitAOV: $('#chkAov').is(":checked"),
            bitZV: $('#chkZV').is(":checked"),//$('#chkMarried').is(":checked")
            bitOldAgeAllownace: $('#chkoldage').is(":checked"),
            bitSoleEarner: $('#chksole').is(":checked"),
            bitPayInUS: $('#chkpay').is(":checked")
        }
        AddtionalWagesArray.push(clsAddtionalWages);

        debugger;
        var clsEmployeeScreen = {
            intEmployeeID: MasterEmployeeId,
            strEmployeeFirstName: $('#txtFirstName').val().trim(),
            strEmployeLastName: $('#txtLastName').val().trim(),
            intClientId: $('#ddlClient').val(),
            strGender: $('input:radio[name=Gender]:checked').val(),
            IsMarried: $('#chkMarried').is(":checked"),
            //intPlaceOfBirthId: $('#ddlplaceofbirth').val(),
            intStatusId: $('#ddlStatus').val(),
            bitStatus: bitStatus,
            strIDNumber: strEmp_IdUpdate,
            strEmpl_Id: $('#txtEmpId').val().trim(),
            strNationality: $('#txtnationality').val().trim(),
            strAddress: $('#txtaddress').val().trim(),
            strPhone: $('#txtPhone').val().trim(),
            dateBirthDate: $('#dateDOB').val(),
            strPlaceOfBirth: $('#txtPlaceofBirth').val().trim(),
            intCreatedBy: CommonUserId,            
            mode: mode,
            intUpdatedBy: CommonUserId,         
            EmployeeWages: WageDataArray,
            AddtionalWages: AddtionalWagesArray,
            UserType: UserType
        }
        $.ajax({
            url: "EmpScreen.aspx/SaveEmployee",
            type: "POST",
            datatype: "json",
            contentType: "application/json; charset=utf-8",
            cache: false,
            async: false,
            data: "{objEmployee:" + JSON.stringify(clsEmployeeScreen) + "}",
            success: function (data) {
                debugger;
                var splitResult1 = data.d;
                var splitResult = splitResult1.split("^&*");
                if (splitResult.length > 1) {
                    var EmployeeID = splitResult[2];
                    var clientid = splitResult[3];
                    debugger;
                    if (UserType == 'External')
                    { GetEmployeeUpdatedExcel(EmployeeID, clientid, mode, "Internal"); }
                    debugger;
                    if (StatusName != '' && StatusName != undefined)

                    {
                        SynchronizedConfirmationMail(EmployeeID, clientid,"External");
                    }
                   
                }
                if (splitResult[1].trim() == "Success") {
                    debugger;
                    bootbox.dialog({
                        message: "The employee has been added,<br/> Please be patient,you will soon get an email indicating that you can start the entering Payroll data and Generating a Payroll.",
                        title: "For you information!",
                        buttons: {
                            success: {
                                label: "OK",
                                className: "btn btn-primary",
                                callback: function () {
                                    Clear();
                                }
                            }

                        }
                    });
                        //toastr.success('The employee has been added, you cannot add a payroll for this employee, until the employee data has been synchronized and Empl-id has been entered.');
                        //toastr.options = {
                        //    "positionClass": "toast-bottom-right",
                        //}                        
                        //Clear();
                    }

                    else if (splitResult[1].trim() == "Warning") {
                        toastr.options = {
                            "positionClass": "toast-bottom-right",
                        }
                        toastr.warning("Employee Already Existing");
                        Clear();
                    }
                    else if (splitResult[1].trim() == "Success1") {
                        toastr.options = {
                            "positionClass": "toast-bottom-right",
                        }
                        toastr.success('Updated Successfully');
                        Clear();
                    }
                }               
                   })
    }
    function Cancel() {
        Clear();
    }
    function EmployeeEdit(EmployeeEditId, ID) {
        {
            debugger;
            $.ajax({
                url: "EmpScreen.aspx/GetEmployeeEdit?id=" + EmployeeEditId + "," + ID,
                type: "POST",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'intclientid':'" + EmployeeEditId + "','ID':'" + ID + "'}",                
                success: function (result) {
                    debugger;
                    var result1 = result.d;
                    var data = JSON.parse(result1);
                    $('#dateoutservice').removeAttr('disabled');
                    $('#DateOutservice').removeAttr('disabled');
                    $('#dateinservice').removeAttr('disabled');
                    $('#DateInservice').removeAttr('disabled');
                    $('#ddlClient').val(data[0].intClientId);
                    $('#txtFirstName').val(data[0].strEmployeeFirstName);
                    $('#txtLastName').val(data[0].strEmployeLastName);
                    $('#txtPeriodmortgoge').val(data[0].strPeriodMortageDeductionStarted);
                    $('#txtjob').val(data[0].strJobDescription);
                    $('#txtdays').val(data[0].strDaysPerWeek);
                    $('#txthours').val(data[0].strHoursWorked);
                    $('#txtGrosssalary').val(data[0].numGrossSalaryANG);
                    $('#txthoursWage').val(data[0].numHourlyWagANG);
                    $('#txtnationality').val(data[0].strNationality);
                    $('#txtaddress').val(data[0].strAddress);
                    $('#txtPhone').val(data[0].strPhone);
                    $('#LastyearWage').val(data[0].strLastYearGrossWagesFor);
                    bitStatus = data[0].bitstatus;
                    $('#txtEmpId').val(data[0].strEmpl_Id);                    
                    $('#ddlStatus').val(data[0].intStatusId);
                    $('#ddlWagePeriod').val(data[0].intWagePeriodId);
                    $('#txtPlaceofBirth').val(data[0].strPlaceOfBirth);                    
                    if (data[0].strIDNumber.length == 8) {
                        $('#txtIdnumber').val(data[0].StrAutoEmployee_Id);
                        IDNumber = data[0].StrAutoEmployee_Id;
                    }
                    if (data[0].strIDNumber.length == 9) {
                        $('#txtIdnumber').val(data[0].strIDNumber);
                        IDNumber = data[0].strIDNumber;
                    }
                    if (data[0].strIDNumber.length == 10) {
                        $('#txtIdnumber').val(data[0].strIDNumber);
                        if (data[0].StrAutoEmployee_Id == null) {
                            IDNumber = data[0].strIDNumber;
                        }
                        else {
                            IDNumber = data[0].StrAutoEmployee_Id;
                        }
                    }

                    if (data[0].dateInServiceDate == null || data[0].dateInServiceDate == '') {
                       
                    }
                    else {
                        var indate = data[0].dateInServiceDate.split('T');
                        $('#dateinservice').attr('data-date-set-date', indate[0]);
                        $('#dateinservice').val(indate[0]);
                    }

                    if (data[0].dateOutServiceDate == null || data[0].dateOutServiceDate == '') {
                        $('#dateoutservice').val('');
                    }
                    else {
                        var outdate = data[0].dateOutServiceDate.split('T');
                        $('#dateoutservice').val(outdate[0]);
                    }
                    if (data[0].dateBirthDate == null || data[0].dateBirthDate == '') {
                        $('#dateDOB').val('');
                    }
                    else {
                        var DOB = data[0].dateBirthDate.split('T00:00:00');
                        $('#dateDOB').val(DOB[0]);
                    }
                    MasterEmployeeId = data[0].intEmployeeID;
                    if (data[0].bitZV == true) {
                        $('#chkZV').prop('checked', true);
                        $.uniform.update('#chkZV');                       
                    }
                    if (data[0].bitAOV == true) {
                        $('#chkAov').prop('checked', true);
                        $.uniform.update('#chkAov');
                       
                    }
                    if (data[0].bitOldAgeAllownace == true) {
                        $('#chkoldage').prop('checked', true);
                        $.uniform.update('#chkoldage');                        
                    }
                    if (data[0].bitSoleEarner == true) {
                        $('#chksole').prop('checked', true);
                        $.uniform.update('#chksole');
                        
                    }
                    if (data[0].bitPayInUS == true) {
                        $('#chkpay').prop('checked', true);
                        $.uniform.update('#chkpay');                        
                    }
                    if (data[0].IsMarried == true) {
                        $('#chkMarried').prop('checked', true);
                        $.uniform.update('#chkMarried');                        
                    }
                    if (data[0].strGender.trim() == 'M') {
                        $($('#radiomale').parent()).addClass('checked')

                    }

                    if (data[0].strGender.trim() == 'F') {
                        $($('#radiofemale').parent()).addClass('checked')
                        $('#uniform-radiomale span.checked').removeClass('checked')
                    }
                    if (data[0].bitIsFixed == true) {
                        $($('#fixed').parent()).addClass('checked')
                        $('#uniform-hourly span.checked').removeClass('checked')
                        $("#txthoursWage").attr("disabled", "disbled");
                        $("#txtGrosssalary").removeAttr("disabled");                        
                        $('input[name=Salary][value="1"]').prop('checked', true)
                    }

                    if (data[0].bitIsFixed == false) {
                        $($('#hourly').parent()).addClass('checked')
                        $('#uniform-fixed span.checked').removeClass('checked')
                        $("#txtGrosssalary").attr("disabled", "disbled");
                        $("#txthoursWage").removeAttr("disabled");
                        $("#txthours").removeAttr("disabled");                        
                        $('input[name=Salary][value="0"]').prop('checked', true)
                    }                    
                    if (ClientName == 0) {
                        DisableEmployeeScreen();
                    }                    

                },
                error: function (result) {

                }

            })
        }
    }

    function Clear() {
        $('#txtjob').val('');
        $('#txtdays').val('');
        $('#txthours').val('');
        $('#txtGrosssalary').val('');
        $('#txthoursWage').val('');
        $('#dateinservice').val('');
        $('#dateoutservice').val('');
        $('#LastyearWage').val('');
        $('#txtPeriodmortgoge').val('');
        $('#txtFirstName').val('');
        $('#txtPlaceofBirth').val('');
        $('#txtLastName').val('');
        $('#ddlClient').val('');
        $('#ddlStatus').val('');        
        $('#txtIdnumber').val('');
        $('#txtEmpId').val('');
        $('#txtnationality').val('');
        $('#txtaddress').val('');
        $('#txtPhone').val('');
        $('#dateDOB').val('');
        $('#txtwagePeriod').val('');
        $('#uniform-chkAov span.checked').removeClass('checked')
        $('#uniform-chkMarried span.checked').removeClass('checked')
        $('#uniform-chkZV span.checked').removeClass('checked')
        $('#uniform-chksole span.checked').removeClass('checked')
        $('#uniform-chkpay span.checked').removeClass('checked')
        $('#uniform-chkoldage span.checked').removeClass('checked')
        $('#uniform-fixed span.checked').removeClass('checked')
        $('#uniform-hourly span.checked').removeClass('checked')
        $('#uniform-radiomale span.checked').removeClass('checked')
        $('#uniform-radiofemale span.checked').removeClass('checked')
        window.location = "Employee.aspx";
        
    }

    $("input[name=Salary]").click(function (e) {
        debugger;
        if ($("input[name=Salary]:checked").val() == "1") {
            $("#txtGrosssalary").removeAttr("disabled");
            $("#fixed").removeAttr("disabled");
            $("#txthoursWage").attr("disabled", "disbled");           
            $("#txthoursWage").val('');
            $("#txthours").val('');
            
        } else if ($("input[name=Salary]:checked").val() == "0") {
            $("#txthoursWage").removeAttr("disabled");
            $("#hourly").removeAttr("disabled");
            $("#txthours").removeAttr("disabled");
            $("#txtGrosssalary").attr("disabled", "disbled");
            $("#txtGrosssalary").val('');            
        }
    });

    function GetDate() {
        debugger;
        var date = new Date();
        var currentMonth = date.getMonth();
        var currentDate = date.getDate();
        var currentYear = date.getFullYear();
        $('.date-picker1').datepicker({           
            endDate: "31-12-2010",
            format: "mm-dd-yyyy",
        });
    }

    function DisableEmployeeScreen() {
        $("#txtFirstName").attr("disabled", "disbled");
        $("#txtLastName").attr("disabled", "disbled");
        $("#txtPeriodmortgoge").attr("disabled", "disbled");
        $("#txtjob").attr("disabled", "disbled");
        $("#txtdays").attr("disabled", "disbled");
        $("#txtGrosssalary").attr("disabled", "disbled");
        $("#txthoursWage").attr("disabled", "disbled");
        $("#txtnationality").attr("disabled", "disbled");
        $("#txtPhone").attr("disabled", "disbled");
        $("#txtaddress").attr("disabled", "disbled");
        $("#txtIdnumber").attr("disabled", "disbled");        
        $("#ddlWagePeriod").attr("disabled", "disbled");
        $("#LastyearWage").attr("disabled", "disbled");
        $("#dateDOB").attr("disabled", "disbled");
        $("#txtPlaceofBirth").attr("disabled", "disbled");        
        $("#ddlClient").attr("disabled", "disbled");
        $("#fixed").attr("disabled", "disbled");
        $("#hourly").attr("disabled", "disbled");
        $("#radiomale").attr("disabled", "disbled");
        $("#radiofemale").attr("disabled", "disbled");
        $("#chkAov").attr("disabled", "disbled");
        $("#chkZV").attr("disabled", "disbled");
        $("#chksole").attr("disabled", "disbled");
        $("#chkoldage").attr("disabled", "disbled");
        $("#chkpay").attr("disabled", "disbled");
        $("#chkMarried").attr("disabled", "disbled");
        $("#txthours").attr("disabled", "disbled");
        $('#DOBcalender').attr('disabled', 'disabled');        
    }

    var specialKeys = new Array();
    specialKeys.push(8); //Backspace
  
    function isNumber(evt) {
        debugger;
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (event.keyCode == 47) {
            return true;
        }
        else if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            toastr.options = {
                "positionClass": "toast-bottom-right",
            }
            toastr.warning("Digits Only");
            return false;

        }
        else return true;
    }

            //Auto Generate ID_Number On change Event
    $('.date-picker1').on('change', function () {
        debugger;
        var DateFormat = $('#dateDOB').val();
        var DateDOB = DateFormat.split('-');
        var Empl_Id = DateDOB[2] + DateDOB[1] + DateDOB[0] + 'XX';
        IDNumber = DateDOB[2] + DateDOB[1] + DateDOB[0];
        $('#txtIdnumber').val(Empl_Id);

    });

    function errorMsg() {
        debugger;
        $(".messageboxdropback").fadeIn("fast");
        $(".MessageDiv").animate({ top: "50%", opacity: '1', }, 1000);
        $(".MessageDiv").delay(5000).animate({ top: "-50%", opacity: '0', }, 500, function () {
            $(".messageboxdropback").fadeOut("fast");
        });

    }
    function ConfirmMsg() {
        debugger;
        $(".Confirmboxdropback").fadeIn("fast");
        $(".ConfirmDiv").animate({ top: "50%", opacity: '1', }, 1000);

    }
    function confirmboxclose()
    {
        $(".ConfirmDiv").animate({ top: "-50%", opacity: '0', }, 800, function () {
            $(".Confirmboxdropback").fadeOut("fast");
        });
    }
    $("#btnclose").click(function () {
        confirmboxclose();
    });
    function GetEmployeeUpdatedExcel(EmployeeID, clientid, mode, UserType) {
        debugger;
        $.ajax({
            
            url: "EmpScreen.aspx/GetEmployeeUpdatedExcel?id=" + EmployeeID + "," + clientid + "," + mode + "&UserType=" + UserType ,
            type: "POST",
           
            datatype: "json",
            contentType: "application/json; charset=utf-8",
            cache: false,
            async: false,
            data: "{'EmployeeID':'" + EmployeeID + "','clientid':'" + clientid + "','Mode':'" + mode + "','UserType':'"+UserType+"'}",
        
            success: function (data) {
                debugger;              
            },
            error: function (data) {
            }
        })
        
    }


    function SynchronizedConfirmationMail(EmployeeID, clientid, UserType) {
        $.ajax({
            url: "EmpScreen.aspx/SynchronizedConfirmationMail",
            type: "POST",
            datatype: "json",
            contentType: "application/json; charset=utf-8",
            cache: false,
            async: false,
            data: "{'EmployeeID':'" + EmployeeID + "','clientid':'" + clientid + "','UserType':'" + UserType + "'}",
            success: function (data) {
                debugger;
            },
            error:function(data)
            {

            }
        })
    }
       </script>
</asp:Content>

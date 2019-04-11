<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="TurnOverDecelartion.aspx.cs" Inherits="DocumentManagementSystem.EmployeePages.TurnOverDecelartion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" runat="server">
   <div class="container">
        <div class="col-md-12 maincontentbg">
            <div class="space-medium">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="section-title">
                            <h2>TurnOver Declaration</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-offset-2 col-md-8">
                                <fieldset>
                                    <legend>TurnOver Declaration List</legend>
                                <div id="form_sample_3" class="form-horizontal frmhr">
                                    <div class="form-body">
                                        <div class="form-group">
                                            <label class="control-label col-md-4">
                                                Company Name
                                            </label>
                                            <div class="col-md-8">
                                                <select class="form-control" id="ddlClient" name="ddlClient">
                                                    <option value="0">--Select Company--</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-4">
                                                Tax_Type
                                            </label>
                                            <div class="col-md-8">
                                                <select class="form-control" id="ddlTaxType" name="ddlTaxType" disabled>
                                                    <option value="8">Turn Over Tax</option>
                                                </select>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label col-md-4">
                                              Year
                                            </label>
                                            <div class="col-md-8">
                                                <select class="form-control" id="ddlYear" name="ddlYear">
                                                    <option value="0">--Select Year--</option>
                                                </select>
                                            </div>
                                        </div>
                                        <%--<div class="form-group">
                                            <label class="control-label col-md-4">
                                                Year
                                            </label>
                                            <div class="col-md-8">
                                                <input type="text" id="txtYear" class="form-control" />
                                                <span id="errmsg"></span>
                                            </div>
                                        </div>--%>
                                       <%-- <div class="form-group">
                                            <label class="control-label col-md-4">
                                                Period
                                            </label>
                                            <div class="col-md-8">
                                                <input type="text" id="txtPeriod" class="form-control" />
                                            </div>
                                        </div>--%>
                                        <div class="form-group">
                                            <label class="control-label col-md-4">
                                              Period
                                            </label>
                                            <div class="col-md-8">
                                                <select class="form-control" id="ddlPeriod" name="ddlPeriod">
                                                    <option value="0">--Select Period--</option>
                                                    <option value="1">January</option>
                                                    <option value="2">February</option>
                                                    <option value="3">March</option>
                                                     <option value="4">April</option>
                                                     <option value="5">May</option>
                                                     <option value="6">June</option>
                                                      <option value="7">July</option>
                                                      <option value="8">August</option>
                                                      <option value="9">September</option>
                                                        <option value="10">October</option>
                                                        <option value="11">November</option>
                                                        <option value="12">December</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-4">
                                                Currencies
                                            </label>
                                            <div class="col-md-8">
                                                <select class="form-control" name="ddlCurrency" id="ddlCurrency">
                                                    <option value="0">--Select Currency--</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-4">
                                                Amount
                                            </label>
                                            <div class="col-md-8">
                                                <asp:HiddenField runat="server" ID="HiddenField1" />
                                                <input type="text" class="form-control" id="txtAmount" aria-multiline="true" /><span id="errAmount"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-4">
                                                Amount ANG
                                            </label>
                                            <div class="col-md-8">
                                                <asp:HiddenField runat="server" ID="HiddenField2" />
                                                <input type="text" class="form-control" id="txtAmountANG" aria-multiline="true" disabled /><span id="errAmountANG"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-4">
                                                TaxRate%
                                            </label>
                                            <div class="col-md-8">
                                                <asp:HiddenField runat="server" ID="HiddenField3" />
                                                <input type="text" class="form-control" id="txtTaxRate" aria-multiline="true" /><span id="errTaxRate"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-4">
                                                Conversion Rate
                                            </label>
                                            <div class="col-md-8">
                                                <asp:HiddenField runat="server" ID="HiddenField4" />
                                                <input type="text" class="form-control" name="txtConversionRate" id="txtConversionRate" disabled /><span id="errConversion"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-4">
                                                AmountTax ANG
                                            </label>
                                            <div class="col-md-4">
                                                <asp:HiddenField runat="server" ID="HiddenField5" />
                                                <input type="text" class="form-control" name="txtAmountTaxANG" id="txtAmountTaxANG" disabled />
                                                <span id="errAmountTax"></span>
                                            </div>
                                            <div class="col-md-4">
                                                <button type="button" id="btncalculate" onclick="CalculateMethod()" class="btn btn-primary btn-xs btn-block" value="Cal" title="Save">Calculate</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-4" id="AmountTaxUSD">
                                                AmountTax Naf
                                            </label>
                                            <div class="col-md-8">
                                                <asp:HiddenField runat="server" ID="HiddenField6" />
                                                <input type="text" class="form-control" name="txtAmountNaf" id="txtAmountNaf" disabled /><span id="errAmountNaf"></span>
                                            </div>
                                        </div>
                                          <div class="form-group">
                                            <label class="control-label col-md-4" >
                                                Status
                                            </label>
                                            <div class="col-md-8">
                                                    <select class="form-control" name="ddlStatus" id="ddlStatus">
                                                        <option value="1">Update</option>                                                       
                                                    </select>
                                                </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-4">
                                                Date Entered
                                            </label>
                                            <div class="col-md-8">
                                                <div class="input-group date date-picker" data-date-format="mm-dd-yyyy">
                                                    <input type="text" class="form-control" id="dateentered" name="date" placeholder="MM-dd-yyyy" />
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                </fieldset>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-offset-2 col-md-8">
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-offset-4 col-md-8">
                                            <button type="button" id="btnSave" onclick="SubmitMethod()" class="btn btn-primary" value="Save" title="Save">Save</button>
                                            <button type="button" id="btnClose" class="btn btn-default" onclick="Cancel()" value="Cancel" title="Cancel">Cancel</button>
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
    <script>
        $('.date-picker').datepicker({
            //rtl: Metronic.isRTL(),
            orientation: "left",
            autoclose: true
        });
        $('.date-picker-right').datepicker({
            //rtl: Metronic.isRTL(),
            orientation: "right",
            autoclose: true
        });
    </script>
    <script>
        var MasterTurnOver = 0;
        var CommonUserId = 0;
        var userid = "<%= Session["userId"]%>";
        var ClientId = "<%= Session["intCID"]%>";
        var ID = getParameterByName('id');
        var PackageName = "<%= Session["strPackageName"]%>";
        var UserType = $.cookie("UserType");
        var TotalAmountNaf = 0;
        var selectedText = '';
        var year = new Date().getFullYear();
        for (i = 2010; i <= year; i++) {
            debugger
            $('#ddlYear').append('<option value=' + i + '>' + i + '</option>');
        }

        var MasterPaymentHistroy = 0;
        var Trialstatus = '';
        var Masterclient = 0;
        var PackageStatus = '';
        var Paymentstatus = '';
        var PackageID = 0;
        var PackageStartDate = '';
        var PayRollAmount = '';
        var TurnOverAmount = '';
        var PaymentStatus = '';
        var bitActive=false;
        var bitTrialstatus = '';
        var TotalAmount = 0;        
        $(document).ready(function () {
            debugger;
            if ((ClientId == "" && userid == "")) {
                // alert("Session has Expired.Please Login Again.")(
                window.open('/Login.aspx', "_self");
            }
            if (PackageName == 'PayRoll Only') {
                window.location = "../EmployeePages/PayRoll.aspx";
                return;
            }
            if (ClientId == 0 || ClientId == null) {
                $('#ddlStatus').removeAttr('disabled');
            }
            else {
                $('#ddlStatus').attr('disabled', 'disabled');
            }            
            $('#txtConversionRate').val('1.78');
            if (ClientId != 0) {
                EmailId = "<%= Session["Email"]%>";
                GetEmailBasedDropDown(EmailId);
            }
            else {
                GetDropDownClient();
            }
            //GetDropDownTaxType();
            GetClientDetails(ClientId);
            GetDropDownCurrency();
            GetStatus();
            var d = new Date().getDate();
            var m = new Date().getMonth() + 1; // JavaScript months are 0-11
            var y = new Date().getFullYear();
            $("[id$=dateentered]").val(m + "-" + d + "-" + y);
            $("[id$=dateentered]").datepicker({ weekStart: 1, dateFormat: 'mm/dd/yy' });
            
            
            if (userid == 0 || userid == null || userid == 'undefined') {
                CommonUserId = "<%= Session["intCID"]%>";
            }
            else {
                CommonUserId = "<%= Session["userId"]%>";
            }
            if ((ID != "0" && ID != null) && (ID != null && ID != '')) {
                debugger;              
                TurnOverDecelartionEdit(ID);
            }
            else {
                $('#lblTitle').text("Add Customer");
            }
        })

        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? 0 : decodeURIComponent(results[1].replace(/\+/g, " "));
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
        function GetEmailBasedDropDown(EmailId) {
            debugger
            $.ajax({
                type: "POST",
                url: "TurnOverList.aspx/GetEmailBasedDropDown",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'EmailId':'" + EmailId + "'}",
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
        function GetDropDownClient() {
            CommonUserId = "<%= Session["intCID"]%>";
            debugger;
            arrSearchData = new Array(0);
            arrSearchData[0] = new Array(0);
            arrSearchData[0][0] = 'event';
            arrSearchData[0][1] = 'GetDropDownClient';

            var returnData = initiateAjaxRequest(arrSearchData, "TurnOverDecelartion.aspx");
            debugger;
            $('#ddlClient option[value!="0"]').remove();
            $("#ddlClient").append(returnData);            
        }
        function GetDropDownTaxType() {
            debugger;
            arrSearchData = new Array(0);
            arrSearchData[0] = new Array(0);
            arrSearchData[0][0] = 'event';
            arrSearchData[0][1] = 'GetDropDownTaxType';

            var returnData = initiateAjaxRequest(arrSearchData, "TurnOverDecelartion.aspx");
            debugger;
            $('#ddlTaxType option[value!="0"]').remove();

            $("#ddlTaxType").append(returnData);
        }
        function GetDropDownCurrency() {
            debugger;
            arrSearchData = new Array(0);
            arrSearchData[0] = new Array(0);
            arrSearchData[0][0] = 'event';
            arrSearchData[0][1] = 'GetDropDownCurrency';

            var returnData = initiateAjaxRequest(arrSearchData, "TurnOverDecelartion.aspx");
            debugger;
            $('#ddlCurrency option[value!="0"]').remove();
            $("#ddlCurrency").append(returnData);
        }


        function GetClientDetails(ClientId) {
            debugger;

            $.ajax({
                type: "POST",
                url: "PayRoll.aspx/GetClientDetails",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'ClientId':'" + ClientId + "'}",
                success: function (result) {
                    var data = result.d;
                    var DataSource = JSON.parse(data);
                    var result = DataSource.Table;
                    Masterclient = DataSource.Table[0].intCID;
                    if (DataSource.Table1.length > 0) {
                        MasterPaymentHistroy = DataSource.Table1[0].intPaymentHistroyId;
                        PackageStatus = DataSource.Table1[0].strPackageStatus;
                        PackageID = DataSource.Table1[0].intPackageId;
                        PackageStartDate = DataSource.Table1[0].PackageStartDate;
                        PayRollAmount = DataSource.Table1[0].PayrollPackageAmount1;
                        TurnOverAmount = DataSource.Table1[0].TurnOverPackageAmount1;
                        Paymentstatus = DataSource.Table1[0].strPaymentStatus;
                        bitTrialstatus = DataSource.Table1[0].bitTrialStatus;
                        TotalAmount = DataSource.Table1[0].TotalAmount;
                    }
                    else {
                        MasterPaymentHistroy = 0;
                        PackageStatus = '';
                        PackageID = 0;
                        PackageStartDate = '';
                        PayRollAmount = 0;
                        TurnOverAmount = 0;
                        Paymentstatus = '';
                        bitTrialstatus = 0;
                        TotalAmount = 0;
                    }
                }
            });
        }
        function SubmitMethod() {
            var Type = UserType.split('=');
            if ($('#ddlClient').val() == '' || $('#ddlClient').val() == null || $('#ddlClient').val() == 'undefined' || $('#ddlClient').val() == 0) {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Select Client Name');
                $('#ddlClient').focus();
                return;
            }
            else if ($('#ddlTaxType').val() == '' || $('#ddlTaxType').val() == null || $('#ddlTaxType').val() == 'undefined' || $('#ddlTaxType').val() == 0) {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Select TaxType');
                $('#ddlTaxType').focus();
                return;
            }
            else if ($('#ddlYear').val() == '' || $('#ddlYear').val() == null || $('#ddlYear').val() == 'undefined' || $('#ddlYear').val() == 0) {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Enter Year')
                $('#ddlYear').focus();
                return;
            }
            else if ($('#ddlPeriod').val() == '' || $('#ddlPeriod').val() == null || $('#ddlPeriod').val() == 0) {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Select The Period');
                $('#txtTaxRate').focus();
                return;
            }
            else if ($('#ddlCurrency').val() == '' || $('#ddlCurrency').val() == null || $('#ddlCurrency').val() == 'undefined' || $('#ddlCurrency').val() == 0) {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Select Currency');
                $('#ddlCurrency').focus();
                return;
            }
            else if ($('#txtAmount').val() == '' || $('#txtAmount').val() == null || $('#txtAmount').val() == 'undefined' || $('#txtAmount').val() == 0) {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Enter Amount')
                $('#txtAmount').focus();
                return;
            }
            else if ($('#txtTaxRate').val() == '' || $('#txtTaxRate').val() == null || $('#txtTaxRate').val() == 'undefined') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Enter The TaxRate');
                $('#txtTaxRate').focus();
                return;
            }
            else if (TurnOverAmount == 'undefined'|| TurnOverAmount == 0)
            {
                if (userid != 0)
                {

                }
                else
                {
                    toastr.options = {
                        "positionClass": "toast-bottom-right",
                    }
                    toastr.warning('Please choose the Package');
                    return;
                }               
            }
            
            
            debugger;
            var TurnOver = [];
        // if ($('#ddlStatus option:selected').text() == 'synchronized')
        //    {
        //        bitActive = true;

        //    }
        //else
        //{
        //        bitActive = false;
        //}
            if (MasterTurnOver == 0) {
                mode = 'Add';
            }
            else {
                mode = 'update';

                if (bitActive == false && ($('#ddlStatus option:selected').text() == 'synchronized')) {
                    var StatusName = 'synchronized'
                    bitStatus = true;
                }
                else if (bitActive == true && ($('#ddlStatus option:selected').text() == 'synchronized')) {
                    StatusName = '';
                }
            }
            if ($('#txtConversionRate').val() == '' || $('#txtConversionRate').val() == null || $('#txtConversionRate').val() == 'undefined') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Enter The Conversion Rate');
                $('#txtConversionRate').focus();
                return;
            }            
            else if (selectedText == "ANG") {
                if ($('#txtTaxRate').val() <= 100) {
                    var Amount = $('#txtAmount').val();
                    var TaxRate = $('#txtTaxRate').val();
                    var AmountNaf = Amount * TaxRate;
                    TotalAmountNaf = AmountNaf / 100;
                    $('#txtAmountTaxANG').val(TotalAmountNaf.toFixed(2));
                }
            }
            else if (selectedText == "Dollar") {
                if ($('#txtTaxRate').val() <= 100) {
                    var Amount = $('#txtAmount').val();
                    var TaxRate = $('#txtTaxRate').val();
                    var AmountNaf = Amount * TaxRate;
                    TotalAmountNaf = AmountNaf / 100;
                    var ConversionRate = $('#txtConversionRate').val();
                    var TotalAmountANG = TotalAmountNaf * ConversionRate;
                    $('#txtAmountTaxANG').val(TotalAmountANG.toFixed(2));
                }

            }
            if (PackageStatus == 'Trial') {
                Trialstatus = true;
                Paymentstatus = 'Unpaid';              
            }
            else {
                Trialstatus = true;
                Paymentstatus = 'Unpaid';
            }
            var clsTurnOverDecelartion = {
                intTurnOverId: MasterTurnOver,
                intClientID: $('#ddlClient').val(),
                intTaxTypeId: $('#ddlTaxType').val(),
                intCurrencyId: $('#ddlCurrency').val(),
                intYear: $('#ddlYear').val(),
                strPeriod: $('#ddlPeriod').val(),
                numAmount: $('#txtAmount').val().trim(),
                numAmountANG: $('#txtAmountANG').val().trim(),
                numTaxRate: $('#txtTaxRate').val().trim(),
                numConversionRate: $('#txtConversionRate').val().trim(),
                numAmountTaxANG: $('#txtAmountTaxANG').val().trim(),
                numAmountTaxNaf: $('#txtAmountNaf').val().trim(),
                intStatus: $('#ddlStatus').val(),
                bitActive:bitActive,
                dateEntered: $('#dateentered').val(),
            }
            TurnOver.push(clsTurnOverDecelartion);            
            var TOAmount = 0;            
            TOAmount = TurnOverAmount;
            var clsPaymentHistroy = [];
            var PaymentHistroy = {
                intPaymentHistroyId: MasterPaymentHistroy,
                intClientId: Masterclient,
                intPackageId: PackageID,
                strPackageStatus: PackageStatus,
                strPaymentStatus: Paymentstatus,
                PackageStartDate: PackageStartDate,
                PayRollAmount: 0,
                TurnOverAmount: TOAmount,
                TotalAmount: TotalAmount + TOAmount,// TotalAmount,
                bitTrialStatus: Trialstatus,                
            }
            clsPaymentHistroy.push(PaymentHistroy);
            var clscommonTurnOver = {
                TurnOverDecelartion: TurnOver,
                LoginId: CommonUserId,
                strMode: mode,
                PaymentHistroy: clsPaymentHistroy,
                userType: Type[1],
            }
            $.ajax({
                url: "TurnOverDecelartion.aspx/SaveTurnOver",
                type: "POST",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{objTurnOver:" + JSON.stringify(clscommonTurnOver) + "}",
                success: function (data) {
                    var splitResult1 = data.d;
                    var splitResult = splitResult1.split("^&*");
                    
                        if (splitResult[1] == "Success") {
                            toastr.success('Saved Successfully');
                            toastr.options = {
                                "positionClass": "toast-bottom-right",
                            }
                            if (splitResult.length > 1) {
                                var TurnOverId = splitResult[2];
                                var clientid = splitResult[3];
                                ID = TurnOverId;
                                GetEmailTurnOver(ID, mode);
                                if (StatusName != '' && StatusName != undefined)
                                {
                                    SynchronizedTurnOverConfirmationMail(ID, clientid);
                                }
                                else {
                                   
                                }                                
                            }
                            Clear();
                        }
                        else if (splitResult[1].trim() == "Warning") {
                            var DeleteID = splitResult[2];
                            DeleteTurnOver(DeleteID);                           
                        }
                        else {
                            toastr.options = {
                                "positionClass": "toast-bottom-right",
                            }
                            toastr.success('Updated Successfully');
                            Clear();
                        }                                          
                }
            })
        }
        function initiateAjaxRequest(arrsearchdata, url) {
            var _strreturn = null;
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
        function Cancel() {
            Clear();
        }
        function Clear() {

            $('#ddlClient').val('');
            $('#ddlTaxType').val('');
            $('#ddlCurrency').val('');
            $('#ddlYear').val('');
            $('#ddlPeriod').val('');
            $('#txtAmount').val('');
            $('#txtTaxRate').val('');
            $('#txtConversionRate').val('');
            $('#txtAmountTaxANG').val('');
            $('#txtAmountNaf').val('');
            $('#dateentered').val('');
            window.location = "TurnOverList.aspx";
        }

        function TurnOverDecelartionEdit(ID) {
            {
                debugger;
                $.ajax({
                    url: "TurnOverDecelartion.aspx/GetTurnOverDecelartion?id=" + ID,
                    type: "POST",
                    datatype: "json",
                    contentType: "application/json; charset=utf-8",
                    cache: false,
                    async: false,
                    data: "{'ID':'" + ID + "'}",
                    //data: "{LoginUser:'" + LoginUser + "','CertificateId' : '" + CertificateId + "'}",
                    //data: "{intclientid,ID:" + JSON.stringify(intclientid, ID) + "}",
                    success: function (result) {
                        var result1 = result.d;
                        var data = JSON.parse(result1);
                        $('#ddlClient').val(data[0].intClientID);
                        $('#ddlTaxType').val(data[0].intTaxTypeId);
                        $('#ddlCurrency').val(data[0].intCurrencyId);
                        $('#ddlYear').val(data[0].intYear);
                        $('#ddlPeriod').val(data[0].strPeriod);
                        $('#txtAmount').val(data[0].numAmount);
                        $('#txtTaxRate').val(data[0].numTaxRate);
                        $('#txtConversionRate').val(data[0].numConversionRate);
                        $('#txtAmountTaxANG').val(data[0].numAmountTaxANG);
                        $('#txtAmountNaf').val(data[0].numAmountTaxNaf);
                        $('#txtAmountANG').val(data[0].numAmountAng);
                        $('#ddlStatus').val(data[0].intStatus);
                        bitActive = data[0].bitActive;
                        MasterTurnOver = data[0].intTurnOverId;
                        var DateEntered = data[0].dateEntered1.split('T')[0];
                        //var DateEntered = data[0].dateEntered.split('T00:00:00');
                        $('#dateentered').val(DateEntered);
                        if($('#ddlCurrency').val(data[0].intCurrencyId)==1)
                        {
                            $('#AmountTaxUSD').text('AmountTax Naf');
                        }
                        else {
                            $('#AmountTaxUSD').text('AmountTax USD');
                        }
                    },
                    error: function (result) {

                    }
                })
            }
        }

        $('#txtTaxRate').keypress(function (e) {
            if (e.which != 8 && e.which != 0 && (e.which < 45 || e.which > 57)) {
                //display error message
                $("#errTaxRate").html("Digits Only").show().fadeOut("slow");
                return false;
            }
            debugger
            if ($('#ddlCurrency').val() == '0' || $('#ddlCurrency').val() == '') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Select Currency');
                $('#ddlCurrency').focus();
                return;
            }
            else if ($('#txtAmount').val() == '' || $('#txtAmount').val() == null || $('#txtAmount').val() == '') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Enter the Amount');
                $('#txtAmount').focus();
                return;
            }
            else {
                debugger;
                calculateAmount();
            }
        });
        function calculateAmount() {
            debugger;
            //            if ($('#ddlCurrency').val() == '1') {
            if ($('#txtTaxRate').val() <= 100) {
                var Amount = $('#txtAmount').val();
                var TaxRate = $('#txtTaxRate').val();
                var AmountNaf = Amount * TaxRate;
                TotalAmountNaf = AmountNaf / 100;
                $('#txtAmountNaf').val(TotalAmountNaf.toFixed(2));//+ '' + 'ANG'

            }
            else {
                toastr.warning('TaxRate sholud be less than 100');
                $('#txtTaxRate').val("");
                $('#txtAmountNaf').val("");
                return;
            }
           
        }

        $("#ddlYear").keypress(function (e) {
            //if the letter is not digit then display error and don't type anything
            if (e.which != 8 && e.which != 0 && (e.which < 45 || e.which > 57)) {
                //display error message
                $("#errmsg").html("Digits Only").show().fadeOut("slow");
                return false;
            }
        });
        $("#txtAmount").keypress(function (e) {
            var Amount = $(txtAmount).val();
            //if the letter is not digit then display error and don't type anything 
            if (e.which != 8 && e.which != 0 && (e.which < 45 || e.which > 57)) {
                debugger;
                //display error message
                $("#errAmount").html("Digits Only").show().fadeOut("slow");
                return false;
            }
            else if (selectedText=='ANG'){
                var Amount = $("#txtAmount").val();
                $("#txtAmountANG").val(Amount.toFixed(2));
                calculateAmount();
            }
            else if(selectedText=='Dollar')
            {
                var c = String.fromCharCode(e.which);
                var c1 = this.value;
                var conversion = c1 + '' + c;
                var Amount1 = $("#txtAmount").val();
                var conversionRate = conversion;
                var DollarAmount = Amount1 * conversionRate;
                $("#txtAmountANG").val(DollarAmount.toFixed(2));
                calculateAmount();
            }
        });     
        $("#txtConversionRate").keypress(function (e) {
            debugger;
            //if the letter is not digit then display error and don't type anything
            if (e.which != 8 && e.which != 0 && (e.which < 45 || e.which > 57)) {
                //display error message
                $("#errConversion").html("Digits Only").show().fadeOut("slow");
                return false;
            }
            else {
                var c = String.fromCharCode(e.which);
                var c1 = this.value;
                var conversion=c1+''+c;
                var Amount1 = $("#txtAmount").val();
                var conversionRate = conversion;
                var DollarAmount = Amount1 * conversionRate;
                $("#txtAmountANG").val(DollarAmount.toFixed(2));
            }
        });
        $("#txtAmountTaxANG").keypress(function (e) {
            //if the letter is not digit then display error and don't type anything
            if (e.which != 8 && e.which != 0 && (e.which < 45 || e.which > 57)) {
                //display error message
                $("#errAmountTax").html("Digits Only").show().fadeOut("slow");
                return false;
            }
        });
        $("#txtAmountNaf").keypress(function (e) {
            debugger;
            //if the letter is not digit then display error and don't type anything
            if (e.which != 8 && e.which != 0 && (e.which < 45 || e.which > 57)) {
                //display error message
                $("#errAmountNaf").html("Digits test").show().fadeOut("slow");
                return false;
            }
        });


        function CalculateMethod() {
            debugger;
            if ($('#txtConversionRate').val() == '' || $('#txtConversionRate').val() == null || $('#txtConversionRate').val() == 'undefined') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Enter The Conversion Rate');
                $('#txtConversionRate').focus();
                return;
            }
            else if ($('#txtTaxRate').val() == '' || $('#txtTaxRate').val() == null || $('#txtTaxRate').val() == 'undefined') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Enter The TaxRate');
                $('#txtTaxRate').focus();
                return;
            }
            else if ($('#ddlCurrency').find("option:selected").text() == "ANG") {
                if ($('#txtTaxRate').val() <= 100) {
                    var Amount = $('#txtAmount').val();
                    var TaxRate = $('#txtTaxRate').val();
                    var AmountNaf = Amount * TaxRate;
                    TotalAmountNaf = AmountNaf / 100;
                    $('#txtAmountTaxANG').val(TotalAmountNaf.toFixed(2));
                }
            }
            else if ($('#ddlCurrency').find("option:selected").text() == "Dollar") {
                if ($('#txtTaxRate').val() <= 100) {
                    var Amount = $('#txtAmount').val();
                    var TaxRate = $('#txtTaxRate').val();
                    var AmountNaf = Amount * TaxRate;
                    TotalAmountNaf = AmountNaf / 100;
                    var ConversionRate = $('#txtConversionRate').val();
                    var TotalAmountANG = TotalAmountNaf * ConversionRate;
                    $('#txtAmountTaxANG').val(TotalAmountANG.toFixed(2));
                }

            }
        };

        $('#txtTaxRate').keyup(function () {
            debugger;            
            calculateAmount();            
        });
        $('#txtConversionRate').keyup(function (e) {
            debugger;
            //var c = String.fromCharCode(e.which);
            var c1 = this.value;
            var conversion = c1;
            var Amount1 = $("#txtAmount").val();
            var conversionRate = conversion;
            var DollarAmount = Amount1 * conversionRate;
            $("#txtAmountANG").val(DollarAmount.toFixed(2));
        });        
        $("#txtAmount").keypress(function (e) {
            if ($('#ddlCurrency').val() == 0 || $('#ddlCurrency').val() == null || $('#ddlCurrency').val() == '--Select Currency--') {
                $("#txtAmountANG").val('');
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Select Currency');                
                return;
            }            
            if (selectedText == 'ANG') {
                var Amount = $("#txtAmount").val();
                $("#txtAmountANG").val(Amount.toFixed(2));
                calculateAmount();
            }
            else if (selectedText == 'Dollar') {
                var c = String.fromCharCode(e.which);
                var c1 = this.value;                
                var conversion = c1+ '' + c;
                var Amount1 = $("#txtConversionRate").val();
                var conversionRate = conversion;
                var DollarAmount = Amount1 * conversionRate;
                $("#txtAmountANG").val(DollarAmount.toFixed(2));
                calculateAmount();
            }
        });
        $('#txtAmount').keyup(function (e) {
            var Amount = $('#txtAmount').val();
            $('#txtAmount').val(Amount);
            debugger;
            if ($('#ddlCurrency').find("option:selected").text() == 'ANG') {
                var Amount = $("#txtAmount").val();
                $("#txtAmountANG").val(Amount);
                calculateAmount();
            }
            else if ($('#ddlCurrency').find("option:selected").text() == 'Dollar') {
                //var c = String.fromCharCode(e.which);
                var c1 = this.value;
                var conversion = c1; //+ '' + c;
                var Amount1 = $("#txtConversionRate").val();
                var conversionRate = conversion;
                var DollarAmount = Amount1 * conversionRate;
                $("#txtAmountANG").val(DollarAmount.toFixed(2));
                calculateAmount();
            }
        });
        $("#ddlCurrency").change(function () {
            debugger;
             selectedText = $(this).find("option:selected").text();
            if (selectedText == "ANG") {
                var Amount = $("#txtAmount").val();
                $("#txtAmountANG").val(Amount);
                $('#AmountTaxUSD').text('AmountTax Naf');
            }
            else if (selectedText == "Dollar") {
                $('#AmountTaxUSD').text('AmountTax USD');
                if ($('#txtConversionRate').val() == "" || $('#txtConversionRate').val() == 'undefined' || $('#txtConversionRate').val() == null) {
                    toastr.options = {
                        "positionClass": "toast-bottom-right",
                    }
                    toastr.warning('Enter The Conversion Rate');
                }
                else {
                    var Amount1 = $("#txtAmount").val();
                    var conversionRate = $('#txtConversionRate').val();
                    var DollarAmount = Amount1 * conversionRate;
                    $("#txtAmountANG").val(DollarAmount.toFixed(2));
                }
            }

        })
        function GetEmailTurnOver(ID, mode) {
            debugger;
            $.ajax({
                url: "TurnOverDecelartion.aspx/GetEmailTurnOver?id=" + ID + "," + mode,
                type: "POST",
                //url: "EmployeeList.aspx/GetExportData?id=" + intStatusId,
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'EmployeeID':'" + ID +  "','Mode':'" + mode + "'}",
                //data: "{'intStatusId:'" + intStatusId + "'}",
                success: function (data) {
                    debugger;                   
                },
                error: function (data) {

                }
            })            
        }
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
        function DeleteTurnOver(DeleteID) {
            debugger;
            var type = "KeyIn";
            bootbox.dialog({
                message: "This Record Already Exists!...Are you Sure Want to Delete this Record?",
                title: "Delete Confirmation!",
                buttons: {
                    success: {
                        label: "Yes",
                        className: "btn btn-primary",
                        callback: function () {
                            DeleteTurnOverDetails(DeleteID);

                        }
                    }, danger: {
                        label: "No",
                        className: "btn-cancel",
                        callback: function () {
                        }
                    }

                }
            });

        }
        function DeleteTurnOverDetails(ID) {
            debugger;
            var TurnOver = [];
            var PaymentHistroy = [];
            var clsTurnOverDecelartion = {
                intTurnOverId: ID,
                intClientID: 0,
                intCurrencyId: 0,
                intTaxTypeId: 0,
                intYear: 0,
                strPeriod: $('#txthours').val(),
                numAmount: $('#txtgrosssalary').val(),
                numTaxRate: $('#txthourswage').val(),
                numConversionRate: $('#dateinservice').val(),
                numAmountTaxANG: $('#dateoutservice').val(),
                numAmountTaxNaf: 1,
                dateEntered: $('#dateoutservice').val()
            }
            TurnOver.push(clsTurnOverDecelartion);
            var clsPaymentHistroy = {
                intPaymentHistroyId: 0,
                intClientId: 0,
                intPackageId: 0,
                strPackageStatus: '',
                strPaymentStatus: '',
                PackageStartDate: '',
                PayRollAmount: 0,
                TurnOverAmount: 0,
                TotalAmount: 0,// TotalAmount,
                bitTrialStatus: false,
            }
            PaymentHistroy.push(clsPaymentHistroy);

            var clscommonTurnOver = {
                intTurnOverId: ID,               
                LoginId: '0',
                strMode: 'Delete',
                TurnOverDecelartion: TurnOver,
                PaymentHistroy: PaymentHistroy,
            }
            $.ajax({
                type: "POST",
                url: "TurnOverDecelartion.aspx/SaveTurnOver",
                dataType: "json",
                contentType: 'application/json; charset=utf-8',
                cache: false,
                async: false,
                data: "{objTurnOver:" + JSON.stringify(clscommonTurnOver) + "}",
                success: function (result) {
                    var CompanyId = "<%= Session["intCID"]%>";
                    if (CompanyId == 0 || CompanyId == null) {
                        window.location = "TurnOverList.aspx";
                        //GetTurnOverList();
                    }
                    else {
                        GetTurnOverCompany(CompanyId);
                    }

                    toastr.success('Deleted Successfully');
                    Clear();

                },
                error: function (result) {

                }
            })
        }
        function GetTurnOverCompany(CompanyId) {
            debugger
            $.ajax({
                type: "POST",
                url: "TurnOverList.aspx/GetTurnOverCompany?id=" + CompanyId,
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'CompanyId':'" + CompanyId + "'}",
                success: function (result) {
                    var data = result.d;
                    var DataSource = JSON.parse(data);
                    var result = DataSource.Table;
                    ActionSubGrid(result);
                }
            })
        }
        function SynchronizedTurnOverConfirmationMail(ID, clientid) {
            $.ajax({
                url: "TurnOverDecelartion.aspx/SynchronizedTurnOverConfirmationMail",
                type: "POST",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'ID':'" + ID + "','clientid':'" + clientid + "'}",
                success: function (data) {
                    debugger;
                },
                error: function (data) {

                }
            })
        }

    </script>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="PayRoll.aspx.cs" Inherits="DocumentManagementSystem.EmployeePages.PayRoll" %>

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
    <%--<link href="../assets/global/plugins/datatables_buttons_Excel/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../assets/global/plugins/datatables_buttons_Excel/buttons.dataTables.min.css" rel="stylesheet" />--%>
    <%--https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" runat="server">
    <div class="container">
        <div class="col-md-12 maincontentbg">
            <div class="space-medium">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="section-title">
                            <h2>PayRoll Details</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="menu-block">
                            <h3 class="menu-title">PayRoll Details List</h3>
                            <%--<div class="labeluser text-center" id="clientname">
                                <label class="" style="font-weight: bold;">client name : </label>
                                <label   id="ClientName"style="font-weight: bold"></label>
                            </div>--%>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <select class="form-control" id="ddlMonth" name="ddlMonth">
                                                        <option value="0">--Select Month--</option>
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
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <select class="form-control" id="ddlYear" name="ddlYear">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <select class="form-control" id="ddlCompany" name="ddlCompany">
                                                        <option value="0">--Select Company--</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <%--<div class="col-md-3 text-right">
                                                <button type="button" class="btn btn-primary btn-sm" id="btnSave">Generate PayRoll</button> id ="btnSave"
                                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="" style="position: relative; margin-top: 20px;">
                                                <div id="exportbtndiv" style="position: relative; display: none;">
                                                    <div class="text-right" style="position: absolute; right: 0px; top: -10px;">
                                                        <button type="button" class="btn btn-primary btn-sm" onclick="savePayRoll()">Generate PayRoll</button>
                                                    </div>
                                                </div>
                                                <%-- <div id="exportbtndiv" style="position: relative;">
                                                    <div class="text-right" style="position: absolute; right: 0px; top: -10px;">
                                                        <button type="button" class="btn btn-default btn-xs" id="Export" onclick="ExportData()">Export Excel</button>
                                                    </div>
                                                </div>--%>
                                                <ul id="tabs" class="nav nav-tabs navtabclrs" data-tabs="tabs">
                                                    <li class="active" id="liBatchList"><a href="#formnew1" id="SalaryList" data-toggle="tab">Active</a></li>
                                                    <li id="li_New"><a href="#formnew2" id="NotSalaryList" data-toggle="tab">Inactive</a></li>
                                                    <li id="li_Past"><a href="#formnew3" id="PastEmployeeList" data-toggle="tab">Past Employees</a></li>
                                                    <%--<li id="li_New1"><a href="#formnew2" id="test" onclick="GenerateReport()"  data-toggle="tab">Report</a></li>--%>
                                                </ul>
                                                <div class="tab-content tab_content_border">
                                                    <div class="tab-pane active" id="formnew1">
                                                        <div class="m-tb-5">
                                                            <div class="row">
                                                                <div class="col-md-12 table-responsive">

                                                                    <table class="table table-striped table-bordered table-condensed table-hover display nowrap" id="tblSalariedEmps">
                                                                        <thead>
                                                                            <tr>
                                                                                <%--<th>Employee Id</th>--%>
                                                                                <th>Employee</th>
                                                                                <th>Type</th>
                                                                                <th>Hours &nbsp &nbsp &nbsp</th>
                                                                                <th>Hourly</th>
                                                                                <th>Salary</th>
                                                                                <th>Over Time</th>
                                                                                <th>Bonus </th>
                                                                                <th>OT Hours</th>
                                                                                <th>OT Percentage</th>
                                                                                <th>OT Amount</th>
                                                                                <th>Test</th>
                                                                                <th>Description </th>
                                                                                <th></th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody id="tbodySalariedEmps">
                                                                        </tbody>
                                                                    </table>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane" id="formnew2">

                                                        <div id="Div1" class="m-tb-5">
                                                            <div class="row">
                                                                <div class="col-md-12 table-responsive">

                                                                    <table class="table table-striped table-condensed table-bordered table-hover tab_cls dataTable" id="tblNonSalariedEmps">
                                                                        <thead>
                                                                            <tr>
                                                                                <%--<th><input name="select_all" id="example-select-all" value="1" type="checkbox"/></th>--%>
                                                                                <th>Employee</th>
                                                                                <th>Type</th>
                                                                                <th>Hours</th>
                                                                                <th>Hourly</th>
                                                                                <th>Salary</th>
                                                                                <th>Over Time</th>
                                                                                <th>Bonus </th>
                                                                                <th>OT Hours</th>
                                                                                <th>OT Percentage</th>
                                                                                <th>OT Amount</th>
                                                                                <th>Bonus</th>
                                                                                <th>Description </th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody id="tbodyNonSalariedEmps">
                                                                        </tbody>
                                                                    </table>

                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="tab-pane" id="formnew3">

                                                        <div id="Div2" class="m-tb-5">
                                                            <div class="row">
                                                                <div class="col-md-12 table-responsive">

                                                                    <table class="table table-striped table-condensed table-bordered table-hover tab_cls dataTable" id="tblPastEmps">
                                                                        <thead>
                                                                            <tr>
                                                                                <%--<th><input name="select_all" id="example-select-all" value="1" type="checkbox"/></th>--%>
                                                                                <th>Employee</th>
                                                                                <th>Type</th>
                                                                                <th>Salary</th>
                                                                                <th>WorkedHours</th>
                                                                                <th>HourlyAmount</th>
                                                                                <th>Over Time</th>
                                                                                <th>Over Time Amount</th>
                                                                                <th>BonusAmount</th>
                                                                                <th>BonusDescription </th>
                                                                                <th>In Service Date</th>
                                                                                <th>Out Service Date </th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody id="tbodyPastEmps">
                                                                        </tbody>
                                                                    </table>

                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="chkmodaldiv" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
                                        <div class="modal-dialog modal-sm">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <div class="form-horizontal">
                                                                <div class="" id="divFixed">
                                                                    <div class="form-group">
                                                                        <label class="control-label col-sm-6">
                                                                            O.T Hours
                                                                        </label>
                                                                        <div class="col-sm-6">
                                                                            <%--<input type="text" class="form-control"  /> id=""---%>
                                                                            <%--<div class='input-group date' id='datetimepicker3'>--%>
                                                                            <span style="width: calc(50% - 6px); display: inline-block;">
                                                                                <input type='text' id="txtOTHours" class="form-control" maxlength="3" placeholder="HH" />
                                                                            </span>
                                                                            <span style="text-align: center; width: 12px; font-weight: bold;">:</span>
                                                                            <span style="width: calc(50% - 6px); display: inline-block;">
                                                                                <input type='text' id="txtMinutes" class="form-control" placeholder="MM" />
                                                                            </span>
                                                                            <%--<span style="font-size: 18px; font-weight: 700;>:<span><input type='text' id="txtOTMintes" class="form-control"  style="width: 50%; display: inline-block;/>--%>
                                                                            <%--<span class="input-group-addon"> onkeyup="this.value = minmax(this.value, 0, 59)"
                                                                            <span class="fa fa-clock-o"></span>
                                                                        </span>--%>
                                                                            <%--</div>--%>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label col-sm-6">
                                                                            O.T Percentage
                                                                        </label>
                                                                        <div class="col-sm-6">
                                                                            <select class="form-control" id="ddlPercentage">
                                                                                <option value="1">150%</option>
                                                                                <option value="2">200%</option>
                                                                                <option value="3">250%</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label col-sm-6">
                                                                            Hours Wage
                                                                        </label>
                                                                        <div class="col-sm-6">
                                                                            <input type="text" class="form-control" id="txtHoursWages" disabled />
                                                                            <%--onkeypress="SalaryCalculate"--%>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-sm-6">
                                                                        O.T Amount
                                                                    </label>
                                                                    <div class="col-sm-6">
                                                                        <input type="text" class="form-control" id="txtOTAmount" />
                                                                    </div>
                                                                </div>
                                                                <%--<div class="form-group">
                                                            <label class="control-label col-sm-5">
                                                                O.T Amount
                                                            </label>
                                                            <div class="col-sm-7">
                                                                <input type="text" class="form-control" id="txtSalary" />
                                                            </div>--%>
                                                            </div>
                                                        </div>
                                                        <div class="text-center">
                                                            <button class="btn btn-primary btn-sm" type="button" id="btnSave_Modal">Save</button>
                                                            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal" id="btncancel">Cancel</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="chkBonusdiv" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
                                    <div class="modal-dialog modal-sm">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="form-horizontal">
                                                            <div class="form-group">
                                                                <label class="control-label col-sm-5">
                                                                    Bonus Amount
                                                                </label>
                                                                <div class="col-sm-7">
                                                                    <input type="text" class="form-control" id="txtBonusAmount" />
                                                                </div>

                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label col-sm-5">
                                                                    Description
                                                                </label>
                                                                <div class="col-sm-7">
                                                                    <input type="text" class="form-control" id="txtDescription" />
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="text-center">
                                                            <button class="btn btn-primary btn-sm" type="button" id="btnSave_bonus">Save</button>
                                                            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
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
                </div>
            </div>
        </div>

    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="customScript" runat="server">
    <script src="../assets/global/plugins/bootstrap-datetimepickerNew/js/moment.min.js"></script>
    <script src="../assets/global/plugins/bootstrap-datetimepickerNew/js/bootstrap-datetimepicker.min.js"></script>
    <%--<script src="../assets/global/plugins/DatatableButtons/dataTables.buttons.min.js"></script>
    <script src="../assets/global/plugins/DatatableButtons/jszip.min.js"></script>
    <script src="../assets/global/plugins/DatatableButtons/vfs_fonts.js"></script>
    <script src="../assets/global/plugins/DatatableButtons/buttons.html5.min.js"></script>--%>
    <script type="text/javascript">
        var UserName = "<%= Session["userName"]%>";
        var ClientName = "<%= Session["ClientName"]%>";
        var userid = "<%= Session["userId"]%>";
        var ClientId = "<%= Session["intCID"]%>"
        var PackageName = "<%= Session["strPackageName"]%>";

        var UserType = "<%= Session["UserType"]%>";
        //GLOBAL VARIABLES AND FUNCTIONS DECLARATIONS
        var gridIndex;
        var data;
        var SelectedMonth = "";
        var SelectedYear = "";
        var PayRollId = 0;
        var Mode = '';
        var CommonId = 0;
        var OTHours = 0;
        var HoursWages = 0;
        var AddedSalary = 0;
        var year = new Date().getFullYear();
        var Hours = 0;
        var Mintues = 0;
        var MasterPaymentHistroy = 0;
        var Trialstatus = '';
        var Masterclient = 0;
        var PackageStatus = '';
        var Paymentstatus = '';
        var PackageID = 0;
        var PackageStartDate = '';
        var PayRollAmount = '';
        var TurnOverAmount = '';
        var TotalAmount = 0;
        var PaymentStatus = '';
        var bitTrialstatus = '';
        var FileName = '';
        var EmployeeCount = '';
        var PRAmount = 0;
        var TOAmount = 0;
        var InactiveMoveTable = [];
        var NonSalaridEmpsTable = [];
        var PayRoll = [];
        var clsPaymentHistroy = [];
        var intNonSalariedCountWith_Salary = 0;
        var intSalariedCountWith_Salary = 0;
        var DataSource = "";
        for (i = 2010; i <= year; i++) {
            debugger
            $('#ddlYear').append('<option value=' + i + '>' + i + '</option>');
        }

        var currentTab = 'Active';
        //PAGE LOAD.
        $(document).ready(function () {
            var currentDate = new Date();
            var CurrentMonth = currentDate.getMonth() + 1;
            $('#ddlMonth').val(CurrentMonth);
            $('#ddlYear').val(year);
            VaildatePreviousPayRoll(ClientId);
            var strMonth = $('#ddlMonth option:selected').text();
            var intMonth = $('#ddlMonth option:selected').val();
            SelectedYear = $('#ddlYear option:selected').val();
            var clientID = ClientId;
            GetEmployeeList(strMonth, SelectedYear, clientID, intMonth);
            if (ClientId == "" && userid == "") {
                alert("Session has Expired.Please Login Again.")
                window.location = '/Clientlogin.aspx';
            }
            if (PackageName == 'Tax Only' || PackageName == 'TurnOver Only') {
                window.location = "../EmployeePages/TurnOverDecelartion.aspx";
                return;
            }
            if (ClientId != 0) {
                EmailId = "<%= Session["Email"]%>";
                GetEmailBasedDropDown(EmailId);
            }
            else {
                GetDropDownClient();
            }
            GetClientDetails(ClientId);                        
            $('.nav-tabs a#SalaryList').on('shown.bs.tab', function (event) {
                debugger;

                if (UserType == 'External') {
                    VaildatePreviousPayRoll(ClientId);


                    currentTab = "Active";
                    $("#exportbtndiv").css("display", "block");

                    var strMonth = $('#ddlMonth option:selected').text();
                    var intMonth = $('#ddlMonth option:selected').val();
                    SelectedYear = $('#ddlYear option:selected').val();
                    var clientID = $('#ddlCompany').val();

                    if (NewActivityTable.data().length == 0 && tblNonActiveSalariedEmps.data().length == 0) {
                        GetEmployeeList(strMonth, SelectedYear, clientID, intMonth);
                    }
                    else
                        fnSalariedEmps(NewActivityTable.data());
                }
            });

            $('.nav-tabs a#NotSalaryList').on('shown.bs.tab', function (event) {
                debugger;
                if (UserType == 'External') {

                    currentTab = "NotActive";
                    $("#exportbtndiv").css("display", "none");
                    //VaildatePreviousPayRoll(ClientId);
                    var strMonth = $('#ddlMonth option:selected').text();
                    var intMonth = $('#ddlMonth option:selected').val();
                    SelectedYear = $('#ddlYear option:selected').val();
                    var clientID = $('#ddlCompany').val();
                    if (tblNonActiveSalariedEmps.data().length == 0 && NewActivityTable.data().length == 0)
                        GetEmployeeList(strMonth, SelectedYear, clientID, intMonth);
                    else {
                        if (NonSalaridEmpsTable.length > 0) {
                            var NotSalaryList = tblNonActiveSalariedEmps.data();
                            NotSalaryList.push(NonSalaridEmpsTable);
                            fnNonSalariedEmps(NotSalaryList[0]);
                        }
                        else {
                            fnNonSalariedEmps(tblNonActiveSalariedEmps.data());
                        }
                    }
                }
            });
            $('.nav-tabs a#PastEmployeeList').on('shown.bs.tab', function (event) {
                debugger;
                if (UserType == 'External') {
                    $("#exportbtndiv").css("display", "none");
                    if ($('#ddlCompany').val() == '0' || $('#ddlCompany').val() == null || $('#ddlCompany').val() == '--Select Company--') {
                        toastr.options = {
                            "positionClass": "toast-bottom-right",
                        }
                        toastr.warning('Please Select the Company');
                    }
                    var EmployeeId = $('#ddlCompany').val();
                    GetPastEmployee(EmployeeId);
                }
            });

            $('#tblSalariedEmps').DataTable({});
            $('#tblNonSalariedEmps').DataTable({});
            //Show the Model Popup
            $('#tblSalariedEmps').DataTable({
                responsive: {
                    details: {
                        display: $.fn.datatable.responsive.display({
                            header: function (row) {
                                var data = row.data();
                                return 'details for ' + data[0] + ' ' + data[1];
                            }
                        }),
                        renderer: $.fn.datatable.responsive.renderer.tableall()
                    }
                }
            });

            $(".chkmodal").change(function () {
                debugger;
                if ($(this).prop('checked')) {
                    $("#chkmodaldiv").modal("show");
                   
                } else {
                    $("#chkmodaldiv").modal("hide");
                }
            });
            

        });       
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
                        debugger;
                        MasterPaymentHistroy = DataSource.Table1[0].intPaymentHistroyId;
                        PackageStatus = DataSource.Table1[0].strPackageStatus;
                        PackageID = DataSource.Table1[0].intPackageId;
                        PackageStartDate = DataSource.Table1[0].PackageStartDate;
                        PayRollAmount = DataSource.Table1[0].PayrollPackageAmount1;
                        TurnOverAmount = DataSource.Table1[0].TurnOverPackageAmount1;
                        TotalAmount = DataSource.Table1[0].TotalAmount;
                        Paymentstatus = DataSource.Table1[0].strPaymentStatus;
                        bitTrialstatus = DataSource.Table1[0].bitTrialStatus;
                    }
                    else {
                        MasterPaymentHistroy = 0;
                        PackageStatus = '';
                        PackageID = DataSource.Table[0].intPackageId;
                        PackageStartDate = '';
                        PayRollAmount = DataSource.Table[0].PayrollPackageAmount1;
                        TurnOverAmount = 0;
                        TotalAmount = 0;
                        Paymentstatus = '';
                        bitTrialstatus = 0;
                    }
                }
            });
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
                        $("#ddlCompany").append($("<option></option>").val(value.ID).html(value.Name));
                    })
                    $('#ddlCompany').val(ClientId);
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
        function GetDropDownClient() {
            debugger;
            arrsearchdata = new Array(0);
            arrsearchdata[0] = new Array(0);
            arrsearchdata[0][0] = 'event';
            arrsearchdata[0][1] = 'GetDropDownClient';

            var returnData = initiateAjaxRequest(arrsearchdata, "EmpScreen.aspx");
            debugger;
            $('#ddlCompany option[value!="0"]').remove();

            $("#ddlCompany").append(returnData);
        }
        $('#ddlCompany').on("change", function () {
            InactiveMoveTable = [];
            var strMonth = $('#ddlMonth option:selected').text();
            var intMonth = $('#ddlMonth option:selected').val();
            SelectedYear = $('#ddlYear option:selected').val();
            var clientID = $('#ddlCompany').val();
            var strMonth = $('#ddlMonth option:selected').text();
            var Year = SelectedYear
            if (strMonth == 0 || strMonth == null || strMonth == '--Select Month--') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Select The Month');
            }
            else if (SelectedYear == 0 || SelectedYear == null) {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Select the Year');
            }
            else {
                GetEmployeeList(strMonth, SelectedYear, clientID, intMonth);
            }
        });
        $('#ddlMonth').on("change", function () {
            InactiveMoveTable = [];
            var strMonth = $('#ddlMonth option:selected').text();
            var intMonth = $('#ddlMonth option:selected').val();
            SelectedYear = $('#ddlYear option:selected').val();
            var clientID = $('#ddlCompany').val();
            if (clientID == 0 || clientID == null || clientID == "") {
                var clientID = "<%= Session["intCID"]%>";
            }
            if (strMonth == 0 || strMonth == null || strMonth == '--Select Month--') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Select The Month');
            }
            else if (SelectedYear == 0 || SelectedYear == null) {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Select The Year');
            }
            else {
                GetEmployeeList(strMonth, SelectedYear, clientID, intMonth);
            }
        });

        //YEAR SELECT BOX ON CHANGE EVENT.
        $('#ddlYear').on("change", function () {
            debugger;
            InactiveMoveTable = [];
            var strMonth = $('#ddlMonth option:selected').text();
            var intMonth = $('#ddlMonth option:selected').val();
            SelectedYear = $('#ddlYear option:selected').val();
            var clientID = $('#ddlCompany').val();
            if (clientID == 0 || clientID == null || clientID == "") {
                var clientID = "<%= Session["intCID"]%>";
            }
            if (strMonth == 0 || strMonth == null || strMonth == '--Select Month--') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Select The Month');
            }
            else if (SelectedYear == 0 || SelectedYear == null) {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Select The Year');
            }
            else {
                GetEmployeeList(strMonth, SelectedYear, clientID, intMonth);
            }
        });

        //FUNCTION FOR BIND VALUES IN SALARIED EMPLOYEES DATATABLE(GRID).
        function fnSalariedEmps(DataSource) {
            debugger;
            setTimeout(function () {
                $('#tblSalariedEmps').DataTable({
                    "destroy": true
                });
                NewActivityTable = $('#tblSalariedEmps').DataTable({

                    "displayLength": 5,
                    "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],                    
                    "processing": true,
                    
                    "destroy": true,
                    "rowOrder": true,
                    "sorting": [],
                    "data": DataSource,
                    "stateSave": true,
                    "columns": [                        
                        {
                            "data": "Employee", "sortable": true,
                        },
                        {
                            "data": "Type", "sortable": true,
                        },
                        {
                            "data": "intEmployeeID", "sortable": true,
                            "render": function (data, type, full, meta) {

                                if (full.Type == "Fixed")
                                    return '<input type="text" id="TestHours" class="cls_grid_Hours form-control " disabled>';//timepick
                                else
                                    return '<input type="number" id="TestHours"  class="cls_grid_Hours form-control " maxlength="3" style="width: calc(50% - 6px); display: inline-block;" ' +
                                        'oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" placeholder="HH"  value="' + full.Worked_Hours.split(':')[0] + '" >' +
                                        '<span style="font-size: 18px; font-weight: 700; width: 12px; text-align: center;"> : </span>  ' +
                                        '<input type="text" id="Testminutes"  class="cls_grid_minutes Testminutes form-control "  style="width: calc(50% - 6px); display: inline-block;" ' +
                                            'onkeyup="this.value = minmax(this.value, 0, 59)"  placeholder="MM"  value="' + full.Worked_Hours.split(':')[1] + '">';//timepick                               

                            },
                        },
                        { "data": "Hourly_Amount", "sortable": true },



                        {
                            "data": "Salary", "sortable": true,
                            "render": function (data, type, full, meta) {

                                if (full.Type == "Fixed")
                                    return '<input type="text" id="txtSalary" class="cls_grid_Salary form-control" value="' + full.Salary + '">';//timepick
                                else
                                    return '<input type="number" id="txtSalary"  class="cls_grid_Salary form-control " value="' + full.Salary + '" disabled>';//timepick

                            },
                        },
                        {
                            "data": "intEmployeeID", "sortable": true,
                            "render": function (data, type, full, meta) {
                                if (data == true) {
                                    return '<input type="checkbox" class="Empid cls_grid_check_OverTime" id=' + full.intEmployeeID + '>';
                                }
                                else {
                                    return '<input type="checkbox" class="Empid cls_grid_check_OverTime" id=' + full.intEmployeeID + ' >';
                                }
                            },
                        },
                        {
                            "data": "intEmployeeID", "sortable": true,
                            "render": function (data, type, full, meta) {
                                if (data == true) {
                                    return '<input type="checkbox" class="cls_grid_check_Bouns" id=' + full.intEmployeeID + '>';
                                }
                                else {
                                    return '<input type="checkbox" class="cls_grid_check_Bouns" id=' + full.intEmployeeID + ' >';
                                }
                            },
                        },
                        {
                            "data": "intEmployeeID", "sortable": true,
                            "render": function (data, type, full, meta) {
                                return '';
                            },
                        },
                        {
                            "data": "intEmployeeID", "sortable": true,
                            "render": function (data, type, full, meta) {
                                return '';
                            },
                        },
                        {
                            "data": "intEmployeeID", "sortable": true,
                            "render": function (data, type, full, meta) {
                                return '';
                            },
                        },
                        {
                            "data": "intEmployeeID", "sortable": true,
                            "render": function (data, type, full, meta) {
                                return '';
                            },
                        },
                        {
                            "data": "intEmployeeID", "sortable": true,
                            "render": function (data, type, full, meta) {
                                return '';
                            },
                        },
                        {
                            "data": "intEmployeeID", "sortable": false,
                            "render": function (data, type, full, meta) {
                                debugger;
                                return '<a href= "#" id=' + full.intEmployeeID + ' class=cls_Inactive  >In Active</a>';
                            }
                        },

                    ]
                });

            });
        }


        function minmax(value, min, max) {

            if (parseInt(value) > max)
                return 59;
            else return value;
        }



        //FUNCTION FOR BIND VALUES IN NON SALARIED EMPLOYEES DATATABLE(GRID).
        function fnNonSalariedEmps(DataSource) {
            debugger
            setTimeout(function () {
                $('#tblNonSalariedEmps').DataTable({
                    "destroy": true
                });
                tblNonActiveSalariedEmps = $('#tblNonSalariedEmps').DataTable({
                    "displayLength": 5,
                    "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],                  
                    "processing": true,                    
                    "destroy": true,
                    "rowOrder": true,
                    "sorting": [],
                    "data": DataSource,

                    "columns": [                        
                        {
                            "data": "Employee", "sortable": true,
                        },
                        {
                            "data": "Type", "sortable": true,
                        },
                        {
                            "data": "intEmployeeID", "sortable": true,
                            "render": function (data, type, full, meta) {

                                if (full.Type == "Fixed") {
                                    debugger;
                                    return '<input type="text" id="TestHours" class="cls_Nongrid_Hours form-control " disabled>';//timepick
                                }
                                else
                                    return '<input type="number" id="TestHours"  class="cls_Nongrid_Hours form-control " maxlength="3" style="width: calc(50% - 6px); display: inline-block;" ' +
                                        'oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" placeholder="HH"  value="' + full.Worked_Hours.split(':')[0] + '"  >' +
                                        '<span style="font-size: 18px; font-weight: 700; width: 12px; text-align: center;"> : </span>  ' +
                                        '<input type="text" id="Testminutes"  class="cls_Nongrid_minutes Testminutes form-control "  style="width: calc(50% - 6px); display: inline-block;" ' +
                                            'onkeyup="this.value = minmax(this.value, 0, 59)"  placeholder="MM"  value="' + (full.Worked_Hours.split(':')[1] == undefined ? "" : full.Worked_Hours.split(':')[1]) + '" >';//timepick                                

                            },
                        },
                        { "data": "Hourly_Amount", "sortable": true },
                        {
                            "data": "Salary", "sortable": true,
                            "render": function (data, type, full, meta) {

                                if (full.Type == "Fixed")
                                    return '<input type="text" id="txtSalary" class="cls_Nongrid_Salary form-control" value="' + full.Salary + '">';//timepick
                                else
                                    return '<input type="number" id="txtSalary"  class="cls_Nongrid_Salary form-control " value="' + full.Salary + '" disabled>';//timepick                               

                            },
                        },
                        {
                            "data": "intEmployeeID", "sortable": true,
                            "render": function (data, type, full, meta) {
                                if (data == true) {
                                    return '<input type="checkbox" class="Empid cls_Nongrid_check_OverTime" id=' + full.intEmployeeID + '>';
                                }
                                else {
                                    return '<input type="checkbox" class="Empid cls_Nongrid_check_OverTime" id=' + full.intEmployeeID + ' >';
                                }
                            },
                        },
                        {
                            "data": "intEmployeeID", "sortable": true,
                            "render": function (data, type, full, meta) {
                                if (data == true) {
                                    return '<input type="checkbox" class="cls_Nongrid_check_Bouns" id=' + full.intEmployeeID + '>';
                                }
                                else {
                                    return '<input type="checkbox" class="cls_Nongrid_check_Bouns" id=' + full.intEmployeeID + ' >';
                                }
                            },
                        },
                        {
                            "data": "intEmployeeID", "sortable": true,
                            "render": function (data, type, full, meta) {
                                return '';
                            },
                        },
                        {
                            "data": "intEmployeeID", "sortable": true,
                            "render": function (data, type, full, meta) {
                                return '';
                            },
                        },
                        {
                            "data": "intEmployeeID", "sortable": true,
                            "render": function (data, type, full, meta) {
                                return '';
                            },
                        },
                        {
                            "data": "intEmployeeID", "sortable": true,
                            "render": function (data, type, full, meta) {
                                return '';
                            },
                        },
                        {
                            "data": "intEmployeeID", "sortable": true,
                            "render": function (data, type, full, meta) {
                                return '';
                            },
                        },

                    ]
                });               
            });
        }

        //New FUNCTIONS 
        //STARTED FOR DYNAMIC DATA (FROM HERE PROCESS START).
        function GetEmployeeList(strMonth, SelectedYear, clientID, intMonth) {
            debugger;
            $.ajax({
                type: "POST",
                url: "PayRoll.aspx/GetEmployeeList",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                data: "{'Month' :'" + strMonth + "','Year':'" + SelectedYear + "','clientID':'" + clientID + "','intMonth':'" + intMonth + "'}",
                cache: false,
                async: false,
                success: function (result) {
                    debugger;
                    var returnData = JSON.parse(result.d);
                    if (NonSalaridEmpsTable.length > 0) {
                        debugger;
                        var ActiveEmployeeId = 0;
                        returnData.Table1.push(NonSalaridEmpsTable);
                        //Object.push(InactiveMoveTable);
                        fnNonSalariedEmps(returnData.Table1[0]);
                        // returnData.Table1.remove(NonSalaridEmpsTable);
                        var ActiveTable = returnData.Table;
                        for (var i = 0; i < NonSalaridEmpsTable.length; i++) {
                            var NotActiveEmployeeId = NonSalaridEmpsTable[i].intEmployeeID;

                            for (var j = 0; j < ActiveTable.length; j++) {
                                ActiveEmployeeId = ActiveTable[j].intEmployeeID;
                                if (NotActiveEmployeeId == ActiveEmployeeId) {
                                    returnData.Table.splice(j, 1);
                                }
                            }
                        }
                    }
                    else {
                        fnNonSalariedEmps(returnData.Table1);
                    }
                    fnSalariedEmps(returnData.Table);
                },
                error: function (e) {
                    debugger;
                    console.log(e);
                },
            });
        }


        //MOVE THE EMPLOYEE INACTVIE TAB.
        $('body ').on('click', 'a.cls_Inactive', function (e) {
            debugger;
            var Inactive = $(this);
            var DataSource = NewActivityTable.row($(this).closest('tr')).data();
            // DeleteInactiveEmployee(InactiveId);

            var type = "KeyIn";
            bootbox.dialog({
                message: "Are You Sure you want Move the Employee in Inactive Table?",
                title: "Confirmation!",
                buttons: {
                    success: {
                        label: "Yes",
                        className: "btn btn-primary",
                        callback: function () {
                            var SalaryType = DataSource.Type
                            if (SalaryType == "Fixed") {
                                InactiveMoveTable = {
                                    intEmployeeID: DataSource.intEmployeeID,
                                    Worked_Hours: DataSource.Worked_Hours,
                                    Type: DataSource.Type,
                                    Salary: DataSource.Salary,
                                    OvertimeAmount: DataSource.OvertimeAmount,
                                    OverTime: DataSource.OverTime,
                                    Hourly_Amount: DataSource.Hourly_Amount,
                                    Employee: DataSource.Employee,
                                    Description: DataSource.Description,
                                    BonusAmount: DataSource.BonusAmount,
                                    intPayRollId: DataSource.intPayRollId,
                                    HoursWages: DataSource.Hourly_Amount,
                                }

                            }
                            else {
                                InactiveMoveTable = {
                                    intEmployeeID: DataSource.intEmployeeID,
                                    Worked_Hours: DataSource.Worked_Hours,
                                    Type: DataSource.Type,
                                    Salary: 0,
                                    OvertimeAmount: DataSource.OvertimeAmount,
                                    OverTime: DataSource.OverTime,
                                    Hourly_Amount: DataSource.Hourly_Amount,
                                    Employee: DataSource.Employee,
                                    Description: DataSource.Description,
                                    BonusAmount: DataSource.BonusAmount,
                                    intPayRollId: DataSource.intPayRollId,
                                    HoursWages: DataSource.Hourly_Amount,
                                }
                            }
                            NonSalaridEmpsTable.push(InactiveMoveTable);                           
                            NewActivityTable.row(Inactive.parents('tr')).remove().draw(false);                            
                        }

                    }, danger: {
                        label: "No",
                        className: "btn-cancel",
                        callback: function () {
                        }
                    }
                }
            });            
        })


        //KEYUP EVENT FOR HOURS TEXTBOX TO BIND THE VALUE IN DATATABLE.
        //$('body').on('dp.change', 'input.cls_grid_Hours', function (e) {
        $('body').on('keyup', 'input.cls_Nongrid_Hours', function (e) {
            debugger
            var gridIndex = $(this).closest('tr').index();
            var Hours = $('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td:eq(2)')[0].childNodes[0].value;
            data = tblNonActiveSalariedEmps.row($(this).closest('tr')).data();
            var Minutes = $('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td:eq(2)')[0].childNodes[3].value;
            var Addminutes = (Minutes) == undefined ? 0 : parseInt(Minutes);
            var Addminutes1 = parseFloat((Addminutes / 60).toFixed(2));
            var HourlyWages = parseFloat((data.Hourly_Amount).toFixed(2));
            var salary = parseFloat((parseInt(Hours) + Addminutes1) * HourlyWages).toFixed(2);
            if (salary == NaN) {
                salary = 0;
            }
            $('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td:eq(4)').text(salary);
            data.Salary = salary;
            data.Worked_Hours = Hours + ":" + Minutes;
        });

        //KEYUP EVENT FOR HOURLY TEXTBOX TO BIND THE VALUE IN DATATABLE.
        $('body').on('keyup', 'input.cls_Nongrid_Hourly', function (e) {
            debugger;
            var gridIndex = $(this).closest('tr').index();
            var Hourly = $('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td:eq(4)')[0].childNodes[0].value;
            //var Hourly = $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(3)')[0].childNodes[0].value;
            data = tblNonActiveSalariedEmps.row($(this).closest('tr')).data();
            data.Hourly = Hourly;
        });

        //KEYUP EVENT FOR HOURLY TEXTBOX TO BIND THE VALUE IN DATATABLE.
        $('body').on('keyup', 'input.cls_Nongrid_Salary', function (e) {
            debugger;
            var gridIndex = $(this).closest('tr').index();
            var Salary = $('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td:eq(4)')[0].childNodes[0].value;
            //var Hourly = $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(3)')[0].childNodes[0].value;
            data = tblNonActiveSalariedEmps.row($(this).closest('tr')).data();
            data.Salary = Salary;
        });
        //KEYUP EVENT FOR Mintes TEXTBOX TO BIND THE VALUE IN DATATABLE.
        $('body').on('keyup', 'input.cls_Nongrid_minutes', function (e) {
            debugger;

            var gridIndex = $(this).closest('tr').index();
            var Hours = $('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td:eq(2)')[0].childNodes[0].value;
            data = tblNonActiveSalariedEmps.row($(this).closest('tr')).data();
            var Minutes = $('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td:eq(2)')[0].childNodes[3].value;
            var Addminutes = (Minutes) == undefined ? 0 : parseInt(Minutes);
            var Addminutes1 = parseFloat((Addminutes / 60).toFixed(2));
            var HourlyWages = parseFloat((data.Hourly_Amount).toFixed(2));
            var salary = parseFloat((parseInt(Hours) + Addminutes1) * HourlyWages).toFixed(2);
            if (salary == NaN) {
                salary = 0;
            }
            $('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td:eq(4)').text(salary);
            data.Salary = salary;
            data.Worked_Hours = Hours + ":" + Minutes;
        });



        //EVENT FOR SHOW POPUP WHEN CHECK THE OVERTIME CHECKBOX.
        $('body').on('click', 'input.cls_Nongrid_check_OverTime', function (e) {
            debugger;
            data = tblNonActiveSalariedEmps.row($(this).closest('tr')).data();

            gridIndex = tblNonActiveSalariedEmps.row($(this).closest('tr')).index();
            //if ($('#tbodySalariedEmps tr:eq(' + gridIndex + ') td input:checkbox')[0].checked == true) {
            if ($('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td input:checkbox').prop('checked') == true) {
                if (data.Type == 'Hourly') {
                    $("#chkmodaldiv").modal("show");
                    //$('#datetimepicker3').datetimepicker({
                    //    format: 'HH:mm',
                    //});
                    $('#divFixed').css('display', 'block');
                    $('#txtOTHours').val("");
                    $('#txtHoursWages').val(data.Hourly_Amount);
                    //$('#txtOTAmount').val("");
                    $("#txtOTAmount").attr("disabled", "disbled");
                }
                else if (data.Type == 'Fixed') {
                    $("#chkmodaldiv").modal("show");
                    //$('#datetimepicker3').datetimepicker({
                    //    format: 'HH:mm',
                    //});
                    $("#txtOTAmount").removeAttr("disabled");
                    $('#divFixed').css('display', 'none');
                }
                //}
            }
        });
        $('#btncancel').click(function (e) {
            $('#txtOTHours').val('');
            $('#txtMinutes').val('');
            $('#txtOTAmount').val('');

        });
        //CLICK EVENT FOR CALLING WHILE CLICK THE SAVE ON POPUP(OVERTIME).
        $('#btnSave_Modal').click(function (e) {
            if (currentTab == "Active") {
                if (data.Type == 'Fixed') {
                    var OTHours = data.OTHours;
                    var HoursWages = $('#txtHoursWages').val();
                    var HW = HoursWages.split('%');
                    var OTAmount = $('#txtOTAmount').val();
                    $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(7)').text(OTHours);
                    $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(8)').text(HoursWages);
                    $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(9)').text(OTAmount);
                    data.OTHours = OTHours;
                    data.OTAmount = OTAmount;
                    data.HoursWages = HW[0];
                    clear();
                }
                else {
                    debugger;
                    var HoursWages = $('#txtHoursWages').val();

                    OTHours = $('#txtOTHours').val();
                    if ($('#txtMinutes').val() == '') {
                        data.OTHours = OTHours + ':' + '00';
                    }
                    if ($('#ddlPercentage').val() == 1) {
                        var Per = '150%';
                    }
                    else if ($('#ddlPercentage').val() == 2) {
                        var Per = '200%';
                    }
                    else if ($('#ddlPercentage').val() == 3) {
                        var Per = '250%';
                    }
                    HoursWages = Per;
                    var HW = HoursWages.split('%');
                    var salary = $('#txtOTAmount').val();
                    $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(7)').text(data.OTHours);
                    $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(8)').text(HoursWages);
                    $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(9)').text(salary);
                    data.OTHours = data.OTHours;
                    data.OTAmount = salary;
                    data.HoursWages = HW[0];
                    clear();
                }
            }
            else {
                if (data.Type == 'Fixed') {
                    var OTHours = data.OTHours;
                    var HoursWages = $('#txtHoursWages').val();
                    var HW = HoursWages.split('%');
                    var OTAmount = $('#txtOTAmount').val();
                    $('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td:eq(7)').text(OTHours);
                    $('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td:eq(8)').text(HoursWages);
                    $('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td:eq(9)').text(OTAmount);
                    data.OTHours = OTHours;
                    data.OTAmount = OTAmount;
                    data.HoursWages = HW[0];
                    clear();
                }
                else {
                    debugger;
                    var HoursWages = $('#txtHoursWages').val();

                    OTHours = $('#txtOTHours').val();
                    if ($('#txtMinutes').val() == '') {
                        data.OTHours = OTHours + ':' + '00';
                    }
                    if ($('#ddlPercentage').val() == 1) {
                        var Per = '150%';
                    }
                    else if ($('#ddlPercentage').val() == 2) {
                        var Per = '200%';
                    }
                    else if ($('#ddlPercentage').val() == 3) {
                        var Per = '250%';
                    }
                    HoursWages = Per;
                    var HW = HoursWages.split('%');
                    var salary = $('#txtOTAmount').val();
                    $('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td:eq(7)').text(data.OTHours);
                    $('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td:eq(8)').text(HoursWages);
                    $('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td:eq(9)').text(salary);
                    data.OTHours = data.OTHours;
                    data.OTAmount = salary;
                    data.HoursWages = HW[0];
                    clear();
                    
                }
            }
        });
        function clear() {
            $('#txtOTHours').val("");
            $('#txtHoursWages').val("");
            $('#txtMinutes').val('');
            $('#txtOTAmount').val("");
            $("#chkmodaldiv").modal("hide");
        }

        //EVENT FOR SHOW POPUP WHEN CHECK THE BONUS CHECKBOX.
        $('body').on('click', 'input.cls_Nongrid_check_Bouns', function (e) {
            debugger;

            data = tblNonActiveSalariedEmps.row($(this).closest('tr')).data();

            gridIndex = tblNonActiveSalariedEmps.row($(this).closest('tr')).index();
            //if ($('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td input:checkbox').prop('checked') == true) {
            if ($('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td input:checkbox')[1].checked == true) {
                $('#txtBonusAmount').val("");
                $("#chkBonusdiv").modal("show");
            }
        });


        //EVENT FOR SHOW POPUP WHEN CHECK THE BONUS CHECKBOX.
        $('body').on('click', 'input.cls_grid_check_Bouns', function (e) {
            debugger;

            data = NewActivityTable.row($(this).closest('tr')).data();

            gridIndex = NewActivityTable.row($(this).closest('tr')).index();
            //if ($('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td input:checkbox').prop('checked') == true) {
            if ($('#tbodySalariedEmps tr:eq(' + gridIndex + ') td input:checkbox')[1].checked == true) {
                $('#txtBonusAmount').val("");
                $("#chkBonusdiv").modal("show");
            }
        });

        //KEYUP EVENT FOR SALARY TEXTBOX TO BIND THE VALUE IN DATATABLE.
        $('body').on('keyup', 'input.cls_grid_Salary', function (e) {
            var gridIndex = $(this).closest('tr').index();
            var Salary = $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(4)')[0].childNodes[0].value;
            //var Salary = $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(4)')[0].childNodes[0].value;
            data = NewActivityTable.row($(this).closest('tr')).data();
            data.Salary = Salary;
        });

        //CLICK EVENT FOR CALLING WHILE CLICK THE SAVE ON POPUP(BONUS).
        $('#btnSave_bonus').click(function (e) {
            debugger;
            if (currentTab == "Active") {
                var BonusAmount = $('#txtBonusAmount').val();
                $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(10)').text(BonusAmount);
                data.BonusAmount = BonusAmount;
                $('#txtBonusAmount').val('');
                var Description = $('#txtDescription').val();
                $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(11)').text(Description);
                data.Description = Description;
                $('#txtDescription').val('');
                $('#chkBonusdiv').modal('hide');
            }
            else {
                var BonusAmount = $('#txtBonusAmount').val();
                $('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td:eq(10)').text(BonusAmount);
                data.BonusAmount = BonusAmount;
                $('#txtBonusAmount').val('');
                var Description = $('#txtDescription').val();
                $('#tbodyNonSalariedEmps tr:eq(' + gridIndex + ') td:eq(11)').text(Description);
                data.Description = Description;
                $('#txtDescription').val('');
                $('#chkBonusdiv').modal('hide');
            }
            //}

        });
        function savePayRoll() {
            debugger;
         //   VaildatePreviousPayRoll(ClientId);
            GeneratePayRoll();          
        }
        function GeneratePayRoll() {
            debugger;
            var type = "KeyIn";
            //var rowcollection = NonSalaridEmpsTable.$(".cls_CheckAll:checked", { "page": "all" }); && rowcollection.length > 0
            //if (rowcollection != null ) {
            bootbox.dialog({
                message: "Are You Sure Want to Save this PayRoll Records?",
                title: "Confirmation!",
                buttons: {
                    success: {
                        label: "Yes",
                        className: "btn btn-primary",
                        callback: function () {
                            SavePayRollDetails();
                        }
                    }, danger: {
                        label: "No",
                        className: "btn-cancel",
                        callback: function () {
                        }
                    }

                }
            });
            //  }
            //else {

            //}
        }
        //CLICK EVENT FOR SAVE THE PAY ROLL DETAIL OF EMPLOYEE ON DATABASE.
        // $('#btnSave').click(function (e) {
        function SavePayRollDetails() {
            debugger;
            if (PackageName == "Trial") {
                FileName = "InvoiceTrialReport.dotx";
            }
            else if (PackageName == "PayRoll Only") {
                FileName = "InvoicePayRoll.dotx";
            }
            else if (PackageName == "PayRoll and TurnOver declaration") {
                FileName = "InvoicePayroll and Tax Reports.dotx";
            }
            else if (PackageName == "Tax Only") {
                FileName = "InvoiceTaxReport.dot";
            }
            if (PayRollId == 0 || PayRollId == null) {
                Mode = 'Add';
            }
            else {
                Mode = 'Update';
            }
            var ClientId = "<%= Session["intCID"]%>";
           var userid = "<%= Session["userId"]%>";

           if (ClientId == 0 || ClientId == null) {
               CommonId = userid;
           }
           else {
               CommonId = ClientId;
           }
           GetNonSalaryDetails();
           debugger;           
           var rowcollection = NewActivityTable.$(".Empid", { "page": "all" });           
           var MasterPayRoll = [];           
           var i = 0;

           for (var j = 0; j < rowcollection.length; j++) {
               data = NewActivityTable.row($(rowcollection[j]).closest('tr')).data();

               if ($('#ddlPercentage').val() == 1) {
                   var Percentage = 150;
               }
               else if ($('#ddlPercentage').val() == 2) {
                   var Percentage = 200;
               }
               else if ($('#ddlPercentage').val() == 3) {
                   var Percentage = 250;
               }
               data.Worked_Hours = data.Worked_Hours.replace('undefined', '00');
               if (data.Worked_Minutes != undefined)
                   data.Worked_Minutes = data.Worked_Minutes.replace('undefined', '00');

               ClsPayRoll = {
                   intPayRollId: 0,
                   intEmployeeID: data.intEmployeeID,
                   intYear: SelectedYear,
                   //strMonth: $('#ddlMonth option:selected').val(),
                   strMonth: $('#ddlMonth option:selected').text(),
                   strHour: data.Worked_Hours,//+":" + data.Worked_Minutes,// parseFloat(data.Worked_Hours) + parseFloat(((data.Worked_Minutes == undefined ? 0 : data.Worked_Minutes) / 60).toFixed(2)),
                   numSalary: data.Salary,
                   strOTHours: data.OTHours,
                   numOTAmount: data.OTAmount,
                   intclientId: CommonId,
                   numHoursWages: data.Hourly_Amount,
                   numBonusAmount: data.BonusAmount,
                   strBonusDescription: data.Description,
                   intPercentage: data.HoursWages,
               }
               PayRoll.push(ClsPayRoll);
               i++;
           }
           if (PackageStatus == 'Trial') {
               Trialstatus = true;
               Paymentstatus = null;
               EmployeeCount = intNonSalariedCountWith_Salary + i;
           }
           else {
               Trialstatus = true;
               Paymentstatus = 'Unpaid';
               PRAmount = (intNonSalariedCountWith_Salary + i) * PayRollAmount;
               EmployeeCount = intNonSalariedCountWith_Salary + i;
           }
           var PaymentHistroy = {
               intPaymentHistroyId: MasterPaymentHistroy,
               intClientId: Masterclient,
               intPackageId: PackageID,
               strPackageStatus: PackageStatus,
               strPaymentStatus: Paymentstatus,
               PackageStartDate: PackageStartDate,
               PayRollAmount: PRAmount,
               TurnOverAmount: TOAmount,
               TotalAmount: PRAmount,// TotalAmount,
               bitTrialStatus: Trialstatus,
           }
           clsPaymentHistroy.push(PaymentHistroy);
           var SalaryCount = i++;
           clsMasterPayroll = {
               intMasterPayrollId: 0,
               intClientId: ClientId,
               strMonth: $('#ddlMonth option:selected').text(),
               strYear: $('#ddlYear option:selected').val(),
               intPackageId: PackageID,
               intSalariedEmployeeCount: intNonSalariedCountWith_Salary + i,
               intPaymentHistoryId: 0,
               intCreatedBy: CommonId,
               dateCreatedDate: new Date(),
           }
           MasterPayRoll.push(clsMasterPayroll);
           //}                       

           var ClsCommonPayRoll = {
               PayRoll: PayRoll,
               PaymentHistroy: clsPaymentHistroy,
               MasterPayroll: MasterPayRoll,
               intLoginId: CommonId,
               mode: Mode,
           }
           SavePayrollCommon(ClsCommonPayRoll);

           //});
       }
        function SavePayrollCommon(ClsCommonPayRoll) {
            debugger;
           $.ajax({
               url: "PayRoll.aspx/SavePayRoll",
               type: "POST",
               datatype: "json",
               contentType: "application/json; charset=utf-8",
               cache: false,
               async: false,
               data: "{objPayRoll:" + JSON.stringify(ClsCommonPayRoll) + "}",
               success: function (data) {
                   debugger;
                   var intMonth = $('#ddlMonth option:selected').val();
                   var strMonth = $('#ddlMonth option:selected').text();
                   var clientID = "<%= Session["intCID"]%>";
                       if (clientID == null || clientID == 0 || clientID == "") {
                           var clientID = $('#ddlCompany').val();
                       }
                       else {
                           var clientID = "<%= Session["intCID"]%>";
                   }                       

                       ExportData();
                       GenerateReport(FileName, EmployeeCount, PackageName);                       
                       var splitResult1 = data.d;
                       var splitResult = splitResult1.split("&^");
                       if (splitResult.length > 1) {
                           if (splitResult[1].trim() == "Success") {
                               toastr.success('Saved Successfully');                              
                           }
                           else {
                               toastr.success('Updated Successfully');
                           }
                       }
                   }


               })
       }

       //}


        function GetNonSalaryDetails() {
            debugger
           var tblNotActiveTable = tblNonActiveSalariedEmps.data();//$('#tblNonSalariedEmps').DataTable();
           var rowcollection = tblNotActiveTable.$(".Empid", { "page": "all" });
           //rowcollection.each(function (index, elem) {

           for (var j = 0; j < rowcollection.length; j++) {
               data = tblNotActiveTable.row($(rowcollection[j]).closest('tr')).data();
               if ($('#ddlPercentage').val() == 1) {
                   var Percentage = 150;
               }
               else if ($('#ddlPercentage').val() == 2) {
                   var Percentage = 200;
               }
               else if ($('#ddlPercentage').val() == 3) {
                   var Percentage = 250;
               }
               data.Worked_Hours = data.Worked_Hours.replace('undefined', '00');            
              
               ClsPayRoll = {
                   intPayRollId: 0,
                   intEmployeeID: data.intEmployeeID,
                   intYear: SelectedYear,
                   //strMonth: $('#ddlMonth option:selected').val(),
                   strMonth: $('#ddlMonth option:selected').text(),
                   strHour: data.Worked_Hours,// + ":" + data.Worked_Minutes,// parseFloat(data.Worked_Hours) + parseFloat(((data.Worked_Minutes == undefined ? 0 : data.Worked_Minutes) / 60).toFixed(2)),
                   numSalary: data.Salary,
                   strOTHours: data.OTHours,
                   numOTAmount: data.OTAmount,
                   intclientId: CommonId,
                   numHoursWages: data.Hourly_Amount,
                
                   numBonusAmount: data.BonusAmount,
                   strBonusDescription: data.Description,
                   intPercentage: data.HoursWages,
               }
               PayRoll.push(ClsPayRoll);
               if (data.Salary > 0)
               {
                   intNonSalariedCountWith_Salary++;
               }
           }

           //})

       }
        function GetNonSalaryDetails_notUse() {
            debugger
           var tblNotActiveTable = $('#tblNonSalariedEmps').DataTable();
           var rowcollection = NonSalaridEmpsTable;
           //  rowcollection.each(function (index, elem) {

           for (var j = 0; j < rowcollection.length; j++) {
               //  data = tblNotActiveTable.row($(rowcollection[j]).closest('tr')).data();
               if ($('#ddlPercentage').val() == 1) {
                   var Percentage = 150;
               }
               else if ($('#ddlPercentage').val() == 2) {
                   var Percentage = 200;
               }
               else if ($('#ddlPercentage').val() == 3) {
                   var Percentage = 250;
               }

               ClsPayRoll = {
                   intPayRollId: 0,
                   intEmployeeID: NonSalaridEmpsTable[j].intEmployeeID,
                   intYear: $('#ddlYear option:selected').text(),
                   strMonth: $('#ddlMonth option:selected').text(),
                   strHour: NonSalaridEmpsTable[j].Worked_Hours,
                   numSalary: NonSalaridEmpsTable[j].Salary,
                   strOTHours: NonSalaridEmpsTable[j].OverTime,
                   numOTAmount: NonSalaridEmpsTable[j].OvertimeAmount,
                   intclientId: CommonId,
                   numHoursWages: NonSalaridEmpsTable[j].Hourly_Amount,
                   numBonusAmount: NonSalaridEmpsTable[j].BonusAmount,
                   strBonusDescription: NonSalaridEmpsTable[j].Description,
                   intPercentage: NonSalaridEmpsTable[j].HoursWages,
               }
               PayRoll.push(ClsPayRoll);
           }           
       }

       $('body').on('keyup', 'input.cls_grid_Hours', function (e) {
           debugger;
           var gridIndex = $(this).closest('tr').index();
           var Hours = $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(2)')[0].childNodes[0].value;
           data = NewActivityTable.row($(this).closest('tr')).data();
           var Minutes = $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(2)')[0].childNodes[3].value;
           var Addminutes = (Minutes) == undefined ? 0 : parseInt(Minutes);
           var Addminutes1 = parseFloat((Addminutes / 60).toFixed(2));
           var HourlyWages = parseFloat((data.Hourly_Amount).toFixed(2));
           var salary = parseFloat((parseInt(Hours) + Addminutes1) * HourlyWages).toFixed(2);
           if (salary == NaN) {
               salary = 0;
           }
           $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(4)').text(salary);
           data.Salary = salary;
           data.Worked_Hours = Hours + ":" + Minutes;
       });
       $('body').on('keyup', 'input.cls_grid_minutes', function (e) {
           debugger;
           //var salary = 0;    

           var gridIndex = $(this).closest('tr').index();
           var Hours = $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(2)')[0].childNodes[0].value;
           data = NewActivityTable.row($(this).closest('tr')).data();
           var Minutes = $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(2)')[0].childNodes[3].value;
           var Addminutes = (Minutes) == undefined ? 0 : parseInt(Minutes);
           var Addminutes1 = parseFloat((Addminutes / 60).toFixed(2));
           var HourlyWages = parseFloat((data.Hourly_Amount).toFixed(2));
           var salary = parseFloat((parseInt(Hours) + Addminutes1) * HourlyWages).toFixed(2);
           if (salary == NaN) {
               salary = 0;
           }
           $('#tbodySalariedEmps tr:eq(' + gridIndex + ') td:eq(4)').text(salary);
           data.Salary = salary;
           data.Worked_Hours = Hours + ":" + Minutes;
       });

       //EVENT FOR SHOW POPUP WHEN CHECK THE OVERTIME CHECKBOX.
       $('body').on('click', 'input.cls_grid_check_OverTime', function (e) {
           debugger;
           data = NewActivityTable.row($(this).closest('tr')).data();

           gridIndex = NewActivityTable.row($(this).closest('tr')).index();
           //if ($('#tbodySalariedEmps tr:eq(' + gridIndex + ') td input:checkbox')[0].checked == true) {
           if ($('#tbodySalariedEmps tr:eq(' + gridIndex + ') td input:checkbox').prop('checked') == true) {
               if (data.Type == 'Hourly') {
                   $("#chkmodaldiv").modal("show");
                   //$('#datetimepicker3').datetimepicker({
                   //    format: 'HH:mm',
                   //});
                   $('#divFixed').css('display', 'block');
                   $('#txtOTHours').val("");
                   $('#txtHoursWages').val(data.Hourly_Amount);
                   //$('#txtOTAmount').val("");
                   $("#txtOTAmount").attr("disabled", "disbled");
               }
               else if (data.Type == 'Fixed') {
                   $("#chkmodaldiv").modal("show");
                   //$('#datetimepicker3').datetimepicker({
                   //    format: 'HH:mm',
                   //});
                   $("#txtOTAmount").removeAttr("disabled");
                   $('#divFixed').css('display', 'none');
               }
               //}
           }
       });

       $('#ddlPercentage').change(function (e) {
           OTHours = $('#txtOTHours').val();
           HoursWages = $('#txtHoursWages').val();
           var minutes = $('#txtMinutes').val();
           //var Addminutes = 0 + '.' + minutes;
           var Addminutes = minutes;
           var Addminutes1 = Addminutes / 60;
           if ($('#ddlPercentage').val() == 1) {
               var percentage = 150 / 100;
           }
           else if ($('#ddlPercentage').val() == 2) {
               var percentage = 200 / 100;
           }
           else if ($('#ddlPercentage').val() == 3) {
               var percentage = 250 / 100;
           }
           // var seconds = hms * 60
           var HourlyWages = HoursWages;
           var calcualtePercentage = HourlyWages * percentage;
           var Salary = OTHours * calcualtePercentage;
           var MinutesSalary = Addminutes1 * calcualtePercentage;
           var TotalSalary = (+Salary) + (+MinutesSalary);
           //var Salary = Calculate / 60;
           $('#txtOTAmount').val(TotalSalary.toFixed(2));
           data.OTHours = OTHours + ':' + minutes;
       })
       $('#txtHoursWages').keyup(function () {
           debugger;
           OTHours = $('#txtOTHours').val();
           HoursWages = $('#txtHoursWages').val();
           var minutes = $('#txtMinutes').val();
           //var Addminutes = 0 + '.' + minutes;
           var Addminutes = minutes;
           var Addminutes1 = Addminutes / 60;
           var hms = OTHours;
           if (hms == ':') {
               var a = hms.split(':'); // split it at the colons
               // minutes are worth 60 seconds. Hours are worth 60 minutes.
               var seconds = (+a[0]) * 60 + (+a[1])
               var HourlyWages = HoursWages;
               var Calculate = seconds * HourlyWages;
               var Salary = Calculate / 60;
               $('#txtOTAmount').val(Salary.toFixed(2));
           }
           else {
               if ($('#ddlPercentage').val() == 1) {
                   var percentage = 150 / 100;
               }
               else if ($('#ddlPercentage').val() == 2) {
                   var percentage = 200 / 100;
               }
               else if ($('#ddlPercentage').val() == 3) {
                   var percentage = 250 / 100;
               }
               // var seconds = hms * 60
               var HourlyWages = HoursWages;
               var calcualtePercentage = HourlyWages * percentage;
               var Salary = OTHours * calcualtePercentage;
               var MinutesSalary = Addminutes1 * calcualtePercentage;
               var TotalSalary = (+Salary) + (+MinutesSalary);
               //var Salary = Calculate / 60;
               $('#txtOTAmount').val(TotalSalary.toFixed(2));
               data.OTHours = OTHours + ':' + minutes;
           }
       });
       $('#txtOTHours').keyup(function () {
           debugger;
           OTHours = $('#txtOTHours').val();
           HoursWages = $('#txtHoursWages').val();
           var minutes = $('#txtMinutes').val();
           //var Addminutes = 0 + '.' + minutes;
           var Addminutes = minutes;
           var Addminutes1 = Addminutes / 60;
           var hms = OTHours;
           if (hms == ':') {
               var a = hms.split(':'); // split it at the colons
               // minutes are worth 60 seconds. Hours are worth 60 minutes.
               var seconds = (+a[0]) * 60 + (+a[1])
               var HourlyWages = HoursWages;
               var Calculate = seconds * HourlyWages;
               var Salary = Calculate / 60;
               $('#txtOTAmount').val(Salary.toFixed(2));
           }
           else {
               if ($('#ddlPercentage').val() == 1) {
                   var percentage = 150 / 100;
               }
               else if ($('#ddlPercentage').val() == 2) {
                   var percentage = 200 / 100;
               }
               else if ($('#ddlPercentage').val() == 3) {
                   var percentage = 250 / 100;
               }
               // var seconds = hms * 60
               var HourlyWages = HoursWages;
               var calcualtePercentage = HourlyWages * percentage;
               var Salary = OTHours * calcualtePercentage;
               var MinutesSalary = Addminutes1 * calcualtePercentage;
               var TotalSalary = (+Salary) + (+MinutesSalary);
               //var Salary = Calculate / 60;
               $('#txtOTAmount').val(TotalSalary.toFixed(2));
               data.OTHours = OTHours + ':' + minutes;
           }
       });
       $('#txtMinutes').keyup(function () {
           debugger;
           OTHours = $('#txtOTHours').val();
           HoursWages = $('#txtHoursWages').val();
           var minutes = $('#txtMinutes').val();;
           //var Addminutes = 0 + '.' + minutes;
           var Addminutes = minutes;
           var Addminutes1 = Addminutes / 60;
           var hms = OTHours;
           if (hms == ':') {
               var a = hms.split(':'); // split it at the colons
               // minutes are worth 60 seconds. Hours are worth 60 minutes.
               var seconds = (+a[0]) * 60 + (+a[1])
               var HourlyWages = HoursWages;
               var Calculate = seconds * HourlyWages;
               var Salary = Calculate / 60;
               $('#txtOTAmount').val(Salary.toFixed(2));
           }
           else {
               if ($('#ddlPercentage').val() == 1) {
                   var percentage = 150 / 100;
               }
               else if ($('#ddlPercentage').val() == 2) {
                   var percentage = 200 / 100;
               }
               else if ($('#ddlPercentage').val() == 3) {
                   var percentage = 250 / 100;
               }
               // var seconds = hms * 60
               var HourlyWages = HoursWages;
               var calcualtePercentage = HourlyWages * percentage;
               var Salary = OTHours * calcualtePercentage;
               var MinutesSalary = Addminutes1 * calcualtePercentage;
               var TotalSalary = (+Salary) + (+MinutesSalary);
               //var Salary = Calculate / 60;
               $('#txtOTAmount').val(TotalSalary.toFixed(2));
               data.OTHours = OTHours + ':' + minutes;
           }
       });

       function ExportData() {
           debugger;
           var clientid = "<%= Session["intCID"]%>";
                var userid = "<%= Session["userId"]%>";
                debugger;
                if ($('#ddlMonth option:selected').text() == 0 || $('#ddlMonth option:selected').text() == null || $('#ddlMonth option:selected').text() == '--Select Month--') {
                    //if ($('#ddlMonth option:selected').val() == 0 || $('#ddlMonth option:selected').val() == null ) {
                    toastr.options = {
                        "positionClass": "toast-bottom-right",
                    }
                    toastr.warning('Please Select Month');
                }
                else if ($('#ddlYear').val() == '' || $('#ddlYear').val() == null) {
                    toastr.options = {
                        "positionClass": "toast-bottom-right",
                    }
                    toastr.warning('Please Select Year');
                }
                else if (userid == 0 || userid == null || userid == "") {
                    var year = $('#ddlYear').val();
                    //var month = $('#ddlMonth').val();
                    var month = $('#ddlMonth option:selected').text();
                    var clientid = "<%= Session["intCID"]%>";
               var intMonth = $('#ddlMonth option:selected').val();
           }
           else {
               var year = $('#ddlYear').val();
               //var month = $('#ddlMonth').val();
               var month = $('#ddlMonth option:selected').text();
               var clientid = $('#ddlCompany').val();
               var intMonth = $('#ddlMonth option:selected').val();
           }
    $.ajax({
        type: "POST",
        url: "PayRoll.aspx/GetExportData?id=" + year + "," + month + "," + clientid,
        datatype: "json",
        contentType: "application/json; charset=utf-8",
        data: "{'year' :'" + year + "','month':'" + month + "','clientId':'" + clientid + "','intMonth':'" + intMonth + "'}",
        cache: false,
        async: false,
        success: function (result) {
            debugger;
            var Payroll = result.d;
            if (result.d == "Success") {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.success('we justsent you an email with your bill for this period' + (month) + " " + (year));
                //alert('');
            }
            else {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Select the Employee and Enter the Salary');
            }
        },
        error: function (result) {
            var Payroll = result.d;
        }

    });
}



function GetsalaryEmployeeList(strMonth, SelectedYear, clientID, intMonth) {
    debugger;
    $.ajax({
        type: "POST",
        url: "PayRoll.aspx/GetEmployeeList",
        datatype: "json",
        contentType: "application/json; charset=utf-8",
        data: "{'Month' :'" + strMonth + "','Year':'" + SelectedYear + "','clientID':'" + clientID + "','intMonth':'" + intMonth + "'}",
        cache: false,
        async: false,
        success: function (result) {
            debugger;
            var returnData = JSON.parse(result.d);
            debugger;

            //fnSalariedEmps(returnData.Table);           
        },
        error: function (e) {
            debugger;
            console.log(e);
        },
    });
}

if (ClientName == 0 || ClientName == null) {
    $('.labeluser').css('display', 'none');
    $('#Companylable').show();
    $('#ddlCompany').show();
    $('#ClientName').hide();
    $('#btnSave').hide();
}
else {
    $('.labeluser').css('display', 'block');
    $('#Companylable').hide();    
    $('#ClientName').text(ClientName);    
    $('#ClientName').show();
    $('#btnSave').show();
}
function GenerateReport(FileName, EmployeeCount, PackageName) {
    debugger;
    var clientid = "<%= Session["intCID"]%>";

            $.ajax({
                url: "PayRoll.aspx/InvoiceReport",//?id=" + "clientid=" + clientid + "," + "FileName=" + FileName,
                type: "POST",
                datatype: "json",
                async: false,
                contentType: "application/json; charset=utf-8",
                data: "{'clientid' :'" + clientid + "','FileName':'" + FileName + "','Count':'" + EmployeeCount + "','PackageName':'" + PackageName + "'}",
                cache: false,
                success: function (data) {
                },
                error: function (data) {
                    debugger;
                    console.log(data);
                },
            })
        }


        function VaildatePreviousPayRoll(ClientId) {
            debugger;

            $.ajax({
                type: "POST",
                url: "PayRoll.aspx/VaildatePreviousPayRoll",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'ClientId':'" + ClientId + "'}",
                success: function (result) {
                    var data = result.d;
                    var DataSource = JSON.parse(data);
                    var result = DataSource.Table;
                    var result1 = DataSource.Table2[0].Column1;
                    var Message = result1.split('&^*');
                    if (Message[1].trim() == 'Question') {
                        ContinueQuestion();
                    }
                    else if (Message[1].trim() == 'Warning') {
                        toastr.options = {
                            "positionClass": "toast-bottom-right",
                        }
                        toastr.warning('Please pay the previous package');
                        Disablevalues();
                        return;
                    }
                    else if (Message[1].trim() == 'Warning1') {
                        Disablevalues();
                        toastr.options = {
                            "positionClass": "toast-bottom-right",
                        }
                        toastr.warning('Please Choose the Package');
                    }
                    else if (Message[1].trim() == 'Success') {
                        Enablevalues();
                    }
                }
            });
        }
        function Disablevalues() {
            $("#exportbtndiv").css("display", "none");
            $('#ddlMonth').attr('disabled', 'disaled');
            $('#ddlYear').attr('disabled', 'disaled');
            $('#ddlCompany').attr('disabled', 'disaled');
        }
        function Enablevalues() {
            $("#exportbtndiv").css("display", "block");
            $('#ddlMonth').removeAttr('disabled');
            $('#ddlYear').removeAttr('disabled');
            $('#ddlCompany').removeAttr('disabled');
        }

        function ContinueQuestion() {
            debugger;
            var type = "KeyIn";
            bootbox.dialog({
                message: "Do you want to continue with previous package" + "(" + PackageName + ")" + "?",
                title: "Confirmation!",
                buttons: {
                    success: {
                        label: "Yes",
                        className: "btn btn-primary",
                        callback: function () {
                            Enablevalues();
                            // InsertPayment_History();
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


        function DeleteInactiveEmployee(InactiveId) {
            debugger;
            var type = "KeyIn";
            bootbox.dialog({
                message: "Are You Sure you want Move the Employee in Inactive Table?",
                title: "Confirmation!",
                buttons: {
                    success: {
                        label: "Yes",
                        className: "btn btn-primary",
                        callback: function () {
                            clearActiveTable();
                            // DeleteActiveEmployees(InactiveId);
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


        function InsertPayment_History() {
            debugger;
            var InsertPaymentHistory = [];
            var clsPaymentHistroy = {
                intPaymentHistroyId: 0,
                intClientId: Masterclient,
                intPackageId: PackageID,
                strPackageStatus: PackageStatus,
                strPaymentStatus: null,
                PackageStartDate: PackageStartDate,
                PayRollAmount: PRAmount,
                TurnOverAmount: TOAmount,
                TotalAmount: PRAmount,// TotalAmount,
                bitTrialStatus: true,
            }
            InsertPaymentHistory.push(clsPaymentHistroy);
            $.ajax({
                url: "PayRoll.aspx/PaymentHistroy",
                type: "POST",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{objPaymentHistroy:" + JSON.stringify(InsertPaymentHistory) + "}",
                success: function (data) {
                }
            })
        }

        function DeleteActiveEmployees(InactiveId) {
            $.ajax({
                url: "PayRoll.aspx/DeleteActiveEmployee",
                type: "POST",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'InactiveId':'" + InactiveId + "'}",
                success: function (data) {
                    var result = data.d;
                    var DataSource = JSON.parse(result);
                    var result1 = DataSource.Table;
                    if (result1[0].Column1 == 'Deleted Success') {

                    }
                }
            })
        }
        function GetPastEmployee(EmployeeId) {
            $.ajax({
                url: "PayRoll.aspx/GetPastEmployee",
                type: "POST",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'EmployeeId':'" + EmployeeId + "'}",
                success: function (data) {
                    var result = data.d;
                    var DataSource = JSON.parse(result);
                    var DataTable = DataSource.Table;
                    fnPastEmployee(DataTable);
                }
            })
        }


        function fnPastEmployee(DataTable) {
            debugger;
            setTimeout(function () {
                $('#tblPastEmps').DataTable({
                    "destroy": true
                });

                PastEmployeeTable = $('#tblPastEmps').DataTable({
                    language: {
                        searchPlaceholder: "Search records"
                    },
                    processing: true,
                    //"Paginate": false,
                    displayLength: 5,
                    lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                    destroy: true,
                    rowOrder: true,
                    sorting: [],
                    data: DataTable,

                    columns: [
                        {
                            "data": "Employee", "sortable": true,
                        },
                        { "data": "Type", "sortable": true },

                        { "data": "salary", "sortable": true },
                         { "data": "Worked_Hours", "sortable": true },
                         { "data": "Hourly_Amount", "sortable": true },
                        { "data": "OverTime", "sortable": true },
                        { "data": "OvertimeAmount", "sortable": true },
                        { "data": "BonusAmount", "sortable": true },
                          { "data": "BonusDescription", "sortable": true },
                          { "data": "InServiceDate", "sortable": true },
                          { "data": "OutServiceDate", "sortable": true },                                                  
                    ]
                });
            });
        }

    </script>
</asp:Content>

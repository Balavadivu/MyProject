<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="TurnOverList.aspx.cs" Inherits="DocumentManagementSystem.EmployeePages.TurnOverList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" runat="server">
    <div class="container">
        <div class="col-md-12 maincontentbg">
            <div class="space-medium">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="section-title">
                            <h2>Turn Over Details</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="menu-block">
                            <h3 class="menu-title">Turn Over List</h3>
                             <%--<div class="labeluser text-center">
                                            <label class="" style="font-weight: bold;">Client Name : </label>
                                            <label id="ClientName" style="font-weight: bold; display: none;"></label> 
                                             </div> --%>    
                            <div class="row">
                            <div class="col-md-12">
                            <div class="row">                               
                                        <div class="col-md-3">
                                            <select class="form-control" id="ddlCompany" name="ddlCompany">
                                                <option value="0">--Select Company--</option>
                                            </select>
                                        </div>
                                     
                                <div class="col-md-offset-6 col-md-3 text-right">
                                    <a class="btn-link" href="#" onclick="CreateTurnOver()" id="Newemployee"><i class="fa fa-plus"></i>Create New Turn Over </a>
                                </div>
                            </div>  
                                <div class="row clearfix">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-condensed table-hover" id="tblTurnOverList">
                                                <thead>
                                                    <tr>
                                                        <th>Company Name</th>
                                                        <th>Currency</th>
                                                        <th>Tax Name</th>
                                                        <th>Year</th>
                                                        <th>Period</th>
                                                        <th>AmountANG</th>
                                                        <th>AmountNaf</th>
                                                        <th>DataEntered</th>
                                                        <th class="text-center">Edit</th>
                                                        <th class="text-center">Delete</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tblTurnOverData"></tbody>
                                            </table>
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
    <script>
        var UserName = "<%= Session["userName"]%>";
        var ClientName = "<%= Session["ClientName"]%>";
        var userid = "<%= Session["userId"]%>";
        var ClientId = "<%= Session["intCID"]%>";
        var EmailId = "<%= Session["Email"]%>";
        var PackageName = "<%= Session["strPackageName"]%>";
        var UserType = $.cookie("UserType");
        $(document).ready(function () {
            debugger;
            if (ClientId == "" && userid == "") {
                alert("session has expired.please login again.")
                window.location = '/ClientLogin.aspx';
            }
            if (PackageName == 'PayRoll Only') {
                window.location = "../EmployeePages/PayRoll.aspx";
                return;
            }
            if (ClientId != 0)
            {
                EmailId = "<%= Session["Email"]%>";
                GetEmailBasedDropDown(EmailId);
            }
            else {
                GetDropDownClient();
            }                       
            if (UserName == 0 || UserName == null) {
                GetTurnOverCompany(CompanyId);
            }
            else {
                GetTurnOverList();
            }            
        });
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
        function CreateTurnOver() {
            window.location = "TurnOverDecelartion.aspx";
        }
        function GetDropDownClient() {
            debugger;
            arrSearchData = new Array(0);
            arrSearchData[0] = new Array(0);
            arrSearchData[0][0] = 'event';
            arrSearchData[0][1] = 'GetDropDownClient';

            var returnData = initiateAjaxRequest(arrSearchData, "EmpScreen.aspx");
            debugger;
            $('#ddlCompany option[value!="0"]').remove();

            $("#ddlCompany").append(returnData);
        }
        function GetTurnOverList() {
            debugger;
            arrSearchData = new Array(0);
            arrSearchData[0] = new Array(0);
            arrSearchData[0][0] = 'event';
            arrSearchData[0][1] = 'GetTurnOverList';            
            var returnData = initiateAjaxRequest(arrSearchData, "TurnOverList.aspx");
            var result = JSON.parse(returnData);
            ActionSubGrid(result);
        }
        //Function for bind data in datatable.
        function ActionSubGrid(DataSource) {            
            setTimeout(function () {
                $('#tblTurnOverList').dataTable({
                    "destroy": true
                });

                EmployeeTable = $('#tblTurnOverList').DataTable({
                    language: {
                        searchPlaceholder: "Search records"
                    },
                    "destroy": true,
                    "sorting": [],
                    "dateSort": 4,
                    "visible": false,
                    "columnDefs": [

                    ],
                    "data": DataSource,
                    "columns": [

                     //   { "mDataProp": "RowNumber", "bSortable": true, "visible": false },                             
                        { "data": "vchClientName", "sortable": true },
                        { "data": "strCurrency", "sortable": true },
                        { "data": "vchTaxName", "sortable": true },
                        { "data": "intYear", "sortable": true },
                        { "data": "strPeriod", "sortable": true },
                        { "data": "numAmountTaxANG", "sortable": true },
                        { "data": "numAmountTaxNaf", "sortable": true },
                        { "data": "dateEntered", "sortable": true },                       
                        {
                            "data": "ID", "sortable": false,
                            "render": function (data, type, full, meta) {
                                return '<a href="#" class="btn btn-warning btn-sm" style="cursor:pointer" onclick="EditTurnOver(' + full.ID + ')"><i class="fa fa-pencil"></i></a>';
                            }
                        },
                        {
                            "data": "ID", "sortable": false,
                            "render": function (data, type, full, meta) {
                                return '<a href="#" class="btn btn-danger btn-sm" style="cursor:pointer"  onclick="DeleteTurnOver(' + full.ID + ')"><i class="fa fa-trash-o"></i></a>';
                            }
                        },
                    ]

                });

            }, 200);
        }

        function EditTurnOver(ID) {
            debugger;            
            window.location = "../EmployeePages/TurnOverDecelartion.aspx?id=" + encodeURIComponent(ID);            
        }
        function DeleteTurnOver(ID) {
            debugger;
            var type = "KeyIn";
            bootbox.dialog({
                message: "Are You Sure Want to Delete this Record?",
                title: "Delete Confirmation!",
                buttons: {
                    success: {
                        label: "Yes",
                        className: "btn btn-primary",
                        callback: function () {
                            DeleteTurnOverDetails(ID);
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
                        GetTurnOverList();
                    }
                    else {
                        GetTurnOverCompany(CompanyId);
                    }

                    toastr.success('Deleted Successfully');

                },
                error: function (result) {

                }
            })
            }

        if (ClientName == 0 || ClientName == null) {
            $('.labeluser').css('display', 'none');
                $('#Companylable').show();
                $('#ddlCompany').show();
                $('#ClientName').hide();
            }
            else {
            $('.labeluser').css('display', 'block');
                $('#Companylable').hide();              
                $('#ClientName').text(ClientName);
                var CompanyId = ClientId;
                GetTurnOverCompany(CompanyId);
                $('#ClientName').show();
            }
            $("#ddlCompany").change(function () {
                debugger;
                var end = this.value;
                var CompanyId = $('#ddlCompany').val();
                GetTurnOverCompany(CompanyId);
            });

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
    </script>
</asp:Content>

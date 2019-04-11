<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="DocumentManagementSystem.EmployeePages.Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" runat="server">

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
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="menu-block">
                            <h3 class="menu-title">Employee List</h3>
                           
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <select class="form-control" id="ddlStatus" name="ddlStatus">
                                                <option value="0">--Select Status--</option>
                                             
                                            </select>
                                        </div>
                                        <div class="col-md-2">
                                            <select class="form-control" id="ddlCompany" name="ddlCompany">
                                                <option value="0">--Select Company--</option>
                                            </select>
                                        </div>
                                        <div class="col-md-offset-5 col-md-3">
                                            <div class="text-right">
                                               <%-- <a class="btn-link" href="javascript:;" onclick="CreateEmployee()" id="Newemployee"><i class="fa fa-plus"></i>Create New Employee </a>--%>
                                                 <a class="btn-link" href= "javascript:;" onclick="CreateEmployee()">Create New Employee </a>
                                                </div>
                                        </div>
                                    </div>

                                  

                                    <div class="row clearfix">
                                        <div class="col-md-12">
                                            <div class="table-responsive" id="divExternalEmployeeList">
                                                <table class="table table-striped table-bordered table-condensed table-hover" id="tblExternalEmployeeList">
                                                    <thead>
                                                        <tr>
                                                            <th>First Name</th>
                                                            <th>Last Name</th>
                                                            <th>Salary Type</th>
                                                         
                                                            <th class="text-center">Edit</th>
                                                            <th class="text-center">Delete</th>
                                                        </tr>
                                                    </thead>
                                                   
                                                    <tbody id="tblExternalEmployeeData"></tbody>
                                                </table>
                                                  </div>
                                            <div class="table-responsive" id="divInternalEmployeeList">
                                                 <table class="table table-striped table-bordered table-condensed table-hover" id="tblInternalEmployeeList">
                                                    <thead>
                                                        <tr>
                                                            <th>First Name</th>
                                                            <th>Last Name</th>
                                                            <th>Salary Type</th>
                                                         
                                                            <th class="text-center">Edit</th>
                                                           
                                                        </tr>
                                                    </thead>
                                                   
                                                    <tbody id="tblInternalEmployeeData"></tbody>
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
        var moduleName = '';
        var UserName = "<%= Session["userName"]%>";
        var ClientName = "<%= Session["ClientName"]%>";
        var userid = "<%= Session["userId"]%>";
        var ClientId = "<%= Session["intCID"]%>";
       var PackageName = "<%= Session["strPackageName"]%>";        
        //var UserType = $.cookie("UserType");
   
    var UserType = "<%= Session["UserType"]%>";
        $(document).ready(function () {
            debugger;
            
            if (UserType == 'External')
            {
                $("#divExternalEmployeeList").show();
                $("#divInternalEmployeeList").hide();
            }
            else if (UserType == 'Internal')
            {
                $("#divExternalEmployeeList").hide();
                $("#divInternalEmployeeList").show();
            }

                        if (PackageName == 'Tax Only' || PackageName == 'TurnOver Only')
            {                
                window.location = "../EmployeePages/TurnOverDecelartion.aspx";
                return;
            }  
           if (ClientId == "" && userid == "") {
                alert("Session has Expired.Please Login Again.")
                window.location = '/ClientLogin.aspx';
            }     
            if (ClientId != 0) {
                EmailId = "<%= Session["Email"]%>";
                GetEmailBasedDropDown(ClientId);
            }
                

            else {
                GetDropDownClient();
            }
            GetstatusValues();           
            GetWagePeriod();
            GetDate();
            if (ClientName == 0 || ClientName == null && ClientName == "") {               
                $('#Newemployee').attr("disabled", "disabled");            
            }
            else {
                $('#Newemployee').removeAttr("disabled", "disabled");               
            }
            if (UserName == 0 || UserName == null) {
                GetCompanyList(CompanyId);
            }
            else {
                GetEmployeeList();
            }
        });
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

                        $("#ddlCompany").append($("<option></option>").val(value.ID).html(value.Name));
                    })
                    $('#ddlCompany').val(ClientId);
                }
            })
        }

        function CreateEmployee() {
            debugger;
            var clientid = $('#ddlCompany').val();
            $.ajax({
                type: "POST",
                url: "Employee.aspx/ValidateTrialEmployee",
                dataType: "json",
                contentType: 'application/json; charset=utf-8',
                cache: false,
                async: false,
                data: "{clientid:" + clientid + "}",
                success: function (data) { 
                    if (data.d != '') {
                        alert('Only Two Employees Allowed. Please Check your Package!!!');
                    }
                    else {
                        window.location = "../EmployeePages/EmpScreen.aspx";
                    }
                },
                error: function (data) {
                    alert(data);
                }
            });
        }

        function initiateAjaxRequest(arrSearchData, url) {
            var _strreturn = null;
            parameters = '';
            if (arrSearchData.length > 0) {
                for (i = 0; i < arrSearchData.length; i++) {
                    if (parameters == '')
                        parameters = parameters + arrSearchData[i][0] + '=' + escape(arrSearchData[i][1]);
                    else
                        parameters = parameters + '&' + arrSearchData[i][0] + '=' + escape(arrSearchData[i][1]);
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
        function GetDate() {
            debugger;
            var date = new Date();
            var currentMonth = date.getMonth();
            var currentDate = date.getDate();
            var currentYear = date.getFullYear();

            $('.date-picker1').datepicker({
                //startDate: "01-01-1990",
                endDate: "31-12-2010",
                format: "mm-dd-yyyy",
               
            });
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
        function GetstatusValues() {
            debugger;
            arrSearchData = new Array(0);
            arrSearchData[0] = new Array(0);
            arrSearchData[0][0] = 'event';
            arrSearchData[0][1] = 'GetStatus';

            var returnData = initiateAjaxRequest(arrSearchData, "Employee.aspx");
            debugger;
            $('#ddlStatus option[value!="0"]').remove();

            $("#ddlStatus").append(returnData);
        }
        
        //Function for bind data in datatable.
        function ActionSubGrid(DataSource) {

            //  Datatable binding for Persons
            setTimeout(function () {
                $('#tblExternalEmployeeList').DataTable({
                    "retrieve": true,
                    "paging": false,
                    "searching": false,
                    "destroy": true
                });

                if (UserType == 'External')
                {

                    EmployeeTable = $('#tblExternalEmployeeList').DataTable({
                    language: {
                        search: "Search",
                        searchPlaceholder: "Search records"
                    },
                    "destroy": true,
                    "sorting": [],
                    //"columnDefs": [
                    //],   
                    "data": DataSource,
                    "columns": [
           
                        { "data": "FirstName", "target": 0 },
                        { "data": "LastName", "target": 1 },
                        { "data": "SalaryType", "target": 2 },
                        {
                            "data": "ID", "target": 3,
                            "render": function (data, type, full, meta) {
                                return '<a href="#" class="btn btn-warning btn-sm" style="cursor:pointer"  onclick="EditEmployee(' + full.intClientId + ',' + full.ID + ')" > <i class="fa fa-pencil"></i></a>';
                            }
                        },
                        {
                            "data": "ID", "target": 3,
                            "render": function (data, type, full, meta) {
                                return '<a href="#" class="btn btn-danger btn-sm" style="cursor:pointer"  onclick="DeleteEmployee(' + full.ID + ',' + full.EmailSent + ')"><i class="fa fa-trash-o"></i></a>';
                            }
                        },
                    ]

                });
                }

                //To hide delete Icon
                if (UserType == 'Internal') {
                    EmployeeTable = $('#tblInternalEmployeeList').DataTable({
                        language: {
                            search: "Search",
                            searchPlaceholder: "Search records"
                        },
                        "destroy": true,
                        "sorting": [],
                        //"columnDefs": [
                        //],   
                        "data": DataSource,
                        "columns": [

                            { "data": "FirstName", "target": 0 },
                            { "data": "LastName", "target": 1 },
                            { "data": "SalaryType", "target": 2 },
                            {
                                "data": "ID", "target": 3,
                                "render": function (data, type, full, meta) {
                                    return '<a href="#" class="btn btn-warning btn-sm" style="cursor:pointer"  onclick="EditEmployee(' + full.intClientId + ',' + full.ID + ')" > <i class="fa fa-pencil"></i></a>';
                                }
                            },
                            
                           
                        ]

                    });
                }


            }, 200);
        }






        function GetEmployeeList() {
            debugger;
            arrSearchData = new Array(0);
            arrSearchData[0] = new Array(0);
            arrSearchData[0][0] = 'event';
            arrSearchData[0][1] = 'GetEmployeeList';
            arrSearchData[1] = new Array(0);
            arrSearchData[1][0] = 'FirstName';
            arrSearchData[1][1] = $('#txtClientName');
            arrSearchData[2] = new Array(0);
            arrSearchData[2][0] = 'LastName';
            arrSearchData[2][2] = $('#txtClientName');
            var returnData = initiateAjaxRequest(arrSearchData, "Employee.aspx");
            var result = JSON.parse(returnData);
            ActionSubGrid(result);


        }
        //function CreateEmployee() {
        //    window.location = "EmpScreen.aspx";
        //}
        function DeleteEmployee(ID) {
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
                            DeleteEmployeeDetails(ID);
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
        function EditEmployee(intClientId, ID) {
            debugger;           
            window.location = "../EmployeePages/EmpScreen.aspx?id=" + encodeURIComponent(intClientId) + "," + encodeURIComponent(ID);         
        }
        function DeleteEmployeeDetails(ID) {
            debugger;
            var WageDataArray = [];
            var AddtionalWagesArray = [];
            var clsEmployeeWages = {
                intEmployeeWageId: 0,
                intEmployeeID: ID,
                bitIsFixed: $('input[name=Salary]:checked').val() == 1 ? 1 : $('input[name=Salary]:checked').val() == undefined ? null : 0,//$('input:radio[name=Salary]:checked').val(),
                strJobDescription: $('#txtjob').val(),
                strDaysPerWeek: $('#txtdays').val(),
                strHoursWorked: $('#txthours').val(),
                numGrossSalaryANG: $('#txtGrosssalary').val(),
                numHourlyWagANG: $('#txthoursWage').val(),
                dateInServiceDate: $('#dateinservice').val(),
                dateOutServiceDate: $('#dateoutservice').val(),
                intWagePeriodId: 1,
                strLastYearGrossWagesFor: $('#LastyearWage').val()
            }
            WageDataArray.push(clsEmployeeWages);
            var clsAddtionalWages = {
                intAdditionalWageId: 0,
                intEmployeeID: ID,
                strPeriodMortageDeductionStarted: $('#txtPeriodmortgoge').val(),
                bitAOV: $('#chkAov').is(":checked"),
                bitZV: $('#chkZV').is(":checked"),//$('#chkMarried').is(":checked")
                bitOldAgeAllownace: $('#chkoldage').is(":checked"),
                bitSoleEarner: $('#chksole').is(":checked"),
                bitPayInUS: $('#chkpay').is(":checked")
            }
            AddtionalWagesArray.push(clsAddtionalWages);
            var clsEmployeeScreen = {
                intEmployeeID: ID,
                strEmployeeFirstName: '',
                strEmployeLastName: '',
                // intClientId: '0',
                intClientId: ClientId,
                strGender: '\0',
                IsMarried: false,
                intPlaceOfBirthId: '0',
                strIDNumber: '',
                strEmpl_Id: '',
                strNationality: '',
                strAddress: '',
                strPhone: '',
                strPlaceOfBirth: '10 / 10 / 1999',
                intCreatedBy: '0',
                intStatusId: '0',            
                mode: 'Delete',
                EmployeeWages: WageDataArray,
                AddtionalWages: AddtionalWagesArray,
              UserType:UserType,
            }
            $.ajax({
                type: "POST",
                url: "EmpScreen.aspx/SaveEmployee",
                dataType: "json",
                contentType: 'application/json; charset=utf-8',
                cache: false,
                async: false,
                data: "{objEmployee:" + JSON.stringify(clsEmployeeScreen) + "}",
                success: function (result) {
                    debugger;

                    if (result.d == "Deleted Successfully^&*Success") {
                        toastr.success('Deleted Successfully');
                    }
                    else if (result.d.includes("547 _ The DELETE statement conflicted with the REFERENCE constraint")) {
                        toastr.warning('Employee  is Not Delete.Employee Reference in Family.')
                    }


                    var CompanyId = "<%= Session["intCID"]%>";
                    if (CompanyId == 0 || CompanyId == null) {
                        GetEmployeeList();
                    }
                    else {
                        GetCompanyList(CompanyId);
                    }                    
               
                },
                error: function (result) {

                }
            })
            }

            $("#ddlStatus").change(function () {
                debugger;
                var end = this.value;
                var StatusId = $('#ddlStatus').val();
                var ClientId = "<%= Session["intCID"]%>";
                if(ClientId==0||ClientId==null)
                {                    
                    if ($('#ddlCompany').val() == 0 || $('#ddlCompany').val() == null || $('#ddlCompany').val() == 'undefined') {
                        toastr.warning('Please Select Company');
                    }
                }
                var Company = $('#ddlCompany').val();
                    
                if (Company != 0) {
                    GetStatusBasedClientList(StatusId, Company);
                         
                     }
                     else {
                    GetStatusBasedClientList(StatusId, ClientId);
                     }
                 });      

        function GetStatusBasedClientList(StatusId, Company) {
            debugger
            $.ajax({
                type: "POST",
                url: "Employee.aspx/GetStatusBasedClientList?id=" + StatusId + "," + Company,
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'StatusId':'" + StatusId + "','ClientId':'" + Company + "'}",
                success: function (result) {
                    var data = result.d;
                    var DataSource = JSON.parse(data);
                    var result = DataSource.Table;
                    ActionSubGrid(result);
                }

            })
        }

                 function GetStatusBasedClientList(StatusId, ClientId) {
                     debugger
                     $.ajax({
                         type: "POST",
                         url: "Employee.aspx/GetStatusBasedClientList?id=" + StatusId + "," + ClientId,
                         datatype: "json",
                         contentType: "application/json; charset=utf-8",
                         cache: false,
                         async: false,
                         data: "{'StatusId':'" + StatusId + "','ClientId':'" + ClientId + "'}",
                         success: function (result) {
                             var data = result.d;
                             var DataSource = JSON.parse(data);
                             var result = DataSource.Table;
                             ActionSubGrid(result);
                         }

                     })
                 }

                 function ExportData() {
                     debugger;
                     var clientid = "<%= Session["intCID"]%>";
                 var userid = "<%= Session["userId"]%>";
                 if (clientid == 0 || clientid == null || clientid == "") {
                     if ($('#ddlStatus').val() == 0 || $('#ddlStatus').val() == null) {
                         toastr.warning('Please Select Status');
                     }
                     else if ($('#ddlStatus').val() == 1) {
                         return;
                     }
                     else {
                         var intStatusId = $('#ddlStatus').val();
                         GetExcel(intStatusId);
                     }
                 }
                 else {
                     if ($('#ddlStatus').val() == 0 || $('#ddlStatus').val() == null) {
                         toastr.warning('Please Select Status');
                     }
                     else if ($('#ddlStatus').val() == 1) {
                         return;
                     }
                     else {
                         var intStatusId = $('#ddlStatus').val();
                         GetClientExcel(intStatusId, clientid);
                     }
                 }


             }
            
        function GetExcel(intStatusId) {
            debugger;
                 $.ajax({

                     url: "Employee.aspx/GetExportData?id=" + intStatusId,
                     type: "POST",
                    
                     datatype: "json",
                     contentType: "application/json; charset=utf-8",
                     cache: false,
                     async: false,
                     data: "{'intStatusId':'" + intStatusId + "'}",                     
                     success: function (data) {

                     },
                     error: function (data) {

                     }

                 });
                 toastr.success('Mail Send Successfully');
             }

             function GetClientExcel(intStatusId, clientid) {
                 debugger;
                 $.ajax({
                     url: "Employee.aspx/GetClientExcel?id=" + intStatusId + "," + clientid,
                     type: "POST",                    
                     datatype: "json",
                     contentType: "application/json; charset=utf-8",
                     cache: false,
                     async: false,
                     data: "{'intStatusId':'" + intStatusId + "','clientid':'" + clientid + "'}",
                    
                     success: function (data) {
                         debugger;
                         toastr.success('Mail Send Successfully');

                     },
                     error: function (data) {

                     }
                 })
                 toastr.success('Mail Send Successfully');

             }

             if (ClientName == 0 || ClientName == null) {
                 $('.labeluser').css('display', 'none');
                 $('#Newemployee').css('display', 'none');
                 $('#Companylable').show();
                 $('#ddlCompany').show();
                 $('#ClientName').hide();
             }
             else {
               $('.labeluser').css('display', 'block');
               $('#Newemployee').css('display', 'block');
                 $('#Companylable').hide();
                //$('#ddlCompany').hide();
              $('#ClientName').text(ClientName);
                var CompanyId = ClientId;
                 GetCompanyList(CompanyId);
              $('#ClientName').show();
             }
             $("#ddlCompany").change(function () {
                 debugger;
                 var end = this.value;
                 var Company = $('#ddlCompany').val();
                 
                 if($('#ddlStatus').val()!=0)
                 {
                     var StatusId = $('#ddlStatus').val();
                     GetStatusBasedClientList(StatusId, Company)
                 }
                 else {
                     GetCompanyList(Company);
                 }

             });

             function GetCompanyList(Company) {
                 debugger
                 $.ajax({
                     type: "POST",
                     url: "Employee.aspx/GetCompanyList?id=" + Company,
                     datatype: "json",
                     contentType: "application/json; charset=utf-8",
                     cache: false,
                     async: false,
                     data: "{'CompanyId':'" + Company + "'}",
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

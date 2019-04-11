<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="MasterPackageList.aspx.cs" Inherits="DocumentManagementSystem.EmployeePages.MasterPackageList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" runat="server">
    <div class="container">
        <div class="col-md-12 maincontentbg">
            <div class="space-medium">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="section-title">
                            <h2>MasterPackage Details</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="menu-block">
                            <h3 class="menu-title">MasterPackage List</h3>                              
                            <div class="row">
                            <div class="col-md-12">
                            <div class="row">                               
                                        <div class="col-md-3">
                                            <%--<select class="form-control" id="ddlCompany" name="ddlCompany">
                                                <option value="0">--Select Company--</option>
                                            </select>--%>
                                        </div>
                                     
                                <div class="col-md-offset-6 col-md-3 text-right">
                                    <a class="btn-link" href="#" onclick="CreateMasterPackage()" id="Newemployee"><i class="fa fa-plus"></i>Create MasterPackage </a>
                                </div>
                            </div>  
                                <div class="row clearfix">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-condensed table-hover" id="tblMasterPackageList">
                                                <thead>
                                                    <tr>
                                                        <th>Package Name</th>
                                                        <th>Description</th>                                                        
                                                        <th>PayRollAmount</th>
                                                        <th>TurnOverAmount</th> 
                                                       <%-- <th>Category</th>
                                                        <th>SubCategory</th> --%>                                                      
                                                        <th class="text-center">Edit</th>
                                                        <th class="text-center">Delete</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tblMasterPackageData"></tbody>
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
        $(document).ready(function () {
            GetMasterPackageList();
        })
        function GetMasterPackageList() {
            debugger;
            arrSearchData = new Array(0);
            arrSearchData[0] = new Array(0);
            arrSearchData[0][0] = 'event';
            arrSearchData[0][1] = 'GetMasterPackageList';          
            var returnData = initiateAjaxRequest(arrSearchData, "MasterPackageList.aspx");
            var result = JSON.parse(returnData);
            ActionSubGrid(result);
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
        //Function for bind data in datatable.
        function ActionSubGrid(DataSource) {

            //  Datatable binding for Persons {"iDataSort": 4},
            //{"bVisible": false}
            setTimeout(function () {
                $('#tblMasterPackageList').dataTable({
                    "destroy": true
                });

                MasterPackageTable = $('#tblMasterPackageList').DataTable({
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
                        { "data": "strPackageName", "sortable": true },
                        { "data": "strDescription", "sortable": true },
                        { "data": "PayrollPackageAmount", "sortable": true },
                        { "data": "TurnOverPackageAmount", "sortable": true },
                        //{ "data": "strCategoryPackageTypeName", "sortable": true },
                        //{ "data": "strSubCategoryPackageTypeName", "sortable": true },                                             
                        {
                            "data": "ID", "sortable": false,
                            "render": function (data, type, full, meta) {
                                return '<a href="#" class="btn btn-warning btn-sm" style="cursor:pointer" onclick="EditMasterPackage(' + full.ID + ')"><i class="fa fa-pencil"></i></a>';
                            }
                        },
                        {
                            "data": "ID", "sortable": false,
                            "render": function (data, type, full, meta) {
                                return '<a href="#" class="btn btn-danger btn-sm" style="cursor:pointer"  onclick="DeleteMasterPackage(' + full.ID + ')"><i class="fa fa-trash-o"></i></a>';
                            }
                        },
                    ]

                });

            }, 200);
        }
        function DeleteMasterPackage(ID) {
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
                            DeleteMasterPackageDetails(ID);

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
        function DeleteMasterPackageDetails(ID) {
            debugger;
            var Package = [];
            //var AddtionalWagesArray = [];
            var clsMasterPackage = {
                intPackageId: ID,
                intCategoryPackageTypeId: 0,
                intSubCategoryPackageTypeId: 0,              
                strPackageName: $('#txthours').val(),
                strDescription: $('#txtgrosssalary').val(),
                PayrollPackageAmount: $('#txthourswage').val(),
                TurnOverPackageAmount: $('#dateinservice').val(),
                bitIsActive: $('#chkActive').is(":checked")
            }
            Package.push(clsMasterPackage);

            var clsCommonPackage = {
                intPackageId: ID,
                LoginId: '0',
                strMode: 'Delete',
                MasterPackageList: Package,                
            }
            $.ajax({
                type: "POST",
                url: "MasterPackage.aspx/SaveMasterPackage",
                dataType: "json",
                contentType: 'application/json; charset=utf-8',
                cache: false,
                async: false,
                data: "{objMasterPackage:" + JSON.stringify(clsCommonPackage) + "}",
                success: function (result) {                    
                        GetMasterPackageList();                                       
                    toastr.success('Deleted Successfully');

                },
                error: function (result) {

                }
            })
        }
        function CreateMasterPackage() {
            $('#chkActive').prop('checked', true);
            $.uniform.update('#chkActive');                        
            window.location = "MasterPackage.aspx";
        }
        function EditMasterPackage(ID) {
            debugger;            
            window.location = "../EmployeePages/MasterPackage.aspx?id=" + encodeURIComponent(ID);            
        }
    </script>
</asp:Content>

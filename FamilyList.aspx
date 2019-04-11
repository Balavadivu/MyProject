<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="FamilyList.aspx.cs" Inherits="DocumentManagementSystem.EmployeePages.FamilyList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" runat="server">
     <div class="container">
            <div class="col-md-12 maincontentbg">
            <div class="space-medium">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="section-title">
                        <h2>Family Details</h2>
                    </div>
                </div>
            </div>
                <div class="row">                
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="menu-block">
                        <h3 class="menu-title">Family Details List</h3>
                        <%--<div class="labeluser text-center">
                                            <label class="" style="font-weight: bold;">Client Name : </label>
                                            <label id="ClientName" style="font-weight: bold;"></label>
                                        </div>--%>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">                                      
                                    <div class="col-md-3">                                            
                                            <select class="form-control input-medium input-sm input-inline" id="ddlCompany" name="ddlCompany">
                                                <option value="0">--Select Company--</option>
                                            </select>
                                        </div>  
                                        <div class="col-md-offset-6 col-md-3 text-right">                                           
                                            <a class="btn-link"  href="#" onclick="CreateFamily()" id="Newemployee"> <i class="fa fa-plus"></i> Create New Family</a>                                           
                                        </div>
                                    </div>
                                <div class="row clearfix">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover" id="tblFamilyList">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>Company Name</th>
                                                        <th>Employee Name</th>
                                                        <%--<th>Salary Type</th>--%>
                                                        <%--<th>Address</th>
                                                        <th>City</th>
                                                        <th>Country</th>
                                                        <th>DBA</th>
                                                        <th>Category</th>--%>
                                                        <th>Add Member</th>
                                                        <th>Delete</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tblFamilyData"></tbody>
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
        var PackageName = "<%= Session["strPackageName"]%>";
        $(document).ready(function () {
            debugger;
          if (ClientId == "" && userid == "") {
                alert("Session has Expired.Please Login Again.")
                window.location = '/Login.aspx';
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
            //GetFamilyList();
            //GetDropDownClient();
            if (UserName == 0 || UserName == null) {
                GetFamilyCompanyList(CompanyId);

            }
            else {
                GetFamilyList();
            }
        });
        function CreateFamily() {
            window.location = "FamilyDetails.aspx";
        }
        function GetFamilyList() {
            debugger;
            arrSearchData = new Array(0);
            arrSearchData[0] = new Array(0);
            arrSearchData[0][0] = 'event';
            arrSearchData[0][1] = 'GetFamilyList';           
            var returnData = initiateAjaxRequest(arrSearchData, "FamilyList.aspx");
            var result = JSON.parse(returnData);
            ActionSubGrid(result);
        }
        function initiateAjaxRequest(arrSearchData, url) {
            var _strReturn = null;
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
        //Function for bind data in datatable.
        function ActionSubGrid(DataSource) {

            //  Datatable binding for Persons
            setTimeout(function () {
                $('#tblFamilyList').dataTable({
                    "destroy": true
                });

                FamilyTable = $('#tblFamilyList').DataTable({
                    language: {
                        
                        searchPlaceholder: "Search records"
                    },
                    "destroy": true,
                    "sorting": [],
                    "columnDefs": [{
                        "targets": [3],
                        "visible": true
                    }
                    ],
                    "data": DataSource,
                    "columns": [
                        {
                            "data": "EmployeeName", "sortable": true,

                            "render": function (data, type, full, meta) {
                                return '<a href="#"   class="detailscontrols1" style="cursor:pointer" value=' + full.EmployeeName + ' id=' + full.intEmployeeid + '><i class="fa fa-plus-circle"></i></a>';
                            }
                        },
                     //   { "mDataProp": "RowNumber", "bSortable": true, "visible": false },                             
                        { "data": "ClientName", "sortable": true },
                        //{ "mDataProp": "intclientid", "bSortable": false },

                        { "data": "EmployeeName", "sortable": true },

                        //{
                        //    "data": "intFamilyId", "sortable": false,
                        //    "render": function (data, type, full, meta) {
                        //        return '<div class="btn-group"><a class="btn green-haze  btn-xs todo-projects-config" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true" aria-expanded="true">action <i class="fa fa-angle-down"></i></a><ul class="dropdown-menu pull-right"><li><a href="#" onclick="addsubfamilymember(' + full.intfamilyid + ',' + full.intemployeeid + ')">add member</a></li><li style="display:none;">keyin</li><li><a href="#" onclick="deletemaster(' + full.intfamilyid + ')">delete</a></li></ul></div>';
                        //        //return '<div class="btn-group"><a class="btn green-haze  btn-xs todo-projects-config" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true" aria-expanded="true">action <i class="fa fa-angle-down"></i></a><ul class="dropdown-menu pull-right"><li><a href="employeescreen.aspx?id=' + full.id + '">edit</a></li><li style="display:none;">keyin</li><li><a href="#" onclick="deleteemployee(' + full.id + ',' + full.emailsent + ')">delete</a></li></ul></div>';',' + full.emailsent +
                        //    },
                        //},
                        {
                            "data": "intFamilyId", "sortable": false,
                            "render": function (data, type, full, meta) {
                                return '<a href="#" class="btn btn-warning btn-sm" style="cursor:pointer"  onclick="AddSubFamilyMember(' + full.intFamilyId + ',' + full.intEmployeeid + ')"> <i class="fa fa-pencil"></i></a>';
                            }
                        },
                         {
                             "data": "intFamilyId", "sortable": false,
                             "render": function (data, type, full, meta) {
                                 return '<a href="#" class="btn btn-danger btn-sm" style="cursor:pointer"  onclick="DeleteMaster(' + full.intFamilyId + ')"><i class="fa fa-trash-o"></i></a>';
                             }
                         },
                         //{ "mDataProp": "intFamilyDetailId", "bSortable": true },

                    ]

                });

            }, 200);
        }

        $('#tblFamilyList tbody').on('click', 'a.detailscontrols1', function (e) {
            debugger;
            var tr = $(this).closest('tr');
            var row = FamilyTable.row(tr);

            if (row.child.isShown()) {
                // This row is already open - close it
                row.child.hide();
                tr.removeClass('shown');
            }
            else {
                // Open this row
                row.child(format(row.data())).show();
                tr.addClass('shown');
            }
        });

        function format(d) {
            debugger;
            var tableRow = '';
            $.ajax({
                url: "FamilyList.aspx/GetSubFamilyMember?intEmployeeid=" + d.intEmployeeid,
                type: "POST",
                datatype: "json",
                contentType: 'application/json; charset=utf-8',
                async: false,
                data: "{'intEmployeeid':'" + d.intEmployeeid + "'}",
                //}).
                success: function (result) {
                    returnData = JSON.parse(result.d);
                    data = returnData.Table;
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            if (tableRow == '') {
                                tableRow = '<tr>' +
                                    '<td>' + returnData.Table[i].FamilyMemeber + '</td>' +
                                    '<td>' + '<a href="#"  class="EditSubMember"  style="cursor:pointer" value="Send" id=' + data[i].intFamilyDetailId + '><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>' + '</td>' +
                                    '<td>' + '<a href="#"  class="DeleteSubMember"  style="cursor:pointer" value="Send" id=' + data[i].intFamilyDetailId + '><i class="fa fa-trash-o" aria-hidden="true"></i></a>' + '</td>' +
                                    '</tr>';
                            }
                            else {
                                tableRow = tableRow + '<tr>' +
                                                '<td>' + returnData.Table[i].FamilyMemeber + '</td>' +
                                                '<td>' + '<a href="#"  class="EditSubMember"  style="cursor:pointer" value="Send" id=' + data[i].intFamilyDetailId + '><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>' + '</td>' +
                                                //'<td>' + returnData[i].strErrorMessage + '</td>' +
                                                '<td>' + '<a href="#"  class="DeleteSubMember"  style="cursor:pointer" value="Send" id=' + data[i].intFamilyDetailId + '><i class="fa fa-trash-o" aria-hidden="true"></i></a>' + '</td>' +
                                            '</tr>';
                            }
                        }
                    }
                },
                //}).
                error:function (data) {
                console.log(data);
            }
            });
            //success: function (result) {
            //    returnData = JSON.parse(result.d);
            //    if (returnData.Table.length > 0) {
            //        for (var i = 0; i < returnData.Table.length; i++) {
            //            if (tableRow == '') {
            //                tableRow = '<tr>' +
            //                    '<td>' + returnData.Table[i].FamilyMemeber + '</td>' +
            //                    //'<td>' + returnData[i].strEmail + '</td>' +
            //                    //'<td>' + returnData[i].strErrorMessage + '</td>' +
            //                    '<td>' + '<a href="#"  class="SendMail"  style="cursor:pointer" value="Send" id=' + returnData.Table[i].intEmployeeId + '><i class="fa fa-send"></i></a>' + '</td>' +
            //                '</tr>';
            //            }
            //        }

            //    }
            //}.error(function (result) {

            //    // file failed to upload
            //    console.log(result);
            //});style="table-layout: fixed; width: 100% ;


            var childTable = '<table style=width:100%; border=1" >' +
                        '<tr>' +
                            '<td style="width: 40%; font-weight:bold">Name</td>' +
                            '<td style="width: 40%; font-weight:bold">Edit Member Detail</td>' +
                            //'<td >Status</td>' +
                            '<td style="width: 40%; font-weight:bold" >Delete Member</td>' +
                        '</tr>' +
                        tableRow
            '</table>';
            return childTable;
            //})
            // })
            // }
            //})
        }

        function DeleteMaster(intFamilyId) {
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
                            DeleteMasterFamily(intFamilyId)
                        }
                    }, danger: {

                        label: "No",
                        className: "btn-cancel",
                        callback: function () {
                        }
                    }
                }
            })
        }

        function DeleteMasterFamily(intFamilyId) {
            debugger;
            var MasterFamily = [];
            var FamilyDetail = [];
            var clsFamilyDetail = {
                intFamilyDetailId: 0,
                strFirstName: '',
                strLastName: '',
                dateBirthDate: '10 / 10 / 1999',
                strAddress: '',
                strEducation: '',
                strCategory: '',
                strDeduction: '',
                intCreatedby: 0,
            }
            FamilyDetail.push(clsFamilyDetail);
            var clsMasterFamily = {
                intFamilyId: intFamilyId,
                intClientID: 0,
                intEmployeeId: 0,
                LoginId: '0',
            }
            MasterFamily.push(clsMasterFamily);
            var CommonFamily = {
                Mode: 'DeleteFamily',
                FamilyDetail: FamilyDetail,
                MasterFamily: MasterFamily
            }
            $.ajax({
                type: "POST",
                url: "FamilyDetails.aspx/SaveFamily",
                dataType: "json",
                contentType: 'application/json; charset=utf-8',
                cache: false,
                async: false,
                data: "{objFamily:" + JSON.stringify(CommonFamily) + "}",
                success: function (result) {
                    var CompanyId = "<%= Session["intCID"]%>";
                    if (CompanyId == 0 || CompanyId == null) {
                        GetFamilyList();
                    }
                    else {
                        GetFamilyCompanyList(CompanyId);
                    }

                    toastr.success('Family Deleted Successfully');
                }
            })
            }


            function AddSubFamilyMember(intFamilyId, intEmployeeid) {
                debugger;
                window.location = "../EmployeePages/FamilyDetails.aspx?id=" + encodeURIComponent(intFamilyId) + "," + encodeURIComponent(intEmployeeid);
            }


            $(document).on('click', '.EditSubMember', function () {
                debugger;
                $this = $(this);
                var intFamilyDetailId = $(this).attr("id");
                window.location = "../EmployeePages/FamilyDetails.aspx?ids=" + encodeURIComponent(intFamilyDetailId);
            })

            $(document).on('click', '.DeleteSubMember', function () {
                debugger;
                $this = $(this);
                var intFamilyDetailId = $(this).attr("id");
                DeleteFamily(intFamilyDetailId);
            })

            function DeleteFamily(intFamilyDetailId) {
                debugger;
                var type = "KeyIn";
                bootbox.dialog({
                    message: "Are You Sure Want To Delete This Record?",
                    title: "Delete Confirmation!",
                    buttons: {
                        success: {
                            label: "Yes",
                            className: "btn btn-primary",
                            callback: function () {
                                DeleteFamilyMembar(intFamilyDetailId);
                            }
                        }, danger: {

                            label: "No",
                            className: "btn-cancel",
                            callback: function () {
                            }
                        }
                    }
                })
            }
            function DeleteFamilyMembar(intFamilyDetailId) {
                debugger;
                var MasterFamily = [];
                var FamilyDetail = [];
                var clsFamilyDetail = {
                    intFamilyDetailId: intFamilyDetailId,
                    strFirstName: '',
                    strLastName: '',
                    dateBirthDate: '10 / 10 / 1999',
                    strAddress: '',
                    strEducation: '',
                    strCategory: '',
                    strDeduction: '',
                    intCreatedby: 0,
                }
                FamilyDetail.push(clsFamilyDetail);
                var clsMasterFamily = {
                    intFamilyId: 0,
                    intClientID: 0,
                    intEmployeeId: 0,
                    LoginId: '0',
                }
                MasterFamily.push(clsMasterFamily);
                var CommonFamily = {
                    Mode: 'DeleteMember',
                    FamilyDetail: FamilyDetail,
                    MasterFamily: MasterFamily
                }
                $.ajax({
                    type: "POST",
                    url: "FamilyDetails.aspx/SaveFamily",
                    dataType: "json",
                    contentType: 'application/json; charset=utf-8',
                    cache: false,
                    async: false,
                    data: "{objFamily:" + JSON.stringify(CommonFamily) + "}",
                    success: function (result) {
                        var CompanyId = "<%= Session["intCID"]%>";
                    if (CompanyId == 0 || CompanyId == null) {
                        GetFamilyList();
                    }
                    else {
                        GetFamilyCompanyList(CompanyId);
                    }
                    toastr.success('Family Member Deleted Successfully');
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
               // $('#ddlCompany').hide();
                $('#ClientName').text(ClientName);
                var CompanyId = ClientId;
                GetFamilyCompanyList(CompanyId);
                $('#ClientName').show();
            }
            $("#ddlCompany").change(function () {
                debugger;
                var end = this.value;
                var CompanyId = $('#ddlCompany').val();
                GetFamilyCompanyList(CompanyId);
            });
            function GetFamilyCompanyList(CompanyId) {
                debugger
                $.ajax({
                    type: "POST",
                    url: "FamilyList.aspx/GetFamilyCompanyList?id=" + CompanyId,
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

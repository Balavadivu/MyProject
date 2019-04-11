<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="FamilyDetails.aspx.cs" Inherits="DocumentManagementSystem.EmployeePages.FamilyDetails" %>
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
                            <%--<h3 class="menu-title">Family Details List</h3>--%>
                            
                            <div class="row">
                            <div class="col-md-12">
                                 <div class="row">
                                     <div class="col-md-offset-2 col-md-8">
                                          <fieldset>
                                    <legend>Family Details List</legend>
                                         <div id="form_sample_3" class="form-horizontal frmhr">
                                <div class="form-body">
                                     <div class="form-group">
                                        <label class="control-label col-md-4">
                                             Company Name
                                        </label>
                                        <div class="col-md-8">
                                            <select class="form-control" id="ddlclient" name="ddlclient" tabindex="1">
                                                <option value="0">--Select Company--</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4">
                                            Employee
                                        </label>
                                        <div class="col-md-8">
                                            <select class="form-control" id="ddlEmployee" name="ddlEmployee" tabindex="2">
                                                <option value="0">--Select Employee--</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4">
                                            First Name
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" id="txtFirstName" class="form-control" tabindex="3" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4">
                                           Last Name
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" id="txtLastName" class="form-control" tabindex="4" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4">
                                            Data of Birth
                                        </label>
                                         <div class="col-md-8">
                                            <div class="input-group date date-picker"  data-date-format="mm-dd-yyyy" data-date="">
                                                <input type="text" class="form-control" id="DateofBirth" name="date" tabindex="5" />
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-4">
                                            Address
                                        </label>
                                        <div class="col-md-8">
                                            <asp:HiddenField runat="server" ID="HiddenField3" />
                                            <input type="text" class="form-control" id="txtAddress" aria-multiline="true" tabindex="6" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4">
                                            Education
                                        </label>
                                        <div class="col-md-8">
                                            <asp:HiddenField runat="server" ID="HiddenField4" />
                                            <input type="text" class="form-control" name="txtEducation" id="txtEducation" tabindex="7" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4">
                                            Category
                                        </label>
                                        <div class="col-md-8">
                                            <asp:HiddenField runat="server" ID="HiddenField5" />
                                            <input type="text" class="form-control" name="txtCategory" id="txtCategory"  tabindex="8"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4">
                                           Deduction
                                        </label>
                                        <div class="col-md-8">
                                            <asp:HiddenField runat="server" ID="HiddenField6" />
                                            <input type="text" class="form-control" name="txtDeduction"  id="txtDeduction"  tabindex="9" />
                                            <%--<span>Phone Number Example:1721 520 6888</span>--%>
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
                                <%--</fieldset>--%>
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
        var MasterFamilyid = 0;
        var FamilyDetailId = 0;
        var CommonUserId = 0;                 
        var userid = "<%= Session["userId"]%>"
        var ClientId = "<%= Session["intCID"]%>";
        var EditEmployeeId = getParameterByName('id');
        var EmployeeIds1 = getParameterByName('ids');
        var UserType = $.cookie("UserType");      
        var bitStatus = false;
        var StatusName = '';
        var PackageName = "<%= Session["strPackageName"]%>";
        $(document).ready(function () {
            if ((ClientId == "" && userid == "")) {
                // alert("Session has Expired.Please Login Again.")(
                window.open('/Login.aspx', "_self");
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
                GetClient();
            }
            if (ClientId == 0 || ClientId == null) {
                $('#ddlStatus').removeAttr('disabled');
            }
            else {
                $('#ddlStatus').attr('disabled', 'disabled');
            }
            GetStatus();            
            if (ClientId != 0 && ClientId != null && ClientId != "") {
                GetClientBasedEmployee(ClientId);
            } else {
                GetDropDownEmployee();
            }
            if (ClientId != 0 && ClientId != null && ClientId != "") {
                CommonUserId = "<%= Session["intCID"]%>";
           }
           else {
               CommonUserId = "<%= Session["userId"]%>";
           }
            if ((EditEmployeeId != "0" && EditEmployeeId != null) && (EditEmployeeId != null && EditEmployeeId != '')) {
                debugger;
                var EmployeeId1 = EditEmployeeId.split(',');
                EmployeeIds = EmployeeId1[1];
                AddSubFamilyMember(EmployeeIds);
            }
            if ((EmployeeIds1 != "0" && EmployeeIds1 != null) && (EmployeeIds1 != null && EmployeeIds1 != '')) {               
                EditSubMembar(EmployeeIds1);
            }


        });
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

                        $("#ddlclient").append($("<option></option>").val(value.ID).html(value.Name));
                    })
                    $('#ddlclient').val(ClientId);
                }
            })
        }

       function GetClientBasedEmployee(ClientId) {
           debugger;          
           $.ajax({
               url: "FamilyDetails.aspx/GetClientBasedEmployee?id=" + ClientId,
               type: "POST",
               datatype: "json",
               contentType: "application/json; charset=utf-8",
               cache: false,
               async: false,
               data: "{'ClientId':'" + ClientId + "'}",             
               success: function (result) {
                   var returnData = result.d;
                   $('#ddlEmployee option[value!="0"]').remove();
                   $("#ddlEmployee").append(returnData);
               }
           });

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
               type: "post",
               async: false,
               data: parameters,
               success: function (req) {
                   if (req != "") {
                       _strreturn = req;
                   }
               },
               error: function () {
                   servererror();
               }
           });
           return _strreturn;
       }

       function getParameterByName(name) {
           debugger;
           name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
           var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
               results = regex.exec(location.search);
           return results === null ? 0 : decodeURIComponent(results[1].replace(/\+/g, " "));
       }
       
       function GetDropDownEmployee() {
           debugger;
           arrSearchData = new Array(0);
           arrSearchData[0] = new Array(0);
           arrSearchData[0][0] = 'event';
           arrSearchData[0][1] = 'GetDropDownEmployee';

           var returnData = initiateAjaxRequest(arrSearchData, "FamilyDetails.aspx");
           debugger;
           $('#ddlEmployee option[value!="0"]').remove();

           $("#ddlEmployee").append(returnData);
       }
       function GetClient() {
           CommonUserId = "<%= Session["intCID"]%>";
            debugger;
            arrSearchData = new Array(0);
            arrSearchData[0] = new Array(0);
            arrSearchData[0][0] = 'event';
            arrSearchData[0][1] = 'GetClient';

            var returnData = initiateAjaxRequest(arrSearchData, "FamilyDetails.aspx");
            debugger;
            $('#ddlclient option[value!="0"]').remove();
            $("#ddlclient").append(returnData);           
        }

        function SubmitMethod() {
            
            if ($('#ddlStatus option:selected').text() == 'synchronized') {
                bitStatus = true;
            }
            else {
                bitStatus = false;
            }
            if ($('#ddlclient').val() == 0 || $('#ddlclient').val() == null || $('#ddlclient').val() == 'undefined') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Select The Client');
                $('#ddlclient').focus();
                return;
            }
            else if ($('#ddlEmployee').val() == 0 || $('#ddlEmployee').val() == null || $('#ddlEmployee').val() == 'undefined') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Please Select The Employee');
                $('#ddlEmployee').focus();
                return;
            }
            else if ($('#txtFirstName').val() == '' || $('#txtFirstName').val() == null || $('#txtFirstName').val() == 'undefined') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Enter The First Name');
                $('#txtFirstName').focus();
                return;
            }
            else if ($('#txtLastName').val() == '' || $('#txtLastName').val() == null || $('#txtLastName').val() == 'undefined') {
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.warning('Enter The Last Name');
                $('#txtLastName').focus();
                return;
            }

            else if (MasterFamilyid == 0 && FamilyDetailId == 0) {
                mode = 'Add';
            }
            else if (MasterFamilyid != 0 && FamilyDetailId == 0) {
                mode = 'Add';
            }
            else {
                mode = 'update';
                if (bitStatus == false && ($('#ddlStatus option:selected').text() == 'synchronized')) {
                     StatusName = 'synchronized'
                     bitStatus = true;
                }
                else if (bitStatus == true && ($('#ddlStatus option:selected').text() == 'synchronized')) {
                    StatusName = '';
                }
            }
            SaveFamily(mode);
        }
        function SaveFamily(mode) {
            debugger;
            var Type = UserType.split('=');
            var FamilyDetailArray = [];
            var MasterFamilyArray = [];
            var clsFamilyDetail = {
                intFamilyDetailId: FamilyDetailId,
                intFamilyId: MasterFamilyid,
                strFirstName: $('#txtFirstName').val(),
                strLastName: $('#txtLastName').val(),
                dateBirthDate: $('#DateofBirth').val(),
                strAddress: $('#txtAddress').val(),
                strEducation: $('#txtEducation').val(),
                strCategory: $('#txtCategory').val(),
                strDeduction: $('#txtDeduction').val(),
                intStatus: $('#ddlStatus').val(),
                bitStatus:bitStatus,
                intCreatedby: CommonUserId,

            }
            FamilyDetailArray.push(clsFamilyDetail);
            var clsMasterFamily = {
                intFamilyId: MasterFamilyid,
                intClientID: $('#ddlclient').val(),
                intEmployeeId: $('#ddlEmployee').val(),
                intCreatedby: CommonUserId,
                // FamilyDetail: FamilyDetailArray
            }
            MasterFamilyArray.push(clsMasterFamily);
            var CommonFamily = {
                Mode: mode,
                FamilyDetail: FamilyDetailArray,
                MasterFamily: MasterFamilyArray,
                LoginId: CommonUserId,
                UserType:Type[1]
            }
            $.ajax({
                url: "FamilyDetails.aspx/SaveFamily",
                type: "POST",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{objFamily:" + JSON.stringify(CommonFamily) + "}",
                success: function (data) {
                    var splitResult1 = data.d;
                    var splitResult = splitResult1.split("^&*");
                    if (splitResult.length > 1) {
                        var ID = splitResult[2];
                        var FamilyId = splitResult[3];
                        EmployeeIds1 = ID;
                        var CompanyName = $('#ddlclient :selected').text();
                        CompanyName = CompanyName.replace(/\s/g, '');
                        CompanyName = CompanyName.replace("'", '');
                        GetSubFamilyMemberLink(EmployeeIds1, mode, CompanyName);
                    }                                           
                    var splitResult = splitResult1.split("^&*");
                    if (splitResult.length > 1) {
                        debugger;
                        if (splitResult[1].trim() == "Success") {                            
                            toastr.success('Saved Successfully');
                            
                            if (StatusName != '' && StatusName != 'undefined') {
                                SynchronizedFamilyConfirmationMail(EmployeeIds1, FamilyId, CompanyName);
                            }
                            else {

                            }
                        }
                        else if (splitResult[1].trim() == "Warning") {
                            toastr.warning("Family Already Existing");
                        }
                        else {
                            debugger;
                            toastr.success('Updated Successfully');
                        }
                        //get
                        //alert('save successfully');
                    }
                    Cancel();
                }
            })
        }
        function Cancel() {
            $('#ddlclient').val('');
            $('#ddlEmployee').val('');
            $('#txtFirstName').val('');
            $('#txtLastName').val('');
            $('#DateofBirth').val('');
            $('#txtAddress').val('');
            $('#txtEducation').val('');
            $('#txtCategory').val('');
            $('#txtDeduction').val('');
            window.location = "FamilyList.aspx";
        }
        $("#ddlclient").change(function () {
            debugger;
            var end = this.value;
            var EmployeeId = $('#ddlclient').val();
            GetEmployeeList(EmployeeId);
        });
        function GetEmployeeList(EmployeeId) {
            debugger;
            $.ajax({
                url: "FamilyDetails.aspx/Getemployee?id=" + EmployeeId,
                type: "POST",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'EmployeeId':'" + EmployeeId + "'}",
                success: function (result) {
                    $('#ddlEmployee option[value!="0"]').remove();
                    $("#ddlEmployee").append(result.d);
                }
            });
        }


        function AddSubFamilyMember(EmployeeIds) {
            debugger;
            $.ajax({
                url: "FamilyDetails.aspx/GetAddSubFamilyMember?id=" + EmployeeIds,
                type: "POST",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'intEmployeeId':'" + EmployeeIds + "'}",
                success: function (result) {
                    var result1 = result.d;
                    var data = JSON.parse(result1);
                    $('#ddlclient').val(data[0].intclientid);
                    $('#ddlEmployee').val(data[0].intEmployeeid);
                    //$('#ddlStatus').val(data[0].intStatus);
                    MasterFamilyid = data[0].intFamilyId;
                }
            })
        }

        function EditSubMembar(EmployeeIds1) {
            debugger;
            $.ajax({
                url: "FamilyDetails.aspx/GetSubMembarEdit?id=" + EmployeeIds1,
                type: "POST",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'intFamilyDetailId':'" + EmployeeIds1 + "'}",
                success: function (result) {
                    var result1 = result.d;
                    var data = JSON.parse(result1);
                    $('#ddlclient').val(data[0].intClientID);
                    $('#ddlEmployee').val(data[0].intEmployeeId);
                    $('#txtFirstName').val(data[0].FirstName);
                    $('#txtLastName').val(data[0].LastName);
                    if (data[0].datebirthdate != null || data[0].datebirthdate != '') {
                        var indate = data[0].dateBirthDate
                        $('#DateofBirth').val(indate);
                    }
                    //$('#DateofBirth').val(data.Table[0].datebirthdate);.split('T00:00:00');
                    $('#txtAddress').val(data[0].Address);
                    $('#txtEducation').val(data[0].Education);
                    $('#txtCategory').val(data[0].Category);
                    $('#txtDeduction').val(data[0].Deduction);
                    $('#ddlStatus').val(data[0].intStatus);
                    bitStatus = data[0].bitStatus;
                    MasterFamilyid = data[0].intFamilyId;
                    FamilyDetailId = data[0].intFamilyDetailId;
                }
            })
        }

        function GetSubFamilyMemberLink(EmployeeIds1, mode, CompanyName) {
            debugger;
            $.ajax({
                url: "FamilyDetails.aspx/GetSubFamilyMemberLink?id=" + EmployeeIds1 + "," + mode + "," + CompanyName,
                type: "POST",
                //url: "EmployeeList.aspx/GetExportData?id=" + intStatusId,
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'EmployeeID':'" + EmployeeIds1 + "','Mode':'" + mode + "','CompanyName':'" + CompanyName + "'}",
                //data: "{'intStatusId:'" + intStatusId + "'}",
                success: function (data) {
                    debugger;
                    //toastr.options = {
                    //    "positionClass": "toast-bottom-right",
                    //}
                    //toastr.success('Mail Send Successfully');

                },
                error: function (data) {

                }
            })
            //toastr.options = {
            //    "positionClass": "toast-bottom-right",
            //}
            //toastr.success('Mail Send Successfully');

        }
        function GetfamiyLink(EmployeeIds,ID1, mode) {
            debugger;
            $.ajax({
                url: "FamilyDetails.aspx/GetfamiyLink?id=" + EmployeeIds + "," + mode+","+ID1 ,
                type: "POST",                
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'EmployeeID':'" + EmployeeIds + "','Mode':'" + mode + "','ID1':'"+ID1+"'}",
                success: function (data) {
                    debugger;
                    //toastr.options = {
                    //    "positionClass": "toast-bottom-right",
                    //}
                    //toastr.success('Mail Send Successfully');

                },
                error: function (data) {

                }
            })
            //toastr.options = {
            //    "positionClass": "toast-bottom-right",
            //}
            //toastr.success('Mail Send Successfully');

        }

        function SynchronizedFamilyConfirmationMail(EmployeeIds1, FamilyId, CompanyName) {
            debugger;
            $.ajax({
                url: "FamilyDetails.aspx/SynchronizedFamilyConfirmationMail",
                type: "POST",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'EmployeeIds1':'" + EmployeeIds1 + "','FamilyId':'" + FamilyId + "','CompanyName':'" + CompanyName + "'}",
                success: function (data) {
                    debugger;
                },
                error: function (data) {

                }
            })
        }

    </script>
</asp:Content>

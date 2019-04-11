<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="DocumentManagementSystem.EmployeePages.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" runat="server">
     <div class="container">
        <div class="col-md-12 maincontentbg">
            <div class="space-medium">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="section-title">
                            <h2>Change Password</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-offset-2 col-md-8">
                                <fieldset>
                                  <%--  <legend>TurnOver Declaration List</legend>--%>
                                <div id="form_sample_3" class="form-horizontal frmhr">
                                    <div class="form-body">                                                                               
                                        <div class="form-group">
                                            <label class="control-label col-md-4">
                                                Old Password
                                            </label>
                                            <div class="col-md-8">
                                                <asp:HiddenField runat="server" ID="HiddenField1" />
                                                <input type="password" class="form-control" id="txtoldpassword" aria-multiline="true"  /><%--<span id="errAmount"></span>--%>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-4">
                                                New Password
                                            </label>
                                            <div class="col-md-8">
                                                <asp:HiddenField runat="server" ID="HiddenField2" />
                                                <input type="password" class="form-control" id="txtNewPassword" aria-multiline="true" /><%--<span id="errAmountANG"></span>--%>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-4">
                                                Confirm Password
                                            </label>
                                            <div class="col-md-8">
                                                <asp:HiddenField runat="server" ID="HiddenField3" />
                                                <input type="password" class="form-control" id="txtConfirmPassword" aria-multiline="true" /><%--<span id="errTaxRate"></span>--%>
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
    <script type="text/javascript" src="assets/global/scripts/jquery.cookie.min.js"></script>  
   <script>
       var OldPassword = '';
       var Password = '';
       var ConfirmPassword = '';
       var userid = "<%= Session["userId"]%>";
       var ClientId = "<%= Session["intCID"]%>";
       var OldPwdCookie = $.cookie("password");
       $('#txtConfirmPassword,#txtNewPassword').on('keypress', function (e) {
           if (e.which == 32) {
               toastr.options = {
                   "positionClass": "toast-bottom-right",
               }
               toastr.warning('Spaces Not allowed for password');
               return false;
           }
       });
       OldPassword = $('#txtoldpassword').val();
       Password = $('#txtNewPassword').val();
       ConfirmPassword = $('#txtConfirmPassword').val();
       function SubmitMethod() {
           debugger;
           if ($('#txtoldpassword').val() == "") {
               $('#txtoldpassword').focus();
               toastr.warning("Please enter the Old Password");
           }
           else if ($('#txtNewPassword').val() == "") {
               $('#txtNewPassword').focus();
               toastr.warning("Please enter the New Password");
           }
           else if ($('#txtConfirmPassword').val() == "") {
               $("#txtConfirmPassword").focus();
               toastr.warning("Please enter the Confirm Password");
           }
            
           else if ($('#txtNewPassword').val() != "" && $('#txtConfirmPassword').val() != "") {
               if (OldPwdCookie != $('#txtoldpassword').val())
               {
                   toastr.warning("Oldpassword is Mismatch");
                   $('#txtoldpassword').focus();
                   return;
               }
               if ($('#txtNewPassword').val() == $('#txtConfirmPassword').val()) {
                   OldPassword = $('#txtoldpassword').val();
                   Password = $('#txtNewPassword').val();                   
                   UpdatePassword(ClientId, Password);

                   function UpdatePassword(ClientId, Password) {
                       $.ajax({
                           url: "ChangePassword.aspx/ExternalChangePassword",
                           type: "POST",
                           datatype: "json",
                           contentType: "application/json; charset=utf-8",
                           cache: false,
                           async: false,
                           data: "{'ClientId':'" + ClientId + "','Password':'" + Password + "'}",
                           success: function (result) {
                               var result1 = result.d;
                               var splitResult = result1.split("^&*");
                               if (splitResult[1].trim() == "Success") {

                                   toastr.options = {
                                       "positionClass": "toast-bottom-right",
                                   }
                                   toastr.success('Saved Successfully');
                                   Cancel();
                               }
                               else if (splitResult[1].trim() == "Warning") {
                                   toastr.options = {
                                       "positionClass": "toast-bottom-right",
                                   }
                                   toastr.warning("Invaild MailID");
                                   Cancel();
                               }
                           }
                       })
                   }
               }
               else {
                   toastr.warning("Password is Mismatch");
                   $('#txtConfirmPassword').focus();
               }
           }
       
       }
       function Cancel() {
           $('#txtoldpassword').val('');
           $('#txtNewPassword').val('');
           $('#txtConfirmPassword').val();
           window.location = '../EmployeePages/Employee.aspx'
       }
   </script>
</asp:Content>

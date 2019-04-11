<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="MasterPackage.aspx.cs" Inherits="DocumentManagementSystem.EmployeePages.MasterPackage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" runat="server">
    <div class="container">
        <div class="col-md-12 maincontentbg">
            <div class="space-medium">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="section-title">
                            <h2>Master Package</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-offset-2 col-md-8">
                                <fieldset>
                                    <legend>Master Package List</legend>
                                <div id="form_sample_3" class="form-horizontal frmhr">
                                    <div class="form-body">
                                        <div class="form-group">
                                            <label class="control-label col-md-4">
                                                Package Name
                                            </label>
                                               <div class="col-md-8">
                                                <asp:HiddenField runat="server" ID="HiddenField7" />
                                                <input type="text" class="form-control" id="txtpackage" aria-multiline="true" /><span id="Amount"></span>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label col-md-4">
                                               Description
                                            </label>
                                               <div class="col-md-8">
                                                <asp:HiddenField runat="server" ID="HiddenField8" />
                                                <input type="text" class="form-control" id="txtDescription" aria-multiline="true" /><span id="Amount1"></span>
                                            </div>
                                        </div>
                                         <%--<div class="form-group">
                                            <label class="control-label col-md-4">
                                             Category Type
                                            </label>
                                            <div class="col-md-8">
                                                <select class="form-control" id="ddlcategory" name="ddlcategory">
                                                    <option value="0">--Select Category--</option>
                                                </select>
                                            </div>
                                        </div>--%>
                                         <%--<div class="form-group">
                                            <label class="control-label col-md-4">
                                             SubCategory Type
                                            </label>
                                            <div class="col-md-8">
                                                <select class="form-control" id="ddlsubcategory" name="ddlsubcategory">
                                                    <option value="0">--Select SubCategory--</option>
                                                </select>
                                            </div>
                                        </div>  --%>                                                                              
                                        <div class="form-group" id="PayRoll">
                                            <label class="control-label col-md-4">
                                              PayRoll Amount
                                            </label>
                                            <div class="col-md-4">
                                                <asp:HiddenField runat="server" ID="HiddenField1" />
                                                <input type="text" class="form-control" id="txtPayrollAmount" aria-multiline="true" /><span id="errAmount"></span>                                                
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label">Per (Employee)</label>
                                            </div>
                                        </div>
                                        <div class="form-group" id="TurnOver">
                                            <label class="control-label col-md-4">
                                                TurnOver Amount
                                            </label>
                                            <div class="col-md-4">
                                                <asp:HiddenField runat="server" ID="HiddenField2" />
                                                <input type="text" class="form-control" id="txtTurnOverAmount" aria-multiline="true" /><span id="errAmountTurnOver"></span>
                                            </div>
                                             <div class="col-md-4">
                                                <label class="control-label">Per(TurnOver Declaration)</label>
                                            </div>
                                        </div>  
                                         <div class="form-group">
                                            <label class="control-label col-md-4">
                                               Active
                                            </label>
                                            <div class="col-md-8">
                                                <asp:HiddenField runat="server" ID="HiddenField3" />
                                                <input type="checkbox" name="Active" id="chkActive"/>
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
        var MasterPackage = 0;
        var CommonUserId = 0;
        var userid = "<%= Session["userId"]%>";
        var ClientId = "<%= Session["intCID"]%>";
        var ID = getParameterByName('id');
        $(document).ready(function () {
            var PackageName = "<%= Session["strPackageName"]%>";
            if (PackageName == 'Tax Only' || PackageName == 'TurnOver Only') {
                window.location = "../EmployeePages/TurnOverDecelartion.aspx";
                return;
            }
            //if (PackageId == 9) {
            //    window.location = "../EmployeePages/TurnOverDecelartion.aspx";
            //    return;
            //}
            if ((ClientId == "" && userid == "")) {
                // alert("Session has Expired.Please Login Again.")(
                window.open('/Login.aspx', "_self");
            }
            $('#chkActive').prop('checked', true);
            $.uniform.update('#chkActive');
        GetCategory();
        GetSubCategory();       
        if ((ID != "0" && ID != null) && (ID != null && ID != '')) {
            debugger;            
            MasterPackageEdit(ID);
        }
        else {
            $('#lblTitle').text("Add Customer");
        }
    })
    function GetCategory() {        
        debugger;
        arrSearchData = new Array(0);
        arrSearchData[0] = new Array(0);
        arrSearchData[0][0] = 'event';
        arrSearchData[0][1] = 'GetCategory';

        var returnData = initiateAjaxRequest(arrSearchData, "MasterPackage.aspx");
        debugger;
        $('#ddlcategory option[value!="0"]').remove();
        $("#ddlcategory").append(returnData);
    }
    function GetSubCategory() {
        debugger;
        arrSearchData = new Array(0);
        arrSearchData[0] = new Array(0);
        arrSearchData[0][0] = 'event';
        arrSearchData[0][1] = 'GetsubCategory';

        var returnData = initiateAjaxRequest(arrSearchData, "MasterPackage.aspx");
        debugger;
        $('#ddlsubcategory option[value!="0"]').remove();
        $("#ddlsubcategory").append(returnData);
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


    
         
    function SubmitMethod() {
        if ($('#txtpackage').val() == '' || $('#txtpackage').val() == null || $('#txtpackage').val() == 'undefined') {
            toastr.options = {
                "positionClass": "toast-bottom-right",
            }
            toastr.warning('Please Enter PackageName');
            $('#txtpackage').focus();
            return;
        }                                      
        debugger;
        var Package = [];
        if (MasterPackage == 0) {
            mode = 'Add';
        }
        else {
            mode = 'update';
        }      
        if (ClientId == 0 || ClientId == null || ClientId == "") {
            debugger;
            CommonUserId = "<%= Session["userId"]%>";
        }
        else {
            CommonUserId = "<%= Session["intCID"]%>";
        }
        var clsMasterPackage = {
            intPackageId: MasterPackage,
            strPackageName: $('#txtpackage').val(),
            strDescription: $('#txtDescription').val(),
            intCategoryPackageTypeId: $('#ddlcategory').val(),
            intSubCategoryPackageTypeId: $('#ddlsubcategory').val(),
            PayrollPackageAmount: $('#txtPayrollAmount').val(),
            TurnOverPackageAmount: $('#txtTurnOverAmount').val().trim(),
            bitIsActive: $('#chkActive').is(":checked"),
        }
        Package.push(clsMasterPackage);

        var clsCommonPackage = {
            MasterPackageList: Package,
            LoginId: CommonUserId,
            strMode: mode
        }
        $.ajax({
            url: "MasterPackage.aspx/SaveMasterPackage",
            type: "POST",
            datatype: "json",
            contentType: "application/json; charset=utf-8",
            cache: false,
            async: false,
            data: "{objMasterPackage:" + JSON.stringify(clsCommonPackage) + "}",
            success: function (data) {
                Clear();
                toastr.options = {
                    "positionClass": "toast-bottom-right",
                }
                toastr.success('save successfully');
            }
        })
    }
    function Clear() {
        $('#txtpackage').val('');
        $('#txtDescription').val('');
        $('#ddlCurrency').val('');
        $('#ddlcategory').val('');
        $('#ddlsubcategory').val('');
        $('#txtPayrollAmount').val('');
        $('#txtTurnOverAmount').val('');

        window.location = "MasterPackageList.aspx";
    }
    function Cancel()
    {
        //Clear();
        window.location = "MasterPackageList.aspx";
    }

    function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
        return results === null ? 0 : decodeURIComponent(results[1].replace(/\+/g, " "));
    }
    function MasterPackageEdit(ID) {
        {
            debugger;
            $.ajax({
                url: "MasterPackage.aspx/GetMasterPackageDetails?id=" + ID,
                type: "POST",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'ID':'" + ID + "'}",                
                success: function (result) {
                    var result1 = result.d;
                    var data = JSON.parse(result1);
                    $('#txtpackage').val(data[0].strPackageName);
                    $('#txtDescription').val(data[0].strDescription);
                    $('#ddlcategory').val(data[0].intCategoryPackageTypeId);
                    $('#ddlsubcategory').val(data[0].intSubCategoryPackageTypeId);
                    $('#txtPayrollAmount').val(data[0].PayrollPackageAmount);
                    $('#txtTurnOverAmount').val(data[0].TurnOverPackageAmount);
                    if (data[0].bitIsActive == true) {
                        $('#chkActive').prop('checked', true);
                        $.uniform.update('#chkActive');
                        //$($('#chksole').parent()).addClass('checked')
                    }
                    MasterPackage = data[0].intPackageId;
                },
                error: function (result) {

                }
            })
        }
    }
    //else {
    //        $('#TurnOver').show();
    //}
    $("#ddlcategory").change(function () {
        var category = this.value;
        if (category == 1)
        {
            $('#TurnOver').hide();
            $('#PayRoll').show();
        } 
        else if (category == 2) {
            $('#TurnOver').show();
            $('#PayRoll').show();
        }
        else if (category==3) {
            $('#TurnOver').show();
            $('#PayRoll').hide();
        }
        
    });
    $("#txtPayrollAmount").keypress(function (e) {
        //if the letter is not digit then display error and don't type anything 
        if (e.which != 8 && e.which != 0 && (e.which < 45 || e.which > 57)) {
            debugger;
            //display error message
            $("#errAmount").html("Digits Only").show().fadeOut("slow");
            return false;
        }        
    });
    $("#txtTurnOverAmount").keypress(function (e) {
        //if the letter is not digit then display error and don't type anything 
        if (e.which != 8 && e.which != 0 && (e.which < 45 || e.which > 57)) {
            debugger;
            //display error message
            $("#errAmountTurnOver").html("Digits Only").show().fadeOut("slow");
            return false;
        }
    });
        </script>
</asp:Content>

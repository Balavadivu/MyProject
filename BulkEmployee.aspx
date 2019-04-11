<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="BulkEmployee.aspx.cs" Inherits="DocumentManagementSystem.EmployeePages.BulkEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        div.uploader{
            width: auto !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" runat="server">

    <div class="container">
        <div class="col-md-12 maincontentbg">
            <div class="space-medium">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="section-title">
                            <h2>Bulk Employee</h2>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="menu-block">
                            <h3 class="menu-title">Employee Add</h3>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row" style="margin-bottom:15px;">
                                        <div class="col-md-8">
   
                                            <input type="file" name="UploadedFile" id="xmlfile" />
                                                                                   
                                                <button type="button" class="btn btn-primary btn-sm" id="btnUploaddoc">Upload XMl</button>
                                      
                                                <button type="button" class="btn btn-primary btn-sm" id="btnSavedoc">Save Employee</button>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="text-right">
                                                
                                                    <button type="button" class="btn btn-primary btn-sm" id="btnDownload">Download XML File</button>
                                                
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row clearfix">
                                        <div class="col-md-12">
                                            <div class="table-responsive" id="divBulkEmplpyee">
                                                <table class="table table-striped table-bordered table-condensed table-hover" id="tblBulkEmployee">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <input type="checkbox" id="checkall" /></th>
                                                            <th>NewClient</th>
                                                            <th>Name</th>
                                                            <th>CrbiNumber</th>
                                                            <th>NewEmployee</th>
                                                            <th>FirstName</th>
                                                            <th>LastName</th>
                                                            <th>Salary</th>
                                                            <th>WagePeriodID</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody id="tbodyBulkEmployee"></tbody>
                                                </table>

                                            </div>
                                            <div><label class="labeltxt"></label></div>
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


    <script type="text/javascript">

        var UserName = "<%= Session["userName"]%>";
        var ClientName = "<%= Session["ClientName"]%>";
        var userid = "<%= Session["userId"]%>";
        var ClientId = "<%= Session["intCID"]%>";

        $(document).ready(function () {
            GetClientList();

        });

        var dtBulkEmployee1 = '';
        var dtBulkEmployee = '';
        var arrayOfValuesName = [];

        function GetClientList() {
            debugger;

            $.ajax({
                url: "BulkEmployee.aspx/GetEmployeeData",
                type: "POST",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: {},
                success: function (data) {
                    debugger;
                    var returnData = JSON.parse(data.d);
                    dtBulkEmployee1 = returnData.Table;
                },
                error: function (data) {

                }
            })
        }


        $("#checkall").click(function () {
            debugger;

            if ($("#checkall").is(':checked')) {

                dtBulkEmployee.$('.clientIdsDelete').prop('checked', true);

            } else {
                dtBulkEmployee.$('.clientIdsDelete').prop('checked', false);
            }
        });


        $('#btnUploaddoc').click(function () {
            debugger;
            var messagetxt = "";
            var checkrow = "";
            var xmlDoc = "";
            var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.xml)$/;
            //Checks whether the file is a valid xml file  
            if (regex.test($("#xmlfile").val().toLowerCase())) {
                //Checks whether the browser supports HTML5  
                if (typeof (FileReader) != "undefined") {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        debugger;
                        try {
                            xmlDoc = $.parseXML(e.target.result); //is valid XML
                        } catch (err) {
                            // was not XML
                            alert('This is Not Valid xml');
                        }
                        //Splitting of Rows in the xml file  
                        var xmlrows = $(xmlDoc).find("Client");
                        var table = $("#tblBulkEmployee > tbody");
                        for (var i = 0; i < xmlrows.length; i++) {
                            if (xmlrows[i] != "") {
                                debugger;
                                var row = '<tr><td><input type="checkbox" name="checkdelete" id=checkemployee class="clientIdsDelete" value= ' + i + "checkEmp" + '></td>';
                                var xmlcols = $(xmlrows[i]).children();
                               // arrayOfValuesName.push(xmlcols[0].innerHTML.trim() + " " + xmlcols[1].innerHTML.trim());
                                //Looping through each nodes in a xml row  
                                for (var j = 0; j < xmlcols.length; j++) {
                                    var cols = "<td>" + $(xmlcols[j]).text() + "</td>";                                                                                                            
                                    if (j == 3) {                                        
                                        var xmlcolsEmp1 = $(xmlcols[3]).children();
                                        arrayOfValuesName.push(xmlcolsEmp1[1].innerHTML.trim() + " " + xmlcolsEmp1[2].innerHTML.trim());
                                        for (var k = 0; k < xmlcolsEmp1.length; k++) {
                                            var cols = "<td>" + $(xmlcolsEmp1[k]).text() + "</td>";
                                            row += cols;
                                        }
                                    }
                                    else {
                                        var cols = "<td>" + $(xmlcols[j]).text() + "</td>";
                                        row += cols;

                                    }
                                }                                
                                row += '</tr>';
                                table.append(row);
                            }
                        }
                        //dtBulkEmployee = $("#tblBulkEmployee").dataTable();
                        //for (var l = 0; l < dtBulkEmployee1.length; l++) {
                        //    for (var k = 0; k < arrayOfValuesName.length; k++) {
                        //        if (dtBulkEmployee1[l].EmployeeName == arrayOfValuesName[k]) {
                        //            debugger;
                        //            if (dtBulkEmployee1[l].bitStatus == true) {
                        //                messagetxt = "Employee " + dtBulkEmployee1[l].EmployeeName + " already Exist with ID " + dtBulkEmployee1[l].intClientId;
                        //                $(dtBulkEmployee[0].rows[1]).css('background-color', 'Yellow');
                        //                $(dtBulkEmployee[0].rows[1]).css('color', 'Black');
                        //                $(dtBulkEmployee[0].rows[1]).css('color', 'Black');
                        //                // alert(messagetxt);
                        //            }
                        //            $('#tblBulkEmployee').show();
                        //            $('.labeltxt').text(messagetxt);
                        //        }
                        //    }
                        //}
                        $('#tblBulkEmployee').show();
                       // $('#tblBulkEmployee').find('td:last-child').remove();
                        dtBulkEmployee = $("#tblBulkEmployee").dataTable({
                            "fnRowCallback": function (row, aData, iDisplayIndex, iDisplayIndexFull) {
                                for (var l = 0; l < dtBulkEmployee1.length; l++) {
                                    for (var k = 0; k < arrayOfValuesName.length; k++) {
                                        if (dtBulkEmployee1[l].EmployeeName == arrayOfValuesName[k]) {
                                            debugger;
                                            if (dtBulkEmployee1[l].bitStatus == true) {
                                                messagetxt = "Employee " + dtBulkEmployee1[l].EmployeeName + " already Exist with ID " + dtBulkEmployee1[l].intClientId;
                                                $('td', row).css('background-color', 'Yellow');
                                                $('td', row).css('color', 'Black');
                                                // $('.clientIdsDelete', row).attr('disabled', 'true');
                                                // $('td', row).remove();
                                            }
                                        }
                                        
                                    }
                                }
                                $('.labeltxt').text(messagetxt);
                            }
                        });
                    }
                    reader.readAsText($("#xmlfile")[0].files[0]);
                }
                else {
                    alert("Sorry! Your browser does not support HTML5!");
                }
            }
            else {
                alert("Please upload a valid XML file!");
            }
        });


        $('#btnDownload').click(function () {
            debugger;
            var filePath = "../UploadImage/XMlFile/xmlfile.xml";
            var link = document.createElement('a');
            link.href = filePath;
            link.download = "TestXml.xml";
            link.click();
        });

        $('#btnSavedoc').click(function () {
            debugger;
            var tableControl = document.getElementById('tblBulkEmployee');
            var i = 0;
            var arrayOfValues = [];
            var arrayOfValues1 = [];
            var clsTestempl = {};

            $('input:checkbox:checked', tableControl).each(function () {
                clsTestempl = {
                    intEmployeeID: $(this).parents('tr').find('td:eq(4)').text().trim(),
                    bitStatus: true
                }
                if (clsTestempl.intEmployeeID != "") {
                    arrayOfValues1.push(clsTestempl);
                }
            }).get();

            $.ajax({
                url: "BulkEmployee.aspx/UpdateFrmDetails",
                type: "POST",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'Testemployee':" + JSON.stringify(arrayOfValues1) + "}",
                success: function (data) {
                    debugger;
                    AlertMailFromInternalUser(ClientId);
                    alert('Saved Successfully');
                    window.location.reload('BulkEmployee.aspx');
                },
                error: function (data) {

                }
            })

        });

        //$('#btnSavedoc').click(function () {
        //    debugger;
        //    var tableControl = document.getElementById('tblBulkEmployee');
        //    var i = 0;
        //    var arrayOfValues = [];
        //    var arrayOfValues1 = [];
        //    var clsTestempl = {};
        //    $('input:checkbox:checked', tableControl).each(function () {
        //        clsTestempl = {
        //            FirstName: $(this).parents('tr').find('td:eq(1)').text().trim(),
        //            LastName: $(this).parents('tr').find('td:eq(2)').text().trim(),
        //            Job: $(this).parents('tr').find('td:eq(3)').text().trim(),
        //            City: $(this).parents('tr').find('td:eq(4)').text().trim(),
        //            State: $(this).parents('tr').find('td:eq(5)').text().trim(),
        //        }
        //        arrayOfValues1.push(clsTestempl);
        //    }).get();

        //    $.ajax({
        //        url: "BulkEmployee.aspx/SaveFrmDetails",
        //        type: "POST",
        //        datatype: "json",
        //        contentType: "application/json; charset=utf-8",
        //        cache: false,
        //        async: false,
        //        data: "{'Testemployee':" + JSON.stringify(arrayOfValues1) + "}",
        //        success: function (data) {
        //            AlertMailFromInternalUser(ClientId);
        //            alert('Saved Successfully');
        //        },
        //        error: function (data) {

        //        }
        //    })

        //});

        function AlertMailFromInternalUser(ClientId) {
            debugger;
            $.ajax({
                url: "BulkEmployee.aspx/AlertMailFromInternalUser?id=" + ClientId,
                type: "POST",
                datatype: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                async: false,
                data: "{'ClientId':'" + ClientId + "'}",
                success: function (data) {
                },
                error: function (data) {

                }
            })
        }
    </script>
</asp:Content>




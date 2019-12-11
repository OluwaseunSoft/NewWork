<%@ Page Language="C#" AutoEventWireup="true" CodeFile="batch_update.aspx.cs" Inherits="code_batch_update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>  
    <asp:FileUpload ID="FileUpload4" runat="server" AllowMultiple="false" />

    <asp:Button Text="Upload" OnClick="Batch_Update" runat="server" />
        <asp:Label ID="Label4" runat="server" Visible="false" Text="Notification" ></asp:Label>
         <div id="mappingBG" runat="server" class="" style="position:fixed;z-index:9999;width:100%;height:100%; background-color:rgba(0, 0, 0, 0.86);"></div>
    <div id="headerMapping" runat="server" class="container" style="position:absolute; left:10vh;/*top:10vh;*/z-index:99999;font-family: 'Quicksand', sans-serif;">
      
    
        <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12" style="padding:5px 25px 5px 25px; color:red; background-color:white;font-weight:bold;">
                       <p><span class="fa fa-info-circle"></span> You have columns on your Data file that has not been mapped to the standard CDT (Common Data Template) Format. Please Map carefully and accordingly.</p>
                            <div style="padding:5px 25px 5px 25px; color:black; text-align:center; background-color:white;font-weight:bold;"><span id="btn_clearpreviouslymapped" Class="btn btn-primary">Click to clear Previously Mapped Headers</span></div>
                            <p id="section_sure" style="padding:5px 25px 5px 25px; color:black; text-align:center; background-color:white;font-weight:bold;" class="hide">Are you sure you want to clear your previously Mapped Headers? <span id="btn_yes" Class="btn btn-warning btn-sm">Yes</span> <span id="btn_cancel" Class="btn btn-info btn-sm">Cancel</span></p>
                            <p style="padding:5px 25px 5px 25px; color:black; text-align:center; background-color:white;">
                                <asp:Label ID="lbl_clearmsg" runat="server"></asp:Label></p>
                        </div>
                    </div><br />
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12" style="color:orangered; text-align:center;">               
                <p><asp:RadioButton ID="rb_mapCon" runat="server" GroupName="TemplateType" Text="Map Consumer File"  AutoPostBack="true" />  &nbsp;&nbsp;
                    <asp:RadioButton ID="rb_mapCom" runat="server" GroupName="TemplateType" Text="Map Commercial" AutoPostBack="true"  />  &nbsp;&nbsp;
                    <asp:RadioButton ID="rb_mapCre" runat="server" GroupName="TemplateType" Text="Map Credit" AutoPostBack="true"  />  &nbsp;&nbsp;
                    <asp:RadioButton ID="rb_mapDir" runat="server" GroupName="TemplateType" Text="Map Principal Officer" AutoPostBack="true"  />  &nbsp;&nbsp;
                    <asp:RadioButton ID="rb_mapGua" runat="server" GroupName="TemplateType" Text="Map Guarantor" AutoPostBack="true" /> 
                </p>
            </div>
        </div><br />
        <div class="row">
             <div class="col-md-2 col-xs-2 col-sm-2">
                
            </div>
            <div class="col-md-4 col-xs-3 col-sm-3">
                <asp:ListBox ID="lbx_DataFileHeader" runat="server" CssClass="form-control" Height="550">                   
                </asp:ListBox>
            </div>
            <div class="col-md-1 col-xs-1 col-sm-1">
                <span id="btn_reversemap" style="font-size:6vh; color:whitesmoke;position:absolute;top:110px;" class="btn"><span class="fa fa-arrow-circle-o-left"></span></span>
                <span id="btn_map" style="font-size:8vh; color:orangered;position:absolute;top:200px;" class="btn"><span class="fa fa-arrow-circle-o-right"></span></span>
            </div>
            <div class="col-md-4 col-xs-3 col-sm-3">
                <asp:ListBox ID="lbx_CDTFileHeader" runat="server" CssClass="form-control fileheaders" Height="550">                
                </asp:ListBox>
            </div>
            <div class="col-md-1">
                <span class="btn" style="color:orangered; margin-left:10px; z-index:9999999;" id="closebtn"><span style="font-size:7vh;"><span class="fa fa-times-circle"></span></span>[Close]</span>
            </div>
        </div>
        <div class="row padding-top30">
                        <div class="col-xs-12 col-sm-12 col-md-12">
                       
                        </div>
                    </div>
        
    
    </div>
    </div>
    </form>
</body>
</html>

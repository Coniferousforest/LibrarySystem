<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePwd.aspx.cs" Inherits="ChangePwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            font-size:20px;
        }
        .auto-style3 {
            text-align: center;
            width: 546px;
        }
        .auto-style4 {
            text-align: left;
        }
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            text-align: center;
            width: 546px;
            height: 30px;
        }
        .auto-style7 {
            text-align: left;
            height: 30px;
        }
        .auto-style8 {
            text-align: center;
            width: 546px;
            height: 27px;
        }
        .auto-style9 {
            text-align: left;
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="contain">
          <div style="width:100%;min-height:600px;margin-top:30px;">
        <div style="width:1000px; min-height:600px; margin:0 auto;border:solid 1px #0ee848;border-radius:10px">
            <h2 style="margin:10px">修改密码：</h2>
               
            
            
            <table style="width:100%;margin-top:30px" class="auto-style1">
                <tr>
                    <td class="auto-style3">原密码:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">新密码:</td>
                    <td class="auto-style9"><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp; 确认密码：</td>
                    <td class="auto-style7"><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                 <tr>
                    <td class="auto-style5" colspan="2">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="height: 27px" Text="确认修改" />
                     </td>
                </tr>
              
                </table>
            </div>
        </div>
        </div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
         <style type="text/css">
         #editor {
            resize: vertical;
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 21px;
        }
        .auto-style3 {
            height: 21px;
            font-weight: bold;
            font-size: medium;
        }
        .auto-style4 {
            font-weight: bold;
            font-size: medium;
        }
        .auto-style6 {
            float: left;
            width: 490px;
        }
        .auto-style13 {
            height: 27px;
        }
         .auto-style15 {
             font-weight: bold;
             font-size: medium;
             height: 20px;
         }
         .auto-style16 {
             height: 27px;
             font-weight: bold;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="contain" >
        <div style="width:300px;height:50px; margin:0 auto; " >
         <table align="left" cellspacing="3" class="auto-style1">
        <tr>
            <td class="auto-style15">用户名：</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">姓名：</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">性别：</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">电话：</td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:TextBox ID="TextBox4" runat="server" CssClass="auto-style4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                密码：</td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:TextBox ID="TextBox5" runat="server" CssClass="auto-style4"></asp:TextBox>
            </td>
        </tr>
             <tr>
            <td class="auto-style3">级别</td>
        </tr>
        <tr>

            <td>
               
                 <asp:DropDownList ID="DropDownList1" runat="server" style="width:217px;height:24px;">
                     <asp:ListItem Value="2">用户</asp:ListItem>
                    
                 </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">    
                <asp:Button ID="Button2" runat="server" Text="提交" OnClick="Button2_Click" />
            </td>
        </tr>
    </table>
             </div>       
    </div>
       

           
</asp:Content>


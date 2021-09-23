<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="update.aspx.cs" Inherits="Administrator_News_update" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        .auto-style5 {
            font-weight: bold;
            font-size: medium;
            height: 24px;
        }
        .auto-style6 {
            float: left;
            width: 490px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
           <div style="margin:40px;" class="auto-style6">
         <table align="left" cellspacing="3" class="auto-style1">
        <tr>
            <td class="auto-style4">轮播标题：</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">图片：</td>
            <asp:TextBox ID="TextBox2" runat="server" style="visibility: hidden;"></asp:TextBox>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5">    
                <asp:TextBox ID="TextBox6" runat="server"  style="visibility: hidden;" ></asp:TextBox>
                

            </td>
        </tr>
        <tr>
            <td class="auto-style4">  
                <asp:Button ID="Button2" runat="server" Text="提交" OnClick="Button2_Click" />
            </td>
        </tr>
    </table>
               </div>
    &nbsp;
</asp:Content>


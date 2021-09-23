<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="userdetail.aspx.cs" Inherits="Administrator_user_userdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <style type="text/css">
         #editor {
            resize: vertical;
        }
         .outerBar{
	        width:80%;
	        margin:0px auto;
            margin-left:20%;

        }
       .innerBar{
            width:100%;
	        height: 450px; 
            background-color:white;
       }
       .innerBar thead th{
           height:80px;
           text-align:center;
           line-height:80px;


           font-family: "trebuchet MS", sans-serif;
            color: #F76319;
            font-size: 26px;
            font-weight: bold;
            letter-spacing: 1.2pt;
            word-spacing: -2.4pt;
            line-height: 1.2;
       }

       .innerBar tr{
           height:50px;
       }

       .first{
           width:20%;
           height:50px;
           text-align:right;
           font-family: "trebuchet MS", sans-serif;
           font-size: 20px;
           letter-spacing: 1.4pt;
           line-height: 1.2;
       }
       .second{
           height:50px;
           width:80%;
       }
       .sortBtn{
            width:50px;
           height:35px;
           margin-left:10px;

           text-align:center;
       }
       .box{
           background-color:transparent;     
           width:80%;
           height:35px;
           margin-left:10px;

           border:1px solid #ccc;
           border-radius:9px;
           text-indent:10px;
       }
       .subBtn{
           text-align:center;
           height:50px;
           width:70px;
       }
       .btn {
            height:45px;
            width:80px;

           background-color: white; 
             border: 2px solid #f44336;
           color: black;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
            border-radius:15px;

        }

        .btn:hover {
            background-color: #f44336;
            color: white;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="outerBar">
         <table align="left" cellspacing="3" class="innerBar"> 
             <thead>
                <tr>
                    <th colspan="2">
                        用户信息更改
                    </th>
                 </tr>
                
             </thead>
             <tbody>
                <tr>
                    <td class="first">姓名：</td>
                    <td class="second">
                        <asp:TextBox ID="TextBox2" runat="server" class="box"/></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="first">性别：</td>
                     <td class="second">
                        <asp:DropDownList ID="DropDownList2" runat="server" class="sortBtn">
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:DropDownList>
                    </td>
               
                </tr>
                <tr>
                    <td class="first">电话：</td>
                    <td class="second">
                         <asp:TextBox ID="TextBox4" runat="server" class="box"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="first">密码：</td>
                    <td class="second">
                        <asp:TextBox ID="TextBox5" runat="server" class="box"></asp:TextBox>
                    </td>
                
                </tr>
            
           
                <tr>
                    <td class="first">级别：</td>
                    <td class="second">
               
                        <asp:DropDownList ID="DropDownList1" runat="server" class="sortBtn">
                            <asp:ListItem Value="1">管理员</asp:ListItem>
                     	    <asp:ListItem Value="2">用户</asp:ListItem>
                         </asp:DropDownList>
                    </td>
                </tr>
            
                 <tr>
                     <td  rowspan = "2" colspan = "2" class="subBtn">
                 	    <asp:Button ID="Button2" runat="server" Text="提交" class="btn" OnClick="Button2_Click"/>
                     </td>
                 </tr>
            </tbody>
        </table>
</asp:Content>


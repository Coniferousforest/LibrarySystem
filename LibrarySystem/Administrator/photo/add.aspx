<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="add.aspx.cs" Inherits="Administrator_News_news" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
         #editor {
            resize: vertical;
        }
        .outerBar{
	        width:80%;
            height:100%;
	        margin:0px auto;
            margin-left:20%;

        }
       .innerBar{
            width:100%;
	        height:100%;
            background-color:white;
       }
       .innerBar thead th{
           height:100px;
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
           height:80px;
       }

       .first{
           width:35%;
           height:80px;
           text-align:right;
           font-family: "trebuchet MS", sans-serif;
           font-size: 20px;
           letter-spacing: 1.4pt;
           line-height: 1.2;
       }
       .second{
           height:80px;
           width:65%;
       }

       .picBtn{
           margin-left:10px;
           text-align:center;
       }
       
       .box{
           background-color:transparent;     
           width:50%;
           height:40px;
           margin-left:10px;

           border:1px solid #ccc;
           border-radius:9px;
       }
       .subBtn{
           text-align:center;
           height:50px;
           width:70px;
           margin-top:30px;
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
                        	新建轮播图
                    </th>
                 </tr>
                
             </thead>
             <tbody>
                <tr>

                    <td class="first">轮播标题：</td>
                    <td class="second">
                        <asp:TextBox ID="TextBox1" runat="server" class="box"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td class="first">图片：</td>
                    <td class="second">
                        <asp:FileUpload ID="FileUpload1" runat="server" class="picBtn"/>
                    </td>
                </tr>
                
                 <tr >
                     <td colspan = "2" class="subBtn"><asp:Button ID="Button2" runat="server" Text="提交" class="btn"/></td>
                 </tr>
             </tbody>
        </table>
   
		<div style="height: 1px;width: 1px;overflow: hidden;visibility: hidden;">
			<asp:TextBox ID="TextBox6" runat="server"  style="visibility: hidden;" ></asp:TextBox>
            <asp:TextBox ID="TextBox5" runat="server"  style="visibility: hidden;" ></asp:TextBox>
                     
		</div>
    </div>
</asp:Content>


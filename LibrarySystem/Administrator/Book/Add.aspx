<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Administrator_Book_Add"  ValidateRequest="false"%>

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
           width:15%;
           height:50px;
           text-align:right;
           font-family: "trebuchet MS", sans-serif;
           font-size: 20px;
           letter-spacing: 1.4pt;
           line-height: 1.2;
       }
       .second{
           height:50px;
           width:30%;
       }
       .introF{
           width:50%;
           height:50px;
           font-family: "trebuchet MS", sans-serif;
           text-align:center;
           font-size: 20px;
           letter-spacing: 1.4pt;
           line-height: 1.2;
       }
       .introFF{
           width:50%;
           text-align:center;
       }

       .picBtn{
           margin-left:10px;
           height:35px;
           text-align:center;
       }
       .sortBtn{
            width:50px;
           height:35px;
           margin-left:10px;
           text-align:center;
       }
       
       .box{
           background-color:transparent;     
           width:50%;
           height:35px;
           margin-left:10px;

           border:1px solid #ccc;
           border-radius:9px;
       }
       .subBtn{
           text-align:left;
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
                    <th colspan="3">
                        图书上新
                    </th>
                 </tr>
                
             </thead>
             <tbody>
                <tr>

                    <td class="first">书名：</td>
                    <td class="second">
                        <asp:TextBox ID="TextBox1" runat="server" class="box"></asp:TextBox>
                    </td>
                    <td class="introF">简介</td>
                </tr>
                <tr>
                    <td class="first">图片：</td>
                    <td class="second">
                        <asp:FileUpload ID="FileUpload1" runat="server" class="picBtn"/>
                    </td>
                    <td rowspan = "6" class="intorFF">  
                        
                        <div id="editor" >  
                            <p> 请填写简介</p>
                        
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="first">作者：</td>
                     <td class="second">
                        <asp:TextBox ID="TextBox2" runat="server" class="box"></asp:TextBox>
                    </td>
               
                </tr>
                <tr>
                    <td class="first">出版社：</td>
                    <td class="second">
                         <asp:TextBox ID="TextBox5" runat="server" class="box"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="first">价格：</td>
                    <td class="second">
                        <asp:TextBox ID="TextBox3" runat="server" class="box"></asp:TextBox>
                    </td>
                
                </tr>
                <tr>
                    <td class="first">数量：</td>
                     <td class="second">
                        <asp:TextBox ID="TextBox4" runat="server" class="box"></asp:TextBox>
                    </td>
                </tr>
           
                <tr>
                    <td class="first">种类：</td>
                    <td class="second">
               
                        <asp:DropDownList ID="DropDownList1" runat="server" class="sortBtn">
                             <asp:ListItem Value="1">小说</asp:ListItem>
                             <asp:ListItem Value="2">传记</asp:ListItem>
                             <asp:ListItem Value="3">文学</asp:ListItem>
                             <asp:ListItem Value="4">社科</asp:ListItem>
                             <asp:ListItem Value="5">科技</asp:ListItem>
                             <asp:ListItem Value="6">杂志</asp:ListItem>
                         </asp:DropDownList>
                    </td>
                </tr>

                 <tr >
                     <td><asp:TextBox ID="TextBox6" runat="server" style="visibility: hidden;"></asp:TextBox></td>
                     <td colspan = "2" class="subBtn"><asp:Button ID="Button2" runat="server" Text="提交" class="btn" OnClick="Button2_Click"/></td>
                 </tr>
             </tbody>
        </table>
   

    </div>



    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/wangEditor.js"></script>
    <script type="text/javascript">
        /*js*/


        var E = window.wangEditor
        var editor = new E('#editor')
        // 或者 var editor = new E( document.getElementById('editor') )
        editor.create()
        $("#ContentPlaceHolder1_Button2").click(function () {
           
           var a = editor.txt.html();
           $("#ContentPlaceHolder1_TextBox6").val(a);
    });
    </script>

</asp:Content>


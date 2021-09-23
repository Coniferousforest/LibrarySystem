<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="update.aspx.cs" Inherits="Administrator_News_update" ValidateRequest="false"%>

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
           text-align:center;
           font-family: "trebuchet MS", sans-serif;
           font-size: 20px;
           letter-spacing: 1.4pt;
           line-height: 50px;
       }
       .second{
           height:50px;
           width:80%;
          
       }
       .introF{
           width:20%;
           font-family: "trebuchet MS", sans-serif;
           text-align:center;
           font-size: 20px;
           letter-spacing: 1.4pt;
           line-height: 1.2;
       }
       .introFF{
           width:80%;
           text-align:center;
       }

       .box{
           background-color:transparent;     
           width:70%;
           height:35px;
           margin-left:10px;

           border:1px solid #ccc;
           border-radius:9px;
           text-indent:10px;
       }
       .subBtn{
           height:50px;
           width:100%;
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
            margin-left:35%;
             
        }

        .btn:hover {
            background-color: #f44336;
            color: white;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <!--Title = TextBox1.Text,
            Writer = TextBox2.Text,
            Article = TextBox5.Text-->
 <div class="outerBar">
         <table align="left" cellspacing="3" class="innerBar">
             <thead>
                 <tr>
                    <th colspan="2">
                        	修改文章
                    </th>
                 </tr>
                
             </thead>
             <tbody>
                <tr>

                    <td class="first">文章标题</td>
                    <td class="second">
                        <asp:TextBox ID="TextBox1" runat="server" class="box"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td class="first">作者</td>
                    <td class="second">
                        <asp:TextBox ID="TextBox2" runat="server" class="box"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td rowspan="4" class="introF">
                        简介
                    </td>
                    <td class="introFF">  
                        <div id="editor" >  
                            <p> 请填写简介</p>
                        </div>
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

    &nbsp;<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://unpkg.com/wangeditor@3.1.1/release/wangEditor.min.js"></script>
        <script type="text/javascript">
       $(document).ready(function(){ editor.txt.html($("#ContentPlaceHolder1_TextBox6").val());}); 
        /*js*/
        var E = window.wangEditor
        var editor = new E('#editor')
        // 或者 var editor = new E( document.getElementById('editor') )
        editor.create();
       $("#ContentPlaceHolder1_Button2").click(function () {
           var a = editor.txt.html();
           $("#ContentPlaceHolder1_TextBox5").val(a);

    });
    </script>
</asp:Content>


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=GB-2312"/>
    <title>登录</title>
   <script type="text/javascript">document.write('<link rel="stylesheet" type="text/css" href="css/style.css?timestamp='+new Date().getTime()+'" >');</script>
	<script type="text/javascript">document.write('<link rel="stylesheet" type="text/css" href="css/login.css?timestamp=' + new Date().getTime() + '" >');</script>
    <style type="text/css">
        .auto-style1{
			font-family: "trebuchet MS", sans-serif;
			font-size: 1.5em;
			font-weight: bold;
			text-transform: uppercase;
			word-spacing: 0pt;
			color:white;
        }
		.input{
			height:50px;
			background-color:transparent;
			color:white;
			border:none;
			border-bottom: 1px solid black;
			font-size:14px;
		}
		.login{
			height:50px;
			background-color:transparent;
			width:80px;
			color:white;
			font-size:20px;
			border:1px solid white;
			margin-top:30px;
		}
		.login:hover{
			background-color:rgba(255,255,255,.5);
		}
		.top{
			display:block;
			border:none;
			height:40px;
			background-color:transparent;
			width:60px;
			color:white;
			font-size:16px;
			margin-top:30px;
			position:relative;
			left:300px;
			transition:2s;
		}
		.top:hover{
			transform:scale(1.1);
		}
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <img class="backImg" src="img/11.jpg"/>
	<div class="main">
		<div style="height: 150px;"></div>

		<div class="title">
			<h1 ><span style="color:#FFFFFF">登录图书馆综合管理系统</span></h1>
		</div>
		<div class="content">
            
			<table class="menu" >
				<tr style="height: 50px;">
					<td class="auto-style1">
						用户名：
					</td>
					<td>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="input"></asp:TextBox>
					</td>
				</tr>
					
				<tr style="height: 50px;">
					<td class="auto-style1">
						密码：
					</td>
					<td>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="input"></asp:TextBox>	
					</td>
				</tr>
				
				<tr style="height: 50px;">
					<td class="auto-style1">
						验证码：
					</td>
					<td>
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="input"></asp:TextBox>	
					</td>
					<td>
						<img src="ValidateCode.aspx" id="img" onclick="f_refreshtype()" width="80px"/>
					</td>
                  
				</tr>
			</table>
             <asp:Button ID="Button1" runat="server" Text="登录" OnClick="Button1_Click" CssClass="login"></asp:Button>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="top">首页</asp:LinkButton>
		</div>
	</div>
    </form>
</body>
</html>

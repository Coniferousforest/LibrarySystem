<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="bookdetail.aspx.cs" Inherits="bookdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
	<script type="text/javascript">document.write('<link rel="stylesheet" type="text/css" href="css/book.css?timestamp='+new Date().getTime()+'" >');</script>
    <style type="text/css">
        .auto-style1 {
            font-size: medium;
            color: #808080;
            letter-spacing: 5px;
        }
        .auto-style2 {
            width: 442px;
        }
        .auto-style3 {
            font-size: medium;
            color: #808080;
            font-weight: bold;
        }
        .auto-style4 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<div class="detail_contain clearfix">
		
		<div class="introduce-top">
			<div id=top1>
				图书简介
			</div>
			<div class="bookIntroLine"></div>
		</div>

		<div class="zhuTi clearfix">

			<div class="left">
				<div class="bookpicture" style="overflow:hidden">
					<img src="img/bookimg/<%=BindBook("pictureUrl")%>" style="overflow:hidden">
				</div>
			</div>

			<div class="middle">
				<div class="textcontent">
					<table class="auto-style2" >
						<tr>
							<td class="auto-style3">
								<p class="auto-style4">
								书名：<%=BindBook("Name")%>
						 
								</p>
							</td>
						</tr>
						<tr>
							<td class="auto-style3">
								<p class="auto-style4">
								作者：<%=BindBook("Writer")%>
								</p>
							</td>
						</tr>
						<tr>
							<td class="auto-style3">
								<p class="auto-style4">
								库存：<%=BindBook("Count")%>
						 
								</p>
							</td>
						</tr>
						<tr>
							<td class="auto-style3">
								<p class="auto-style4">
								借阅：<%=BindBook("Sales")%>
						 
								</p>
							</td>
						</tr>
						<tr>
							<td class="auto-style3">
								<p class="auto-style4">
								上新时间：<%=BindBook("Time")%>
						 
								</p>
							</td>
						</tr>
						<tr>
							<td class="auto-style3">
								<asp:button runat="server" text="借阅" OnClick="Unnamed1_Click" class="submitiBtn"/>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="right">
				<!-- 书的主体 -->
				<div class="book preserve-3d">
					<!-- 书的最后一页 -->
					<div class="book-page-box book-page-4 preserve-3d">
						<div class="book-page page-front">
							<p>到头了呀</p>
						</div>
					</div>
					<!-- 书的第三页 -->
					<div class="book-page-box book-page-3 preserve-3d flip-animation-3">
						<div class="book-page page-front">
							<p>看看我吧</p>
						</div>
					</div>
					<!-- 书的第二页 -->
					<div class="book-page-box book-page-2 preserve-3d flip-animation-2">
						<div class="book-page page-front">
							<p>点个借阅吧</p>
						</div>
					</div>
					<!-- 书的封面 -->
					<div class="book-page-box book-page-1 preserve-3d flip-animation-1">
						<div class="book-page page-front">
							<p>
								你好哇
								<br />
								我是
								<br />
								<%=BindBook("Name")%>
								<br>
								
							</p>
						</div>
					</div>
				</div>

			</div>
		
			<div class=" introduce-contain">
				<div><%=BindBook("Introduce")%></div>
			</div>
			
		</div>
			
		



		
			
	</div>
</asp:Content>


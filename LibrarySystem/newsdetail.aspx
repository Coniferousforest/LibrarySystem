<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="newsdetail.aspx.cs" Inherits="newsdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
       <script type="text/javascript">document.write('<link rel="stylesheet" type="text/css" href="fa/css/all.css?timestamp=' + new Date().getTime() + '" >');</script>
	<script type="text/javascript">document.write('<link rel="stylesheet" type="text/css" href="css/news.css?timestamp='+new Date().getTime()+'" >');</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    		<div class="contain">
			<div style="height: 50px;"></div>
			<div class="newsdetail">
				<div class="title"><%=BindNews("Title") %></div>
				<div style="height: 20px;"></div>
				<div class="othertitle">
					<div class="writer">
						作者：<%=BindNews("Writer") %>
					</div>
					<div class="date">
						日期：<%=BindNews("Time") %>
					</div>  
				</div>
				<div class="news-content">
					<%=BindNews("Article") %>
				</div>
				<div class="news-foot">
					获赞：<%=BindNews("Loves") %>
					<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">
						<i class="fas fa-thumbs-up thumbIcon"></i>

					</asp:LinkButton>
				</div>
			</div>
			
		</div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyInfo.aspx.cs" Inherits="MyInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
	<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript">document.write('<link rel="stylesheet" type="text/css" href="css/MyInfo.css?timestamp=' + new Date().getTime() + '" >');</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="topBar_My">


        <ul class="nav">
			<li class="selected">我的信息</li>
			<li>借阅情况</li>
			<li>修改密码</li>
		</ul>
		<div class="content clearfix">									
		    <div class="list listMy">
			    <div class="MyInfoTop">我的信息</div>
			    <table class="MyInfoInner">
					<tr >
						<td class="titleFF"></td>
					    <td class="titleF">学号:</td>
					    <td class="titleN"><%=GetUserInfo("Username") %></td>
						<td class="titleFF"></td>
					</tr>
					<tr>
						<td class="titleFF"></td>
					    <td class="titleF">姓名:</td>
						<td class="titleN"><%=GetUserInfo("Name") %></td>
						<td class="titleFF"></td>
					</tr>
					<tr>
						  <td class="titleFF"></td>
					      <td class="titleF">性别:</td>
					      <td class="titleN"><%=GetUserInfo("Sex") %></td>
						<td class="titleFF"></td>
					</tr>
					<tr>
						<td class="titleFF"></td>
					      <td class="titleF">电话:</td>
					      <td class="titleN"><%=GetUserInfo("Phone") %></td>
						<td class="titleFF"></td>
					</tr>	               
				</table>
			</div>
			<!-- CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" AutoGenerateColumns="False"-->
								<!--<AlternatingRowStyle BackColor="White" />-->
			<!--<EditRowStyle BackColor="#7C6F57" />
								<FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
								<HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
								<PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
								<RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" />
								<SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
								<SortedAscendingCellStyle BackColor="#F8FAFA" />
								<SortedAscendingHeaderStyle BackColor="#246B61" />
								<SortedDescendingCellStyle BackColor="#D4DFE1" />
								<SortedDescendingHeaderStyle BackColor="#15524A" />-->
			<div class="list listBook">

				  <asp:GridView ID="GridView1" runat="server" GridLines="None" AutoGenerateColumns="False" CssClass="booksState">
						<AlternatingRowStyle BackColor="White" />		
					  <Columns>
									<asp:BoundField DataField="Name" HeaderText="姓名" />
									<asp:BoundField DataField="BookName" HeaderText="书名" />
									<asp:BoundField DataField="Date" HeaderText="借书日期" />
									<asp:BoundField DataField="ReturnTime" HeaderText="应还日期" />
									<asp:BoundField DataField="Status" HeaderText="状态" />
								</Columns>
								 <RowStyle  CssClass ="GridViewRowStyle"/>    
								 <HeaderStyle  CssClass ="GridViewHeaderStyle"/> 
				</asp:GridView>

			            	 
			</div>
			<div class="list listPsw">

				<table class="pswTop">
					<thead class="pswHead">
						<tr>
							<th scope="col"colspan="2">修改密码</th>
						</tr>
					</thead>
					<tbody class="pswBody">

						<tr>
							<td class="pswLeft">原密码</td>
						<td class="pswR"><asp:TextBox ID="TextBox1" runat="server" class="pswRight"></asp:TextBox></td>
						</tr>
					
						<tr>
							<td class="pswLeft">新密码</td>
							<td class="pswR"><asp:TextBox ID="TextBox2" runat="server" class="pswRight"></asp:TextBox></td>
							</tr>
					
						<tr>
							<td class="pswLeft">确认密码</td>
							<td class="pswR">
								<asp:TextBox ID="TextBox3" runat="server" class="pswRight"></asp:TextBox>
								<asp:Label ID="Label1" runat="server"></asp:Label>
							</td>
						</tr>

						<tr>
							<td colspan="2" class="pswBtnTop">
								<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" class="pswBtn" Text="确认修改" />
							</td>
						</tr>
					</tbody>
					
				</table>
			</div>
		</div>           
	</div>

    <script>
		$(function () {
			var divShow = $(".content").children('.list');
            $(divShow[0]).siblings('.list').hide();
			$(".nav li").click(function(){
				//获取要显示或隐藏的对象
				var divShow = $(".content").children('.list');
				//判断当前对象是否被选中，如果没选中的话进入if循环
				if (!$(this).hasClass('selected')) {
					//获取当前对象的索引
					var index = $(this).index();
					//当前对象添加选中样式并且其同胞移除选中样式；
					$(this).addClass('selected').siblings('li').removeClass('selected');
					//索引对应的div块显示
					$(divShow[index]).show();
					//索引对应的div块的同胞隐藏
					$(divShow[index]).siblings('.list').hide();
				}
			});
		});							
    </script>
</asp:Content>


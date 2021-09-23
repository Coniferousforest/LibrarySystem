<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   
	<script type="text/javascript">document.write('<link rel="stylesheet" type="text/css" href="css/news.css?timestamp='+new Date().getTime()+'" >');</script>
	<script type="text/javascript">document.write('<link rel="stylesheet" type="text/css" href="fa/css/all.css?timestamp=' + new Date().getTime() + '" >');</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="contain">

		<div class="news">

			<div class="introduce-top">
				<div id=top1>
					新闻动态
				</div>
				<div class="bookIntroLine"></div>
			</div>
			

			<table class="table table-hover">
			  <thead class="table_head">
				<tr>
				  <th scope="col" class="th_fir">#</th>
				  <th scope="col">新闻标题</th>
				  <th scope="col">发表时间</th>
				  <th scope="col">阅读</th>
				</tr>
			  </thead>
			  <tbody>
				  <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow">
                    <ItemTemplate>
		  				<tr class="news-item">
			  				<th scope="row">
			  					<i class="fas fa-sms Icont"></i>
			  				</th>
		      				<td class="news-title"><%# DataBinder.Eval(Container.DataItem, "title") %></td>
		      				<td class="news-date"><%# DataBinder.Eval(Container.DataItem, "time","{0:yyyy/MM/dd}") %></td>
		      				<td class="read">
								  阅读
		      					<a href="newsdetail.aspx?Id=<%# DataBinder.Eval(Container.DataItem, "ID") %>">
									  <i class="fab fa-readme Icont2"></i>
								</a> 
		      				</td>
						</tr>
				   </ItemTemplate>
                </asp:DataList>
			  </tbody>
			</table>

                
                   
			
				  <div class="page">
                共【<asp:Label ID="lblSumPage" runat="server" class="totalPage"></asp:Label>】页 
                        当前第【<asp:Label ID="lblCurrentPage" runat="server" class="totalPage"></asp:Label>】页
                        <asp:HyperLink ID="hyfirst" runat="server" class="perPage">首页</asp:HyperLink>
						<asp:HyperLink ID="lnkPrev" runat="server" class="perPage">上一页</asp:HyperLink>
               
                        <asp:HyperLink ID="lnkNext" runat="server" class="perPage">下一页</asp:HyperLink>
               
                        <asp:HyperLink ID="hylastpage" runat="server" class="perPage">尾页</asp:HyperLink>
            </div>
			</div>
		</div>
	</div>
</asp:Content>


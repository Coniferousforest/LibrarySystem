<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="book.aspx.cs" Inherits="book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    	<script type="text/javascript">document.write('<link rel="stylesheet" type="text/css" href="css/book.css?timestamp='+new Date().getTime()+'" >');</script>
        <script type="text/javascript">document.write('<link rel="stylesheet" type="text/css" href="fa/css/all.css?timestamp=' + new Date().getTime() + '" >');</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="contain">
        <div class="menu">
            
            <div class="serchBar clearfix">
                <div class="menuSerch">
                   <asp:TextBox ID="TextBox1" runat="server" class="serchText fas fa-search"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="搜索" OnClick="Button1_Click" class="serchBtn"/>
                </div>   
            </div>
            
            <div class="menuVary clearfix">
                <div class="totalText varyText">
                    <div class="serT">种类 <i class="fas fa-angle-double-right IcontT"></i></div>
                    
                </div>

                 <div class="varyBtns">
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" class="varyBtn bf">小说</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" class="varyBtn">传记</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" class="varyBtn">文学</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" class="varyBtn">社科</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click" class="varyBtn">科技</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton6" runat="server" OnClick="LinkButton6_Click" class="varyBtn sf">杂志</asp:LinkButton>
                 </div>

                <div class="totalText sortText">
                    <div class="serT">排序 <i class="fas fa-angle-double-right IcontT"></i></div>
                    
                </div>
 
                <div class="sortBtns">           
                    <%--<asp:LinkButton ID="LinkButton9" runat="server" CssClass="auto-style1" OnClick="LinkButton9_Click">按价格降序</asp:LinkButton>--%>
                    <asp:LinkButton ID="LinkButton7" runat="server" OnClick="LinkButton7_Click" class="varyBtn bf">上新时间</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton8" runat="server" OnClick="LinkButton8_Click" class="varyBtn">借阅量</asp:LinkButton>
                </div>
             </div>

            
        </div>


        <div class="bookTop">
            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                <ItemTemplate>

                    <div class="bookSample">

		                <div class="imgTop_Bar">
		                    <img src='img/bookimg/<%# DataBinder.Eval(Container.DataItem, "pictureUrl")%>'> </a>  
		                 </div>
		                        
		                 <div class="textTop_Bar">
		                    <h3 class="book_title"><%# DataBinder.Eval(Container.DataItem, "name") %></h3><br />

		                    <div class="textDetail">
		            	        <span class="sec">作者:<%# DataBinder.Eval(Container.DataItem, "writer") %></span><br />
			                    <span class="sec">借阅:<%# DataBinder.Eval(Container.DataItem, "sales") %></span><br />
			                    <span class="sec">库存:<%# DataBinder.Eval(Container.DataItem, "count") %></span><br />
			                    <span class="sec">上架时间:<%# DataBinder.Eval(Container.DataItem, "time") %></span><br />
		                    </div>

		                    <a href="bookdetail.aspx?bookId=<%# DataBinder.Eval(Container.DataItem, "ID") %>" class="detailBtn">
                                <span>详情</span>

		                    </a>     
		                </div>   
	                </div>     
                </ItemTemplate>
            </asp:DataList>
<!--

     
-->
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

</asp:Content>


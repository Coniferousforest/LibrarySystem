<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="newsdetail.aspx.cs" Inherits="Administrator_News_newsdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
          <style type="text/css">
         #editor {
            resize: vertical;
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 21px;
        }
        .auto-style3 {
            height: 21px;
            font-weight: bold;
            font-size: medium;
        }
        .auto-style4 {
            font-weight: bold;
            font-size: medium;
        }
        .auto-style5 {
            font-weight: bold;
            font-size: medium;
            height: 24px;
        }
        .auto-style6 {
            float: left;
            width: 490px;
        }
        .auto-style7 {
        height: 31px;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <div style="margin:40px">
          <asp:GridView  ID="GridView1" runat="server" AllowPaging="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="False" HorizontalAlign="Center" Width="950px" OnRowCommand="GridView1_RowCommand">
              <AlternatingRowStyle BackColor="White" />
              <Columns>

                  <asp:BoundField DataField="Id" HeaderText="编号" />

                  <asp:BoundField DataField="title" HeaderText="标题">
                  <ItemStyle Width="50px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="article" HeaderText="内容" HtmlEncode="False"/>
                  <asp:BoundField DataField="writer" HeaderText="读者" />
                    <asp:TemplateField >
                      <ItemStyle Width="50px" />
                        <ItemTemplate>  
                      <a href='update.aspx?Id=<%#Eval("ID")%>'>修改</a>
                  </ItemTemplate>  
                  <ItemStyle HorizontalAlign="Center" />
                  </asp:TemplateField>
                  <asp:ButtonField CommandName="del" Text="删除" />
              </Columns>
                  <FooterStyle BackColor="#CCCC99" />
              <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                  <PagerTemplate>
                当前第:
                <%--((GridView)Container.NamingContainer)就是为了得到当前的控件--%>
                <asp:Label ID="LabelCurrentPage" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"></asp:Label>
                页/共:
                <%--//得到分页页面的总数--%>
                <asp:Label ID="LabelPageCount" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageCount %>"></asp:Label>
                页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <%--//如果该分页是首分页，那么该连接就不会显示了.同时对应了自带识别的命令参数CommandArgument--%>
                <asp:LinkButton ID="LinkButtonFirstPage"  ForeColor="black" Font-Underline="false" runat="server" CommandArgument="First" CommandName="Page"
                    Enabled='<%#((GridView)Container.NamingContainer).PageIndex != 0 %>'>首页</asp:LinkButton>
                <asp:LinkButton ID="LinkButtonPreviousPage"  ForeColor="black"  Font-Underline="false" runat="server" CommandArgument="Prev"
                    CommandName="Page" Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>'>上一页</asp:LinkButton>
               <%--//如果该分页是尾页，那么该连接就不会显示了--%>
                <asp:LinkButton ID="LinkButtonNextPage"  ForeColor="black" Font-Underline="false" runat="server" CommandArgument="Next" CommandName="Page"
                    Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>下一页</asp:LinkButton>
                <asp:LinkButton ID="LinkButtonLastPage"  ForeColor="black" Font-Underline="false" runat="server" CommandArgument="Last" CommandName="Page"
                    Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>尾页</asp:LinkButton>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;转到第
                <asp:TextBox ID="txtNewPageIndex" runat="server" Width="20px" Text='<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>'/>页
                <%--//这里将CommandArgument即使点击该按钮e.newIndex 值为3--%>
                <asp:LinkButton ID="btnGo"  ForeColor="black" runat="server" CausesValidation="False" CommandArgument="-2"
                    CommandName="Page" Text="GO"/>
            </PagerTemplate>
              <RowStyle BackColor="#F7F7DE" HorizontalAlign="Center" />
              <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#FBFBF2" />
              <SortedAscendingHeaderStyle BackColor="#848384" />
              <SortedDescendingCellStyle BackColor="#EAEAD3" />
              <SortedDescendingHeaderStyle BackColor="#575357" />
           </asp:GridView>
    </div>
  
</asp:Content>


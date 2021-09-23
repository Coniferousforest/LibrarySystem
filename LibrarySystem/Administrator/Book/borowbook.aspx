<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="borowbook.aspx.cs" Inherits="Administrator_Book_borowbook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            margin-top: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div style="margin:40px;" >  
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
             <asp:ListItem>全部</asp:ListItem>
             <asp:ListItem Value="1">未归还</asp:ListItem>
             <asp:ListItem Value="0">已归还</asp:ListItem>
         </asp:DropDownList>
         学号:<asp:TextBox ID="TextBox1" runat="server" Height="23px" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True"></asp:TextBox>
        书名:<asp:TextBox ID="TextBox2" runat="server" Height="23px" OnTextChanged="TextBox2_TextChanged" AutoPostBack="True"></asp:TextBox>
         <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" Width="950px" AutoGenerateColumns="False" CssClass="auto-style1" OnRowCommand="GridView1_RowCommand" HorizontalAlign="Center">
             <AlternatingRowStyle BackColor="White" />
             <Columns>
               

                  <asp:BoundField DataField="Id" HeaderText="借书编号" >
                  <ItemStyle HorizontalAlign="Center" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Name" HeaderText="借书人" >
                  <ItemStyle HorizontalAlign="Center" />
                  </asp:BoundField>
                  <asp:BoundField DataField="BookName" HeaderText="书名" >
                  <ItemStyle HorizontalAlign="Center" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Date" HeaderText="借书时间" >
                  <ItemStyle HorizontalAlign="Center" />
                  </asp:BoundField>
                  <asp:BoundField DataField="ReturnTime" HeaderText="应还时间" />
                  <asp:BoundField DataField="UserId" HeaderText="学号" >
                 <ItemStyle HorizontalAlign="Center" />
                  </asp:BoundField>
                  <asp:BoundField DataField="bookId" HeaderText="图书编号" />
                  <asp:BoundField DataField="Status" HeaderText="是否归还" />
                  <asp:ButtonField CommandName="huanshu" Text="归还" >
                  <ItemStyle HorizontalAlign="Center" />
                  </asp:ButtonField>
             </Columns>
             <FooterStyle BackColor="#CCCC99" />
             <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
             <RowStyle BackColor="#F7F7DE" />
             <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#FBFBF2" />
             <SortedAscendingHeaderStyle BackColor="#848384" />
             <SortedDescendingCellStyle BackColor="#EAEAD3" />
             <SortedDescendingHeaderStyle BackColor="#575357" />
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
         </asp:GridView>
    </div>
  
</asp:Content>


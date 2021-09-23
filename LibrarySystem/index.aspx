<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="slide" id="container">
        <div id="photo">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                     <img src="<%# DataBinder.Eval(Container.DataItem, "path") %>" />
                 </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <div class="contain">

        <div class="entance">

            <a href="book.aspx"> 
                <div class="entance-item">
                    <div class="entance-item-content">
                        <br />
                        <embed  class="img_three" src="img/39.png"/>
                        <p>精品图书</p>
                    </div>
                </div>
            </a>

            <a href="MyInfo.aspx">
                <div class="entance-item">
                    <div class="entance-item-content">
                        <br />
                        <embed class="img_three" src="img/391.png"/>
                        <p>我的</p>
                    </div>
                </div>
            </a>

        </div>



        <div class="bookContent">
            <div class="moduleTitle">
                <h2>新书上架</h2>
                 <div class="line"></div>
            </div>

            <div id="contain">
                <asp:DataList ID="DataList2" runat="server" RepeatDirection="Horizontal">
                    <ItemTemplate>

                        <div class="bookItem">
                            <div class="bookInfo">
                                <span class="bookName"><%# DataBinder.Eval(Container.DataItem, "name") %></span><br />
                                <div class="nameLine"></div>
                            </div>
                            <div class="imgContent">
                                <img src="img/bookImg/<%# DataBinder.Eval(Container.DataItem, "pictureUrl") %>">
                            </div>

                            <div class="textContent">
                                
                                <span class="textBook">作者:<%# DataBinder.Eval(Container.DataItem, "writer") %></span><br />
                                <span class="textBook">借阅量:<%# DataBinder.Eval(Container.DataItem, "sales") %></span><br />
                                <span class="textBook">库存:<%# DataBinder.Eval(Container.DataItem, "count") %></span><br />
                                <span class="textBook">上架时间:<%# DataBinder.Eval(Container.DataItem, "time","{0:yyyy/MM/dd}") %></span><br />
                                <div class="bookTouch">
                                    <a href="bookdetail.aspx?bookId=<%# DataBinder.Eval(Container.DataItem, "Id") %>" class="bookA">详情</a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>

        </div>
        <div class="bookContent">
            <div class="moduleTitle">
                <h2>最热图书</h2>
                <div class="line"></div>
            </div>
            <div id="contain2">
                <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="bookItem">

                            <div class="bookInfo">
                                <span class="bookName"><%# DataBinder.Eval(Container.DataItem, "name") %></span><br />
                                <div class="nameLine"></div>
                            </div>

                            <div class="imgContent">
                                 <img src="img/bookImg/<%# DataBinder.Eval(Container.DataItem, "pictureUrl") %>">
                            </div>

                            <div class="textContent">
                                <span class="textBook">作者:<%# DataBinder.Eval(Container.DataItem, "writer") %></span></br>
                                <span class="textBook">借阅量:<%# DataBinder.Eval(Container.DataItem, "sales") %></span></br>
                                <span class="textBook">库存:<%# DataBinder.Eval(Container.DataItem, "count") %></span></br>
                                <span class="textBook">上架时间:<%# DataBinder.Eval(Container.DataItem, "time") %></span></br>
                                <div class="bookTouch">
                                    <a href="bookdetail.aspx?bookId=<%# DataBinder.Eval(Container.DataItem, "Id") %>" class="bookA">详情</a>
                                </div>
                            </div>
                         </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
  </div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <link rel="stylesheet" href="css/chooseseat.css">
        <script type="text/javascript">document.write('<link rel="stylesheet" type="text/css" href="css/about.css?timestamp='+new Date().getTime()+'" >');</script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="outerBar">
        <div class="innerBar">

             <div class="aboutTitle"> 
                    欢迎使用幼儿图书管理系统
             </div>

            <div class="aboutSub">
                作者：XXX;
                制作于：2021-8
            </div>

            <div class="textInner">
                随着互联网+时代的到来，越来越多的传统产业需要与互联网融合进行产业升级，比如传统的图书馆采用了在馆内放置借阅机的模式对图书进行管理，显然是严重低效陈旧的。因此需要运用互联网技术基于B/S的设计模式，让用户随时随地可以对图书馆馆内的书籍进行借阅和查看，并且还可以让用户随时随地的查看图书公告，在线选座等。在系统开发上进行了可行性分析、需求分析、详细设计、代码编写、软件测试等步骤、保证了系统的稳定。在技术方面，该项目采用了ASP.NET技术构建了一套读者和管理员共同使用的系统，大大的提升了用户的使用体验。在前端技术方面，本系统采用了HTML、JS、CSS、JQuery技术和Bootstrap技术，后端上采用了ASP.NET框架使用C#与ADO.NET结合构建了一个稳固美观的系统。
            </div>
        </div>
    </div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <div>
        <input type="button" onclick="JsCallCSharp('lalal')" />
    </div>

    <script>
        function JsCallCSharp(param1) {
            PageMethods.sayhell(param1,onSayHelloSucceeded);
        }
        function onSayHelloSucceeded(result)//绑定的回调函数 
        { 
            alert(result);
        } 
    </script>


</asp:Content>


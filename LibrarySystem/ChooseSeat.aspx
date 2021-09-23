<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChooseSeat.aspx.cs" Inherits="ChooseSeat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <link rel="stylesheet" href="css/chooseseat.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin:50px;height:5px;width:1200px;">

    </div>
    <div class="container">
		<div class="row"><!-- 第一行 -->
            <%int j = 0; %>
        <%for (int i = 0; i < 5; i++) %>
        <%{%>
            <!-- 一桌 -->
			<div class="desk">
				<div class="FirRow">
					<img src="./img/SeatOFF.jpg" id="<%=j %>" alt="<%=BindSeat(j++) %>" width="40" height="auto">
					<img src="./img/SeatOFF.jpg" id="<%=j %>" alt="<%=BindSeat(j++) %>" width="40" height="auto">
				</div>
				<div class="SecRow">
					<img src="./img/desk.png" alt="桌子" width="85" height="auto">
				</div>
				<div class="ThiRow">
					<img src="./img/SeatOFF.jpg" id="<%=j %>" alt="<%=BindSeat(j++) %>" width="40" height="auto">
					<img src="./img/SeatOFF.jpg" id="<%=j %>" alt="<%=BindSeat(j++) %>" width="40" height="auto">
				</div>
			</div>
         <%} %>
		</div>
        <div class="row"><!-- 第二行 -->
        <%for (int i = 0; i < 5; i++) %>
        <%{%>
            <!-- 一桌 -->
			<div class="desk">
				<div class="FirRow">
					<img src="./img/SeatOFF.jpg" id="<%=j %>" alt="<%=BindSeat(j++) %>" width="40" height="auto">
					<img src="./img/SeatOFF.jpg" id="<%=j %>" alt="<%=BindSeat(j++) %>" width="40" height="auto">
				</div>
				<div class="SecRow">
					<img src="./img/desk.png" alt="桌子" width="85" height="auto">
				</div>
				<div class="ThiRow">
					<img src="./img/SeatOFF.jpg" id="<%=j %>" alt="<%=BindSeat(j++) %>" width="40" height="auto">
					<img src="./img/SeatOFF.jpg" id="<%=j %>" alt="<%=BindSeat(j++) %>" width="40" height="auto">
				</div>
			</div>
         <%} %>
		</div>
		<div class="row"><!-- 第三行 -->
         <%for (int i = 0; i < 5; i++) %>
		 <%{%>
            <!-- 一桌 -->
			<div class="desk">
				<div class="FirRow">
					<img src="./img/SeatOFF.jpg" id="<%=j %>"  alt="<%=BindSeat(j++) %>" width="40" height="auto">
					<img src="./img/SeatOFF.jpg" id="<%=j %>" alt="<%=BindSeat(j++) %>" width="40" height="auto">
				</div>
				<div class="SecRow">
					<img src="./img/desk.png" alt="桌子" width="85" height="auto">
				</div>
				<div class="ThiRow">
					<img src="./img/SeatOFF.jpg" id="<%=j %>" alt="<%=BindSeat(j++) %>" width="40" height="auto">
					<img src="./img/SeatOFF.jpg" id="<%=j %>" alt="<%=BindSeat(j++) %>" width="40" height="auto">
				</div>
			</div>
         <%} %>
             <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
               </asp:ScriptManager>
             <input type="button" onclick="JsCallCSharp()" value="确认选座" />
		</div>
        
	</div>
    <script>

    </script>
	<script src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
        var flag = 0;
        var chooseSeat=0;
        $(document).ready(function () {
             $(".FirRow>img,.ThiRow>img").each(function () {
                if ($(this).attr('alt') == '不可选择') {
                     $(this).attr("src", "./img/SeatON.jpg");
                }
         });
    
        });
        $(".FirRow>img,.ThiRow>img").click(function () {
            if ($(this).attr('alt') == '可选择') {
                if ($(this).attr('src') == './img/SeatOFF.jpg') {
                    if (flag == 0) {
                        $(this).attr("src", "./img/SeatON.jpg");
                        flag = 1;
                        chooseSeat = $(this).attr('id');
                    }
                    else {
                        alert('只能选一个座位！')
                    }
                   
                }
                else {
                    flag = 0; chooseSeat = null;
                    $(this).attr("src", "./img/SeatOFF.jpg");
                }
            }
	    // console.log($(this).attr('src'));
        });
        function JsCallCSharp() {
            PageMethods.sayhell(chooseSeat, onSayHelloSucceeded);
            
        }
        function onSayHelloSucceeded(result)//绑定的回调函数 
        { 
            alert(result);
            window.location="ChooseSeat.aspx";
        } 

    </script>
</asp:Content>


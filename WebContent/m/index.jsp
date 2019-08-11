<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="user-scalable=no, width=device-width"/>
<!-- 기기해상도 밀도와 관계없이 보이는 좌표계 구현 -->
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple=mobile-web-app-status-bar-style" content="black"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta charset="UTF-8">

	<!-- mobile js,css 연결 -->
	<script src="../js/mobileshow.js"></script>
	<link rel="stylesheet" href="../css/mobilecss.css">
	

<title>Insert title here</title>
</head>
<body onload="ScreenShow(0);">
<div id="container">
	<!-- 헤더 -->
	<div id="header1" style="background-color:#00ffff;height:35px;width:15%;float:left;" onclick="prevShow();">
		<img src="../upload/re.png" width=40px height=32px></div>
	<div id="header2" style="background-color:#00ffff;height:35px;width:70%;float:left;margin:auto;">
		<center><strong>Hotel Kjoon</strong></center></div>
	<div id="header3" style="background-color:#00ffff;height:35px;width:15%;float:right;text-align:right;" onclick='ScreenShow(0);'>
		<img src="../upload/home.png" width=40px height=32px></div>
	
	
	<!--상단메뉴-->
	<div id="menu0" style="background-color:#eeeeee;display:none;width:device-width">
	리조트 소개	
		<ul>
			<li onclick='ScreenShow(0);'>Hotel Kjoon</li>
			<li onclick='ScreenShow(1);'>Standard Room</li>
			<li onclick='ScreenShow(2);'>Deluxe Room</li>
			<li onclick='ScreenShow(3);'>Suite Room</li>
		</ul>
		<br>
	</div>
	<div id="menu1" style="background-color:#eeeeee;display:none;width:device-width">
	찾아오기	
		<ul>
			<li onclick='ScreenShow(4);'>찾아오는 길</li>
			<li onclick='ScreenShow(5);'>대중교통 이용</li>
			<li onclick='ScreenShow(6);'>자가용 이용</li>
		</ul>
		<br>
	</div>
	<div id="menu2" style="background-color:#eeeeee;display:none;width:device-width">
	호텔시설	
		<ul>
			<li onclick='ScreenShow(7);'>인피니티풀</li>
			<li onclick='ScreenShow(8);'>라운지</li>
			<li onclick='ScreenShow(9);'>펜트하우스</li>
		</ul>
		<br>
	</div>
	<div id="menu3" style="background-color:#eeeeee;display:none;width:device-width">
	예약하기	
		<ul>
			<li onclick='ScreenShow(10);'>예약상황</li>
			<li onclick='ScreenShow(11);'>예약정보</li>
		</ul>
		<br>
	</div>
	<div id="menu4" style="background-color:#eeeeee;display:none;width:device-width">
	리조트 소식	
		<ul>
			<li onclick='ScreenShow(12);'>공지사항</li>
			<li onclick='ScreenShow(13);'>문의하기</li>
		</ul>
		<br>
	</div>
	
	<div style="clear:both;"></div><!-- 구분 -->
	
	<!-- 스크린 화면 div(14개) -->
	<div id="s0" style="display:none;width:device-width;" class="resp-container">
		<iframe class = "resp-iframe" src="../?contentPage=A_01.jsp"></iframe>
	</div>
	<div id="s1" style="display:none;width:device-width;" class="resp-container">
		<iframe class = "resp-iframe" src="../?contentPage=A_02.jsp"></iframe>
	</div>
	<div id="s2" style="display:none;width:device-width;" class="resp-container">
		<iframe class = "resp-iframe" src="../?contentPage=A_03.jsp"></iframe>
	</div>
	<div id="s3" style="display:none;width:device-width;" class="resp-container">
		<iframe class = "resp-iframe" src="../?contentPage=A_04.jsp"></iframe>
	</div>
	<div id="s4" style="display:none;width:device-width;" class="resp-container">
		<iframe class = "resp-iframe" src="../?contentPage=B_01.jsp"></iframe>
	</div>
	<div id="s5" style="display:none;width:device-width;" class="resp-container">
		<iframe class = "resp-iframe" src="../?contentPage=B_02.jsp"></iframe>
	</div>
	<div id="s6" style="display:none;width:device-width;" class="resp-container">
		<iframe class = "resp-iframe" src="../?contentPage=B_03.jsp"></iframe>
	</div>
	<div id="s7" style="display:none;width:device-width;" class="resp-container">
		<iframe class = "resp-iframe" src="../?contentPage=C_01.jsp"></iframe>
	</div>
	<div id="s8" style="display:none;width:device-width; " class="resp-container">>
		<iframe class = "resp-iframe" src="../?contentPage=C_02.jsp"></iframe>
	</div>
	<div id="s9" style="display:none;width:device-width;" class="resp-container">>
		<iframe class = "resp-iframe" src="../?contentPage=C_03.jsp"></iframe>
	</div>
	<div id="s10" style="display:none;width:device-width;" class="resp-container">>
		<iframe class = "resp-iframe" src="../?contentPage=D_01.jsp"></iframe>
	</div>
	<div id="s11" style="display:none;width:device-width;" class="resp-container">>
		<iframe class = "resp-iframe" src="../?contentPage=D_02inform.jsp"></iframe>
	</div>
	<div id="s12" style="display:none;width:device-width;" class="resp-container">>
		<iframe class = "resp-iframe" src="../?contentPage=E_01.jsp?bo_table=1"></iframe>
	</div>
	<div id="s13" style="display:none;width:device-width;" class="resp-container">>
		<iframe class = "resp-iframe" src="../?contentPage=E_01.jsp?bo_table=2"></iframe>
	</div>
	
	<!-- 하단 메뉴 -->
	<div id="m0" onclick="fncShow(0);" style="position:fixed;bottom:3px;position:fixed;left:1%;background-color:#ff0000;width:18%;float:left;height:60px;text-align:center;">
	<img src="../upload/hotel.png" width="30px" height="30px"><br><font size="0.5">리조트소개</font></div>
	<div id="m1" onclick="fncShow(1);" style="position:fixed;bottom:3px;position:fixed;left:21%;background-color:#ffff00;;width:18%;float:left;height:60px;text-align:center;">
	<img src="../upload/guide.png" width="30px" height="30px"><br><font size="0.5">찾아오기</font></div>
	<div id="m2" onclick="fncShow(2);" style="position:fixed;bottom:3px;position:fixed;left:41%;background-color:#ffff00;height:60px;width:18%;float:left;text-align:center;">
	<img src="../upload/shop.png" width="30px" height="30px"><br><font size="0.5">호텔시설</font></div>
	<div id="m3" onclick="fncShow(3);" style="position:fixed;bottom:3px;position:fixed;left:61%;background-color:#ffff00;height:60px;width:18%;float:left;text-align:center;">
	<img src="../upload/plus.png" width="30px" height="30px"><br><font size="0.5">예약하기</font></div>
	<div id="m4" onclick="fncShow(4);" style="position:fixed;bottom:3px;position:fixed;left:81%;background-color:#ffff00;height:60px;width:18%;float:left;text-align:center;">
	<img src="../upload/board.png" width="30px" height="30px"><br><font size="0.5">리조트소식</font></div>
</div>
</body>
</html>
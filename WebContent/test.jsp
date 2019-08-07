<%@page import="Dao.MemberDao"%>
<%@page import="Item.MemberItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
Cookie[] cookies = request.getCookies();
if(cookies!=null){
	for(Cookie cookie : cookies){
	if(cookie.getName().equals("id")){
			session.setAttribute("login_id",cookie.getValue());
			MemberItem mem = MemberDao.getRecordOne(cookie.getValue());
		}
	}
}

%>
<style>
.dropdown-item:hover{
		color:#ff0000;
}

</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light" >
	<a style="margin-left:50px;" class="navbar-brand" href="?contentPage=main.jsp" ><img src="upload/HotelLogo.png"
					width="150" height="70"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown" style="padding-left:5px;">
    <ul class="navbar-nav">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          리조트 소개
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="?contentPage=A_01.jsp">Hotel Kjoon</a>
          <a class="dropdown-item" href="?contentPage=A_02.jsp">Standard Room</a>
          <a class="dropdown-item" href="?contentPage=A_03.jsp">Deluxe Room</a>
          <a class="dropdown-item" href="?contentPage=A_04.jsp">Suite Room</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          찾아오기
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="?contentPage=B_01.jsp">찾아오는 길</a>
          <a class="dropdown-item" href="?contentPage=B_02.jsp">대중교통 이용</a>
          <a class="dropdown-item" href="?contentPage=B_03.jsp">자가용 이용</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          호텔 시설
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="?contentPage=C_01.jsp">인피니티 풀</a>
          <a class="dropdown-item" href="?contentPage=C_02.jsp">라운지</a>
          <a class="dropdown-item" href="?contentPage=C_03.jsp">펜트하우스</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          예약하기
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="?contentPage=D_01.jsp">예약상황</a>
          <a class="dropdown-item" href="?contentPage=D_02inform.jsp">예약하기</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          리조트 소식
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="?contentPage=E_01.jsp&bo_table=1">리조트소식</a>
          <a class="dropdown-item" href="?contentPage=E_01.jsp&bo_table=2">이용하기</a>
        </div>
      </li>
    </ul>
    <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
           
        <%if(session.getAttribute("login_id")==null){%>
        <li class="nav-item"><a class="nav-link" href="?contentPage=admin/login.jsp">로그인</a></li>
        <%}else{
        if((String)(session.getAttribute("rate"))=="regular"){
        	MemberItem mem = Dao.MemberDao.getRecordOne((String)session.getAttribute("login_id"));
        %><li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"><%=mem.getNickname()%>님 반갑습니다.</a></li>
        <li class="nav-item"><a class="nav-link" href="?contentPage=admin/D_02seachmy.jsp">내예약상황</a></li>
        <%}else if((String)(session.getAttribute("rate"))=="admin"){
        %>     <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          관리메뉴
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="?contentPage=D_01.jsp">예약상황 수정</a>
          <a class="dropdown-item" href="?contentPage=admin/adm_memberser.jsp">회원관리</a>
        </div>
      </li>
        <%
        }%><li class="nav-item"><a class="nav-link" href="?contentPage=admin/adm_logout.jsp">로그아웃</a></li><%
        }%>
        
      
    </ul>

  </div>
</nav>

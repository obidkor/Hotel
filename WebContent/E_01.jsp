<%@page import="java.util.Date"%>
<%@page import="Item.BoardItem"%>
<%@page import="java.util.List"%>
<%@page import="BoardUtil.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="bootstrap-4.3.1/shop-item.css" rel="stylesheet">
<style>
.boardname {
	margin-top: 10%;
	margin-left: 5px;
}

.button {
	display: inline_block;
	float: right;
	position: relative;
	top: -25px;
	right: 50px;
}
</style>
<title>Insert title here</title>
<%
	String board=request.getParameter("bo_table");
	int boardCode=0;
	if(board.equals("1")) boardCode=1;
	else boardCode=2;
	String gongjipage = request.getParameter("gongjipage");
	if (gongjipage == null) {
		gongjipage = "gongji_list.jsp";
	}
	gongjipage = "board/" + gongjipage + "?bo_table="+boardCode;

%>

<div class="container">
	<div class="boardname">
	<%if(boardCode==1){%>
		<b style="font-size: 20">공지사항</b> <span style="float: right;">홈>리조트소식>공지사항</span>
		<%}else{%>
		<b style="font-size: 20">문의하기</b> <span style="float: right;">홈>리조트소식>문의하기</span>
		<%} %>
	</div>
	<hr>
	<jsp:include page="<%=gongjipage%>"/>
</div>

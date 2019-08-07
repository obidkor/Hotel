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
	String gongjipage = request.getParameter("gongjipage");
	if (gongjipage == null) {
		gongjipage = "gongji_list.jsp";
	}
	gongjipage = "board/" + gongjipage+"?bo_table=2";
%>

<div class="container">
	<div class="boardname">
	
		<b style="font-size: 20">문의하기</b> <span style="float: right;">홈>리조트소식>문의하기</span>
	</div>
	<hr>
	<jsp:include page="<%=gongjipage%>"/>
</div>

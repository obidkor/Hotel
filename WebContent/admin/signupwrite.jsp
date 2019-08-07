<%@page import="Dao.MemberDao"%>
<%@page import="Item.MemberItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String agree = request.getParameter("agree");
	String id = request.getParameter("id");
	id = new String(id.getBytes("8859_1"), "utf-8");
	String pw = request.getParameter("password");
	pw = new String(pw.getBytes("8859_1"), "utf-8");
	String nickname = request.getParameter("nickname");
	nickname = new String(nickname.getBytes("8859_1"), "utf-8");
	MemberItem mem = new MemberItem(id, pw, nickname, 2);

	int check = MemberDao.insertMem(mem);
	if (check == 1) {
%>
<script>
	alert("회원가입 완료");
	location.href = "?contentPage=main.jsp";
</script>
<%
	} else {
%>
<script>
	alert("중복된 아이디입니다.");
	location.href = "?contentPage=admin/signupform.jsp";
</script>
<%
	}
%>
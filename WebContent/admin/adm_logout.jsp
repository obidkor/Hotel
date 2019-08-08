<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	String id = (String)session.getAttribute("login_id");
	session.invalidate();
	
%>
<script>
location.href="?auto_login=no&id=<%=id%>";
</script>
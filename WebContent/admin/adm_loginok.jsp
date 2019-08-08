<%@page import="Item.MemberItem"%>
<%@page import="Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<center>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("password");
	String autoLogin = request.getParameter("auto-login");
	//여기에서 엉뚱한 값을 체크해야하는데 생략
	boolean bPassChk=false;
	
	
	MemberItem mem=MemberDao.getRecordOne(id);
	
	//아이디 패스워드 체크
	try{
	if(mem.getId().equals(id)&&mem.getPw().equals(pass)){
		bPassChk=true;
	}else{
		bPassChk=false;
	}
	}catch(NullPointerException e){
		bPassChk=false;
	}
	
	
	//패스워드 체크가 끝나면, 세션을 기록하고 점프한다.
	if(bPassChk){
		session.setAttribute("login_id", id);
		session.setAttribute("login_password", pass);
		session.setAttribute("login_nickname",mem.getNickname());	
		if(mem.getRate()==1) session.setAttribute("rate", "admin");
		else session.setAttribute("rate", "regular"); 
		
%>
<script>	
	location.href="?auto_login=<%=autoLogin%>&id=<%=id%>";
</script>
<%
	}else{
		%>
		<script>
		alert("아이디 또는 패스워드 오류.");
		location.href="?contentPage=admin/login.jsp";
		</script>
		<%
	
	}
%>
</center>
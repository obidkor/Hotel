<%@page import="Item.ReserveItem"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Dao.ReserveDao"%>
<%@page import="Item.MemberItem"%>
<%@page import="Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 String id = request.getParameter("id");
 String room1 = request.getParameter("room");
 String datestr= request.getParameter("date");
 java.sql.Date date=null;
 int room=0;
 SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
 try{
 room= Integer.parseInt(room1);
 Date date1 = transFormat.parse(datestr);
 date = new java.sql.Date(date1.getTime());
 }catch(NullPointerException e){}
 catch(NumberFormatException e){}
 
 int check=0;
 if(id!=null){
	 out.print(id);
	 MemberItem mem = MemberDao.getRecordOne(id);
	 check = MemberDao.delete(mem);
	 if(check==1){
		 %>
		 <script>
		 alert("회원 삭제 완료");
		 location.href="?contentPage=admin/adm_memberser.jsp";
		 </script>
		 <%
	 }else{
		 %>
		 <script>
		 alert("mem delete error!");
		 history.back(-1);
		 </script>
		 <%
		 
	 }
 }else if(date!=null){
		ReserveItem re = ReserveDao.getRecordOne(date, room);
		check=ReserveDao.delete(re);
		 if(check==1){
			 %>
			 <script>
			 alert("예약 삭제 완료");
			 location.href="?contentPage=admin/D_02seachmy.jsp";
			 </script>
			 <%
		 }else{
			 %>
			 <script>
			 alert("reserve delete error!");
			 history.back(-1);
			 </script>
			 <%
			 
		 }
	 
	 
 }
	 
 
 %>
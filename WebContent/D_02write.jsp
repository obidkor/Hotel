<%@page import="java.sql.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Item.ReserveItem"%>
<%@page import="Service.ReserveItemServiceImple"%>
<%@page import="Service.ReserveItemService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

String namestr = request.getParameter("name");
String name = new String(namestr.getBytes("8859_1"),"utf-8");
String datestr = request.getParameter("date");
SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date date1 = transFormat.parse(datestr);
java.sql.Date date = new java.sql.Date(date1.getTime());
String roomstr = request.getParameter("room");
int room = Integer.parseInt(roomstr);
String addrstr = request.getParameter("address");
String addr = new String(addrstr.getBytes("8859_1"),"utf-8");
String phonestr = request.getParameter("phone");
String phone = new String(phonestr.getBytes("8859_1"),"utf-8");
String bookernamestr = request.getParameter("bookername");
String bookername = new String(bookernamestr.getBytes("8859_1"),"utf-8");
String commentstr = request.getParameter("comment");
String comment = new String(commentstr.getBytes("8859_1"),"utf-8");
int processing;
ReserveItemService ser = new ReserveItemServiceImple();
ReserveItem re = new ReserveItem();
re.setName(name);re.setDate(date);re.setRoom(room);re.setAddr(addr);re.setTelNum(phone);re.setIn_name(bookername);re.setComment(comment);re.setProcessing(1);
int check = ser.insert(re);
if(check==1){
	%>
	<script>
	alert("예약신청 완료");
	location.href="?contentPage=D_01.jsp";
	</script>
	<%	
}
%>

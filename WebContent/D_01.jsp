<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Dao.BoardDao"%>
<%@page import="BoardUtil.Util"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.boardname {
	margin-top: 5%;
	margin-left: 5px;
}
#reserveable{
	color:blue;
}
#reservedisalbe{
	color:gray;
}
</style>
  <%
  Calendar cal = Calendar.getInstance();
  SimpleDateFormat dformat1 = new SimpleDateFormat("dd");
  SimpleDateFormat dformat2 = new SimpleDateFormat("yyyyMM");
  String day[] = {"일","월","화","수","목","금","토"};
  String date = dformat1.format(cal.getTime());
  if(Integer.parseInt(date)<10){
	  date="0"+date;
  }
  %>
<div class="container">
	<div class="boardname">
		<b style="font-size: 20">예약상황</b> <span style="float: right;">홈>예약하기>예약상황</span>
	</div>
	<hr>
<div class="table-responsive">
	<table class="table table-hover">
	<thead>
	<tr><th scope="col">날짜</th>
	<th scope="col">요일</th>
	<th scope="col">Standard Room</th>
	<th scope="col">Deluxe Room</th>
	<th scope="col">Suite Room</th></tr>
	</thead>
	<tbody>
	<%
	Connection con = BoardDao.getConnection();
	Statement stmt = con.createStatement();
	
	String sql = String.format("SELECT cal.dt,DAYOFWEEK(cal.dt),"
			+"IFNULL((SELECT NAME FROM reserve WHERE room = 1 AND date = cal.dt),'예약가능') AS room1,"
			+"IFNULL((SELECT NAME FROM reserve WHERE room = 2 AND date = cal.dt),'예약가능') AS room2,"
			+"IFNULL((SELECT NAME FROM reserve WHERE room = 3 AND date = cal.dt),'예약가능') AS room3 "
			+"FROM ("
			   +"SELECT dt + INTERVAL lv-1 DAY dt"
			   +" FROM (SELECT ordinal_position lv, CONCAT('%s', '%s') dt"
			         +" FROM information_schema.columns"
			         +" WHERE table_schema = 'mysql'"
			            +" AND table_name = 'user'"
			           +") AS dt_table"
			   +" WHERE lv <= DAY(LAST_DAY(dt))   ) cal;",dformat2.format(cal.getTime()),dformat1.format(cal.getTime()));
	//예약 조회 sql 
	ResultSet rs = stmt.executeQuery(sql);
	%><%
	while(rs.next()){
		%>
		<tr><td><b><%=rs.getString(1)%></b></td>
		  <td><%=day[rs.getInt(2)-1]%></td>
		  <%for(int i=3;i<=5;i++){%>
		  <td><%if(rs.getString(i).equals("예약가능")){
			  %><a id ="reserveable" href="?contentPage=D_02.jsp&date=<%=rs.getString(1)%>&room=<%=(i-2)%>"><%=rs.getString(i)%></a><%
		  }else{//세션 권한이 관리자이면
			  if((String)(session.getAttribute("rate"))=="admin"){
				  //예약 수정 페이지 출력%>
				  <a id="reservedisable" href="?contentPage=admin/D_02updateform.jsp&date=<%=rs.getString(1)%>&room=<%=(i-2)%>"><%=rs.getString(i)%></a>
				  <%
				  
			  }else{//아니면 그냥 출력
			  out.print(rs.getString(i));}
		  }
		  }%></td>
		  	<% }
	rs.close();
	stmt.close();
	con.close();%>
		  	
	</tbody>
	</table>
	</div>
	<p>&nbsp</p>
</div>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Statement"%>
<%@page import="Dao.BoardDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Item.ReserveItem"%>
<%@page import="java.util.List"%>
<%@page import="Dao.ReserveDao"%>
<%@page import="Service.ReserveItemService"%>
<%@page import="Service.ReserveItemServiceImple"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//최종 완성될 JSONObject 선언(전체)
JSONObject jsonObject = new JSONObject();

//person의 JSON정보를 담을 Array 선언
JSONArray dateArray = new JSONArray();


Calendar cal = Calendar.getInstance();
SimpleDateFormat dformat1 = new SimpleDateFormat("dd");
SimpleDateFormat dformat2 = new SimpleDateFormat("yyyyMM");
String day[] = {"일","월","화","수","목","금","토"};
String date = dformat1.format(cal.getTime());
if(Integer.parseInt(date)<10){
	  date="0"+date;
}


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
ResultSet rs = stmt.executeQuery(sql);
while(rs.next()){
	//person의 한명 정보가 들어갈 JSONObject 선언
	JSONObject dateInfo = new JSONObject();	
	dateInfo.put("date",rs.getString(1));
	dateInfo.put("Standard",rs.getString(3));
	dateInfo.put("Deluxe",rs.getString(4));
	dateInfo.put("Suite",rs.getString(5));
	//스트링으로 넘겨야함...
	dateArray.add(dateInfo);
}

jsonObject.put("dates", dateArray);

out.print(jsonObject);
	

%>
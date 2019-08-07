<%@page import="java.util.List"%>
<%@page import="Dao.ReserveDao"%>
<%@page import="Item.ReserveItem"%>
<%@page import="Service.ReserveItemServiceImple"%>
<%@page import="Service.ReserveItemService"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/checkout/">
<style>
.boardname {
	margin-top: 10%;
	margin-left: 5px;
}

.button {
	
}
</style>
<%
	String nickname = (String) session.getAttribute("login_nickname");
	List<ReserveItem> list = ReserveDao.getRecordByName(nickname);
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cl = Calendar.getInstance();
	String day[] = { "일", "월", "화", "수", "목", "금", "토" };
	String room[] = { "Standard", "Deluxe", "Suite" };
	String processing[] = { "예약완료", "결제완료", "환불신청", "환불완료" };
	int daynum = 0;
	//String checkdate =""; 
	//Date date1 = format.parse(date2);
	//java.sql.Date date = new java.sql.Date(date1.getTime());
	//ReserveItemService ser = new ReserveItemServiceImple();
	//ReserveItem re = ReserveDao.getRecordOne(date, room);
%>
<div class="container">
	<div class="boardname">
		<b style="font-size: 20">내 예약상황</b> <span style="float: right;">홈>로그인정보>내
			예약상황</span>
	</div>
	<hr>
	<div class="table-responsive">
		<table class="table table-hover"
			style="Table-layout: fixed; text-align: center;">
			
			<thead>
				<tr>
					<th>숙박자 이름</th>
					<th>날짜</th>
					<th>요일</th>
					<th>방 종류</th>
					<th>예약자 이름</th>
					<th>코멘트</th>
					<th>결제상황</th>
					<th>예약취소</th>
				</tr>
			</thead>
			<tbody>
				<%
					if (list.size() == 0){
				%><tr>
					<td colspan="8">예약이 없습니다.</td>
				</tr>
				<%
					}else {
						for (int i = 0; i < list.size(); i++) {
							cl.setTime(list.get(i).getDate());
							daynum = cl.get(Calendar.DAY_OF_WEEK);
				%>
				<tr>
					<td><%=list.get(i).getName()%></td>
					<td><%=list.get(i).getDate()%></td>
					<td><%=day[daynum - 1]%></td>
					<td><%=room[list.get(i).getRoom() - 1]%></td>
					<td><%=list.get(i).getIn_name()%></td>
					<td><%=list.get(i).getComment()%></td>
					<td><%=processing[list.get(i).getProcessing() - 1]%></td>
					<form method="post" action="?contentPage=admin/deletememresr.jsp">
					<input type="hidden" name="date" value="<%=list.get(i).getDate()%>">
					<input type="hidden" name="room" value="<%=list.get(i).getRoom()%>">
					<td><input type="submit" value="예약삭제"></td>
					</form>
				</tr>
				<%}
}%>
			</tbody>
			
		</table>
	</div>
</div>

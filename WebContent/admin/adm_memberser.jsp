<%@page import="Item.MemberItem"%>
<%@page import="java.util.List"%>
<%@page import="Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    List<MemberItem> list = MemberDao.getRecordAll();
    String rate[]={"관리자","일반회원"};
    
    %>
 <style>
.boardname {
	margin-top: 10%;
	margin-left: 5px;
}

</style>
<div class="container">
	<div class="boardname">
		<b style="font-size: 20">회원관리</b> <span style="float: right;">홈>관리자매뉴>회원관리</span>
	</div>
	<hr>
	<div style="overflow:scroll; width:100%; height:500px;text-align:left;">
	<div class="table-responsive">
		<table class="table table-hover"
			style="Table-layout: fixed; text-align: center;">
			<thead>
				<tr>
					<th>아이디</th>
					<th>패스워드</th>
					<th>닉네임</th>
					<th>회원등급</th>
					<th>회원 삭제</th>
				</tr>
			</thead>
			
			<tbody>
				<%
					if (list.size() == 0){
				%><tr>
					<td colspan="5">회원이 없습니다...</td>
				</tr>
				<%
					}else {
						%>
						
						<%
						for (int i = 0; i < list.size(); i++) {

				%>
				<tr>
					<td><%=list.get(i).getId()%></td>
					<td><%=list.get(i).getPw()%></td>
					<td><%=list.get(i).getNickname()%></td>
					<td><%=rate[list.get(i).getRate()-1]%></td>
					<form method="post" action="?contentPage=admin/deletememresr.jsp">
					<input type="hidden" name="id" value="<%= list.get(i).getId()%>">
					<td><input type="submit" value="멤버삭제"></td>
					</form>
				</tr>
				<%}
				%>
				
				<%		
}%>
			</tbody>
			
		</table>
	</div>
	</div>
</div>
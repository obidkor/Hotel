<%@page import="Service.BoardItemServiceImple"%>
<%@page import="Service.BoardItemService"%>
<%@page import="java.util.Date"%>
<%@page import="Item.BoardItem"%>
<%@page import="java.util.List"%>
<%@page import="BoardUtil.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="bootstrap-4.3.1/shop-item.css" rel="stylesheet">
<script>
if(self.name != 'reload') {
	self.name = 'reload';
	self.location.reload(true);
} else {
	self.name = '';
}
</script>
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
	String board=request.getParameter("bo_table");
	int boardCode=0;
	if(board.equals("1")) boardCode=1;
	else boardCode=2;
	
	Paging p = new Paging(boardCode);
	BoardItemService ser = new BoardItemServiceImple();
	List<BoardItem> list = ser.selectByByAll(boardCode); 
	String pagenowstr = request.getParameter("pagenow");
	if (pagenowstr == null) {
		p.pagenow = 1;
	} else {
		p.pagenow = Integer.parseInt(pagenowstr);
	}
	Date now = new Date();
	now.setDate(now.getDate() - 1);
%>

	<div class="table-responsive">
		<table class="table table-hover" style="Table-layout: fixed;">
			<thead>
				<!-- 필드 헤드 -->
				<tr style="text-align: center;">
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">조회수</th>
					<th scope="col">등록일</th>
				</tr>
			</thead>
			<tbody>
				<%
					int LineCnt = 0;
					for (int i = 0; i < list.size(); i++) {
						LineCnt++;
						if (LineCnt > (p.pagenow - 1) * p.countList && LineCnt <= p.pagenow * p.countList) {
				%>
				<tr style="board: 1px solid; text-align: center;'">
					<td><%=list.get(i).getId()%></td>
					<td style="text-overflow: ellipsis; overflow: hidden; text-align: left;">
			    	<span> <%//리플 표기 스팬
 					if (list.get(i).getReLevel() >= 1) {
 						for (int j = 0; j < list.get(i).getReLevel(); j++)
 							out.print("&nbsp&nbsp&nbsp");%> 
 							<img src="./upload/re.png" style="width: 16px; height: auto;">re)<%}%></span> 
							<a href="?contentPage=E_01.jsp&gongjipage=gongji_view.jsp&id=<%=list.get(i).getId()%>&bo_table=<%=boardCode%>">
										<nobr><%=list.get(i).getTitle()%></nobr></a>
							
					<span> <%//날짜비교 new표시
 							if (now.compareTo(list.get(i).getDateEnroll()) < 0) {%> <img src="./upload/new.png"> <%}%>
					</span>
					</td>
					<td><%=list.get(i).getViewCnt()%></td>
					<td><%=list.get(i).getDateEnroll()%></td>
				</tr>
				<%} else {
								continue;
								}
						}
					%>
			</tbody>
		</table>


	</div>
	<div style="text-align: center;">
		<%
				String url = null;//get방식 파라미터 url변수

				//<<출력

				url = String.format("?contentPage=E_01.jsp&pagenow=1&bo_table=%d",boardCode);
				//<<를 누르게 되면 10페이지씩 전으로 이동함
				out.print("<a class='page' href='" + url + "'>" + "<<" + "</a>");
				out.print("&nbsp&nbsp");
				// 페이지 목록에서 <<표시(start페이지가 1일때는 표시 x))

				//<출력

				if (p.startPage == 1) {
					url = String.format("?contentPage=E_01.jsp&pagenow=1&bo_table=%d",boardCode);
				} else {
					url = String.format("?contentPage=E_01.jsp&pagenow=%d&bo_table=%d", p.pagenow - p.countPage,boardCode);
				}
				//<<를 누르게 되면 10페이지씩 전으로 이동함
				out.print("<a id='page' href='" + url + "'>" + "<" + "</a>");
				out.print("&nbsp&nbsp");

				//out.print(startpage);//start페이지 검사용

				//페이지 목록 출력
				for (int i = p.startPage; i <= p.endPage; i++) {

					if (i == p.pagenow) {
						url = String.format("?contentPage=E_01.jsp&pagenow=%d&bo_table=%d", i,boardCode);
						out.print("<b>");
						out.print("<a id='page' href='" + url + "'>" + i + "</a>");
						out.print("&nbsp&nbsp&nbsp");
						out.print("</b>");
					} else {
						url = String.format("?contentPage=E_01.jsp&pagenow=%d&bo_table=%d", i,boardCode);
						out.print("<a id='page' href='" + url + "'>" + i + "</a>");
						out.print("&nbsp&nbsp&nbsp");
					}

				}

				//>출력

				if (p.pagenow < p.totalPage) {

					url = String.format("?contentPage=E_01.jsp&pagenow=%d&bo_table=%d", p.checkpagenow(p.pagenow + p.countPage,p.totalPage),boardCode);
					out.print("<a id='page' href='" + url + "'>" + ">" + "</a>");
					out.print("&nbsp&nbsp");
				}

				if (p.endPage < p.totalPage) {
					//>>출력		
					url = String.format("?contentPage=E_01.jsp&pagenow=%d&bo_table=%d",p.checktotalpage(p.totalPage,p.endPage),boardCode);
					out.print("<a id='page' href='" + url + "'>" + ">>" + "</a>");
					//마지막 페이지에서는 출력하지	않음
				}
			%>
	</div>
		<div class="button">
	<%if((String)(session.getAttribute("rate"))=="admin"){ %>
		<input type="button" value="신규등록"
			onclick="location.href='?contentPage=E_01.jsp&gongjipage=gongji_insert.jsp&bo_table=<%=boardCode%>';">
	<%}else if(boardCode==2){ %>
		<input type="button" value="신규등록"
			onclick="location.href='?contentPage=E_01.jsp&gongjipage=gongji_insert.jsp&bo_table=<%=boardCode%>';">
	<%} %>
		</div>
		<%
		out.println("pagenow : "+p.pagenow);
		out.println("totalCount : "+p.totalCount);
		out.println("countList : "+p.countList);
		out.println("countPage : "+p.countPage);
		out.println("totalPage : "+p.totalPage);
		out.println("startPage : "+p.startPage);
		out.println("endPage : "+p.endPage);
		out.println("!!!! : " + (p.totalCount / p.countList));
		
		
		
		
		%>


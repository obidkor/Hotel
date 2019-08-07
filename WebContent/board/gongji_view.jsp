<%@page import="Item.BoardItem"%>
<%@page import="Service.BoardItemService"%>
<%@page import="Service.BoardItemServiceImple"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%		
		String boardstr=request.getParameter("bo_table");
		int boardCode=0;
		if(boardstr.equals("1")) boardCode=1;
		else boardCode=2;
		BoardItemService ser = new BoardItemServiceImple();
		String idstr = request.getParameter("id");
		int id = Integer.parseInt(idstr);
		BoardItem board = ser.selectOne(id,boardCode);
		board.setViewCnt(board.getViewCnt()+1);
		ser.update(id, board);
		try {
			if (board.getFile().equals("")) {
				board.setFile("1");
			}
		} catch (NullPointerException e) {
			board.setFile("1");
		}
	%>
<div class="table-responsive">
	<table class="table table-hover">
		<tr>
			<td style="text-align: center;">번호</td>
			<td><%=board.getId()%></td>
		</tr>
		<tr>
			<td style="text-align: center;">제목</td>
			<td><%=board.getTitle()%></td>
		</tr>
		<tr>
			<td style="text-align: center;">등록일</td>
			<td><%=board.getDateEnroll()%></td>
		</tr>
		<tr>
			<td style="text-align: center;">조회수</td>
			<td><%=board.getViewCnt()%></td>
		</tr>
		<tr>
			<td style="text-align: center;">내용</td>
			<td><div
					style="width: 1000px; height: 400px; background: white; color: black; padding: 10px;"><%=board.getContent()%></div></td>
		</tr>
		<tr>
			<td style="text-align: center;">첨부파일</td>
			<td>
				<%
					if (board.getFile().equals("1")) {
				%> 첨부파일 없음 <%
					} else {
						String file[] = board.getFile().split("\\|");
						for (int i = 0; i < file.length; i++) {
				%> <a href="download.jsp?filename=<%=file[i]%>"><%=file[i]%></a> <%
					}
					}
				%>
			</td>
		</tr>
		<tr>
			<td style="text-align: center;">원글</td>
			<td><%=board.getRootId()%></td>
		</tr>
		<tr>
			<td style="text-align: center;">댓글수준</td>
			<td><%=board.getReLevel()%></td>
		</tr>
		<tr>
			<td style="text-align: center;">댓글 내 순서</td>
			<td><%=board.getReCnt()%></td>
		</tr>
		<form method="post">
			<tr>
				<td></td>
				<td style="text-align: right; padding-right: 50px;"><input
					type="hidden" name="id" value="<%=board.getId()%>"> <input
					type="hidden" name="title" value="<%=board.getTitle()%>"> <input
					type="hidden" name="date" value="<%=board.getDateEnroll()%>">
					<input type="hidden" name="stockContent"
					value="<%=board.getContent()%>"> <input type="hidden"
					name="rootid" value="<%=board.getRootId()%>">
					<input type="button" value="목록" onclick="location.href='?contentPage=E_01.jsp&gongjipage=gongji_list.jsp&bo_table=<%=boardCode%>'">
					<input type="submit" formaction="?contentPage=E_01.jsp&gongjipage=gongji_update.jsp&bo_table=<%=boardCode%>" value="수정">
					<input type="submit" formaction="?contentPage=E_01.jsp&gongjipage=gongji_delete.jsp&bo_table=<%=boardCode%>" value="삭제">
					<input type="submit" formaction="?contentPage=E_01.jsp&gongjipage=gongji_reinsert.jsp&bo_table=<%=boardCode%>" value="댓글"></td>
			</tr>
		</form>
	</table>
</div>

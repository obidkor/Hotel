<%@page import="Item.BoardItem"%>
<%@page import="Service.BoardItemServiceImple"%>
<%@page import="Service.BoardItemService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String boardstr=request.getParameter("bo_table");
	int boardCode=0;
	if(boardstr.equals("1")) boardCode=1;
	else boardCode=2;
	
	String idstr = request.getParameter("id");
	int id = Integer.parseInt(idstr);
	BoardItemService ser = new BoardItemServiceImple();
%>

	<%
		BoardItem board = new BoardItem();
		board.setId(id);
		board.setBoardcode(boardCode);
		ser.delete(board);
	%>
	<script>
		alert("삭제완료")
		location.href = "?contentPage=E_01.jsp&gongjipage=gongji_list.jsp&bo_table=<%=boardCode%>"
	</script>

<%@page import="Item.BoardItem"%>
<%@page import="Service.BoardItemServiceImple"%>
<%@page import="Service.BoardItemService"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  	
<script>
	function nullcheck() {

		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["stockContent"].exec("UPDATE_CONTENTS_FIELD", []);

		if (document.getElementById('title').value.length <= 0) {

			alert("제목을 입력하세요");
			document.getElementById('title').focus();
			return false;

		} else if (document.getElementById('stockContent').value.length <= 0) {
			alert("내용을 입력하세요");
			document.getElementById('stockContent').focus();

		}

		return true;

	}
</script>
<!-- 텍스트에디터 -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<%
	String boardstr=request.getParameter("bo_table");
	int boardCode=0;
	if(boardstr.equals("1")) boardCode=1;
	else boardCode=2;

	String idstr = request.getParameter("id");//view에서 넘어옴
	int id = Integer.parseInt(idstr);//parameter(원글)
	BoardItemService ser = new BoardItemServiceImple();
	BoardItem board = ser.selectOne(id,boardCode);

	Connection con = Dao.BoardDao.getConnection();
	Statement stmt = con.createStatement();
	String sql = String.format("update board set `recnt`=`recnt`+1 where rootid = %d and recnt > %d and boardCode=%d",
	board.getRootId(), board.getReCnt(),board.getBoardcode());
	stmt.execute(sql);
%>
	<%
		SimpleDateFormat timeForm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar time = Calendar.getInstance();
	%>
	<div class="table-responsive">
	<table class="table table-hover">
		<form method='post' action='?contentPage=E_01.jsp&gongjipage=gongji_insert2.jsp&bo_table=<%=boardCode%>'
			onsubmit="return nullcheck()" enctype="multipart/form-data">
			<tr>
				<td>번호</td>
				<td>신규(자동부여)</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id='title'
					style="width: 500px;" maxlength="150"></td>
			</tr>
			<tr>
				<td>등록일</td>
				<td><%=timeForm.format(time.getTime())%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea type="text" name="stockContent" id="summernote"
						style="width: 500px; height: 300px;"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="upload" id="upload" multiple></td>
			</tr>
			<tr>
				<td>원글</td>
				<td><input type="text" name="rootid" id='rootid'
					style="width: 500px;" value="<%=board.getRootId()%>" readonly></td>
			</tr>
			<tr>
				<td>댓글수준</td>
				<td><input type="text" name="relevel" id='relevel'
					style="width: 500px;" value="<%=board.getReLevel() + 1%>" readonly></td>
			</tr>
			<tr>
				<td>댓글 내 순서</td>
				<td><input type="text" name="recnt" id='recnt'
					style="width: 500px;" value="<%=board.getReCnt() + 1%>" readonly></td>
			</tr>
					<input type="hidden" name="viewcnt" id="viewcnt" value="0">
					<input type="hidden" name="boardcode" id="boardcode" value="<%=boardCode%>">
			<tr>
				<td colspan='2'><div style="float: right; margin-right: 50px;">
						<input type="button" value="취소"
							onclick="location.href='?contentPage=E_01.jsp&gongjipage=gongji_list.jsp&bo_table=<%=boardCode%>'">
								 
							<input type="submit" value="쓰기">
					</div></td>
			</tr>
		</form>

		<!-- 텍스트에디터 -->
		<script>
$(document).ready(function() {
	  $('#summernote').summernote({
	        placeholder: '내용을 입력하세요',
	        tabsize: 2,
	        height: 200
	      });
	});
</script>

	</table>
	</div>

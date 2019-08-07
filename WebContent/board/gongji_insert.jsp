<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<script>
	function nullcheck() {
		// 에디터의 내용이 textarea에 적용된다.

		if (document.getElementById('title').value.length <= 0) {

			alert("제목을 입력하세요");
			document.getElementById('title').focus();
			return false;

		} else if (document.getElementById('summernote').value.length <= 0) {
			alert("내용을 입력하세요");
			document.getElementById('stockContent').focus();

		}

		return true;

	}
</script>

	<%
		String boardstr=request.getParameter("bo_table");
		int boardCode=0;
		if(boardstr.equals("1")) boardCode=1;
		else boardCode=2;
		
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
					style="width: 80%;" maxlength="150"></td>
			</tr>
			<tr>
				<td>등록일</td>
				<td><%=timeForm.format(time.getTime())%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea type="text" name="stockContent" id="summernote"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="upload" id="upload" multiple></td>
			</tr>
			<input type="hidden" name="rootid" id='rootid'> <input
				type="hidden" name="relevel" id='relevel' value="0"> <input
				type="hidden" name="recnt" id='recnt' value="0">
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
	</table>
</div>
			<!-- 텍스트에디터 -->
		<script>
			$(document).ready(function() {
				$('#summernote').summernote({
					placeholder : '내용을 입력하세요',
					tabsize : 2,
					height : 200

				});
			});
		</script>
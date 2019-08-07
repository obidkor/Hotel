<%@page import="Item.BoardItem"%>
<%@page import="Service.BoardItemServiceImple"%>
<%@page import="Service.BoardItemService"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String boardstr=request.getParameter("bo_table");
int boardCode=0;
if(boardstr.equals("1")) boardCode=1;
else boardCode=2;

String idstr = request.getParameter("id");
int id = Integer.parseInt(idstr);
int idformer = id;

BoardItemService ser=new BoardItemServiceImple();
BoardItem board = ser.selectOne(id,boardCode);
//parameter받음

%>
<script>
function nochar(which){
		if(which=='id') {
			var where="id";
			var whereA="charalert1"}
	   if(isNaN(document.getElementById(where).value)) {
		   document.getElementById(where).value="";
		      document.getElementById(whereA).innerHTML=("숫자만 입력하세요.");      
		   
		}
}
function nullcheck() {
	
	 // 에디터의 내용이 textarea에 적용된다.
	  oEditors.getById["stockContent"].exec("UPDATE_CONTENTS_FIELD", []);
	 
	  if(document.getElementById('title').value.length<=0||document.getElementById('id').value.length<=0||
			  document.getElementById('stockContent').value.length<=0) {

	    alert("값을 모두 완전히 입력해 주세요.");

	    return false;

	  }
	 
	  return true;

	}
<%
try{
	if(board.getFile().equals(null)){}
}
catch(NullPointerException e){
	board.setFile("1");
}
%>
</script>
<!-- 텍스트에디터 -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
	
<div class="table-responsive">
	<table class="table table-hover">
		<form method='post' onsubmit="return nullcheck()" enctype="multipart/form-data">
			<tr>
				<td style="width: 100px;">번호</td>
				<td><input type="text" style="width: 500px;" name="id" id="id"
					value="<%=board.getId()%>" onkeyup="nochar('id')" readonly> <span
					id="charalert1" style="font-color: red;"></span></td>
			</tr>
			<tr>
				<td style="width: 100px;">제목</td>
				<td><input type="text" style="width: 500px" name="title"
					id="title" value="<%=board.getTitle()%>" maxlength="150"></td>
			</tr>
			<tr>
				<td style="width: 100px;">등록일</td>
				<td><%=board.getDateEnroll()%></td>
			</tr>
			<tr>
				<td style="width: 100px;">내용</td>
				<td><textarea name="stockContent" id="summernote"
						style="width: 500px; height: 300px;"><%=board.getContent()%></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<% if(board.getFile().equals("1")){%>첨부파일 없음<%}else{%><%=board.getFile().replaceAll("\\|", "&nbsp")%> <%}%><input
					type="file" name="upload" id="upload" multiple value="<%=board.getFile().replaceAll("\\|", "&nbsp")%>">
				</td>
			</tr>
			<tr>
				<td>원글</td>
				<td><input type="text" name="rootid" id='rootid'
					style="width: 500px;" value="<%=board.getRootId()%>" readonly></td>
			</tr>
			<tr>
				<td>댓글수준</td>
				<td><input type="text" name="relevel" id='relevel'
					style="width: 500px;" value="<%=board.getReLevel()%>" readonly></td>
			</tr>
			<tr>
				<td>댓글 내 순서</td>
				<td><input type="text" name="recnt" id='recnt'
					style="width: 500px;" value="<%=board.getReCnt()%>" readonly></td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: right; padding-right: 50px;">
					<input type="hidden" name="viewcnt" value="<%=board.getViewCnt()%>">
					<input type="hidden" name="idformer" value="<%=idformer%>">
					<input type="hidden" name="boardcode" value="<%=boardCode%>">
					<input type="button" value="취소" onclick="history.back(-1)">
					<input type="submit" formaction="?contentPage=E_01.jsp&gongjipage=gongji_update2.jsp&bo_table=<%=boardCode%>" value="수정">
					<input type="submit" formaction="?contentPage=E_01.jsp&gongjipage=gongji_delete.jsp&bo_table<%=boardCode%>" value="삭제">
				</td>
			</tr>
		</form>
		<!-- 텍스트에디터 -->
		<script>
$(document).ready(function() {
	  $('#summernote').summernote({
	        tabsize: 2,
	        height: 200
	
	      });
	});
</script>
	</table>
</div>

<%@page import="Service.BoardItemServiceImple"%>
<%@page import="Service.BoardItemService"%>
<%@page import="Item.BoardItem"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	
	request.setCharacterEncoding("UTF-8");
	String boardstr=request.getParameter("bo_table");
	int boardCode=0;
	if(boardstr.equals("1")) boardCode=1;
	else boardCode=2;	


	Connection con = Dao.BoardDao.getConnection();
	Statement stmt = con.createStatement();
	String sql = String.format("Select * from board where boardCode=%d order by id;",boardCode);
	ResultSet rs = stmt.executeQuery(sql);
	int id=1;
	while(rs.next()){
		if(id==rs.getInt(1)) {
			id++;
		}
	}
	stmt.close();
	con.close();

	Map<String, String> fileMap = new HashMap<String, String>();
	String fileName = "";

	File temporaryDir = new File("c:\\tmp\\"); //업로드 된 파일의 임시 저장 폴더를 설정
	String realDir = config.getServletContext().getRealPath("/upload"); //톰켓의 전체 경로를 가져오고 img라는 폴더를 만들고 거기다
																//tmp의 폴더의 전송된 파일을 upload 폴더로 카피 한다.
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(1 * 1024 * 1024); //1메가가 넘지 않으면 메모리에서 바로 사용
	factory.setRepository(temporaryDir); //1메가 이상이면 temporaryDir 경로 폴더로 이동
	//실제 구현단계 아님 설정단계였음
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(10 * 1024 * 1024); //최대 파일 크기(10M)
	List<FileItem> items = upload.parseRequest(request); //실제 업로드 부분(이부분에서 파일이 생성된다)

	Iterator<FileItem> iter = items.iterator(); //Iterator 사용
	while (iter.hasNext()) {
		FileItem fileItem = (FileItem) iter.next(); //파일을 가져온다

		if (fileItem.isFormField()) { //업로드도니 파일이 text형태인지 다른 형태인지 체크
								// text형태면 if문에 걸림
								//폼 파라미터(name):fileItem.getFieldName() /폼 value:fileItem.getString("UTF-8")
	String fileNamestr = fileItem.getString("UTF-8").replaceAll(";", "&#59;");
	fileNamestr = fileItem.getString("UTF-8").replaceAll("'", "&#39;");//특수문자처리
	//map으로 저장할 것
	fileMap.put(fileItem.getFieldName(), fileNamestr);
		} else { //파일이면 이부분의 루틴을 탄다
	if (fileItem.getSize() > 0) { //파일이 업로드 되었나 안되었나 체크 size>0이면 업로드 성공
		//String fieldName=fileItem.getFieldName();//input 태그 name
		String fileNamestr = fileItem.getName();//파일이름
		//String contentType=fileItem.getContentType();//업로드 파일 확장자
		//boolean isInMemory=fileItem.isInMemory();//기준 메모리 이상인가?
		//long sizeInBytes=fileItem.getSize();//파일 용량

		try {
			File uploadedFile = new File(realDir, fileNamestr); //실제 디렉토리에 fileName으로 카피 된다.
			int index = 1;
			while (uploadedFile.exists()) {//중복처리
				fileNamestr = fileItem.getName();//파일이름
				fileNamestr = index + "_" + fileNamestr;//파일이름에 인덱스를 넣어줌
				index++;
				uploadedFile = new File(realDir, fileNamestr); //다시 실제 디렉토리에 fileName으로 카피 된다.
			}

			fileItem.write(uploadedFile);
			fileItem.delete(); //카피 완료후 temp폴더의 temp파일을 제거
			fileName += fileNamestr + "|";
		} catch (IOException ex) {
		}
	}
		}
	}
%>
<body>
	<%
		if (fileMap.get("rootid").equals("")) {
			fileMap.put("rootid", Integer.toString(id));
		}

		BoardItem board = new BoardItem();
		board.setId(id);
		board.setTitle(fileMap.get("title"));
		board.setContent(fileMap.get("stockContent"));
		board.setFile(fileName);
		board.setRootId(Integer.parseInt(fileMap.get("rootid")));
		board.setReLevel(Integer.parseInt(fileMap.get("relevel")));
		board.setReCnt(Integer.parseInt(fileMap.get("recnt")));
		board.setViewCnt(Integer.parseInt(fileMap.get("viewcnt")));
		board.setBoardcode(Integer.parseInt(fileMap.get("boardcode")));
		BoardItemService ser = new BoardItemServiceImple();
		int check = ser.insert(board);
	if(check==1){
	%>
	<script>
		alert("생성완료");
		location.href = "?contentPage=E_01.jsp&gongjipage=gongji_list.jsp&bo_table="+<%=boardCode%>;
	</script>
	<%}else{%>
	<script>
		alert("에러!");
	</script>
	<%}%>
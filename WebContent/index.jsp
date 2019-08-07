<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contentPage = request.getParameter("contentPage");
	if (contentPage == null) {
		contentPage = "main.jsp";
	}
	String auto = request.getParameter("auto_login");//자동로그인 파라미터
	String id = request.getParameter("id");
	if(auto!=null&&id!=null){
		if(auto.equals("yes")){//자동로그인 파라미터 yes???
		//쿠키 생성
			Cookie cookie = new Cookie("id",request.getParameter("id"));
			cookie.setMaxAge(60*60*24*1);
			response.addCookie(cookie);
		}else if(auto.equals("no")){//no이면??
			//쿠키삭제
			Cookie[] cookies = request.getCookies();
			if(cookies!=null){
				for(Cookie cookie : cookies){
					if(cookie.getName().equals("id")){
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
				}
			}
		}
	}
%>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>KJ Hotel</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
      <!-- Bootstrap core JavaScript -->
  	<script src="bootstrap-4.3.1/dist/jquery/jquery.min.js"></script>

<style>
.Site {
	display: flex;
	min-height: 100vh;
	flex-direction: column;
}

.Site-content {
	flex: 1;
}
</style>
<title>호텔 Kjoon에 오신 것을 환영합니다.</title>
</head>
<body class="Site">
	<header>
	<jsp:include page="test.jsp" />
	</header>
	<main class="Site-content">
	<jsp:include page="<%=contentPage%>"/>
	</main>
	<footer>
	<jsp:include page="foot.jsp" />
	</footer>
	

  
</body>
</html>
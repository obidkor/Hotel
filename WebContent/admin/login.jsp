<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/sign-in/">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<link href="bootstrap-4.3.1/site/docs/4.3/examples/sign-in/signin.css"
	rel="stylesheet">
<div style="margin-top: 10%">
	<form class="form-signin" method="post"
		action="?contentPage=admin/adm_loginok.jsp">
		<img class="mb-4" src="./upload/Hotelmenu.png" alt="" width="80"
			height="80">
		<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
		<label for="inputEmail" class="sr-only">Email address</label> <input
			type="text" id="inputEmail" class="form-control"
			placeholder="Email address" name="id" required autofocus> <label
			for="inputPassword" class="sr-only">Password</label> <input
			type="password" id="inputPassword" class="form-control"
			placeholder="Password" name="password" required>
		<div class="checkbox mb-3">
			<label> <input type="checkbox" name="auto-login" value="yes">
				자동로그인
			</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
			in</button>
		아이디가 없으신가요?<a href="?contentPage=admin/signupform.jsp">회원가입</a>
		<p class="mt-5 mb-3 text-muted">&copy; 2017-2019</p>
	</form>
</div>
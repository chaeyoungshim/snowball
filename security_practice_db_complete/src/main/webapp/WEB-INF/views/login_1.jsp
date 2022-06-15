<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/login.css" />
</head>
<body>
<!-- 
	중요한건 input에 name 이 중요함 
		1) name 부분에 실제로 userid가 들어가는 곳인데 username으로 무조건 해줘야함 => 시큐리티 상 지켜줘야하는 규칙임 
		2) name 부분에 실제로 password가 들어가는 곳인데 password로 무조건 해줘야함 => 시큐리티 상 지켜줘야하는 규칙임 
	
-->
	<div class="container center-contents">
		<div class="row">
			<form action="/login" method="post" class="form-signin">
				<h1 class="h2 mb-3 font-weight-normal">로그인</h1>
				<label for="username" class="sr-only">로그인 아이디</label>
				<input type="text" id="username" name="username" class="form-control" placeholder="아이디를 입력해 주세요" required autofocus/>    
				<label for="password" class="sr-only">비밀번호</label>
				<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력해 주세요" required/>    
				<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
				<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}"/>
				<div class="error-message">
					<span>${loginError}</span>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
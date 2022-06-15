<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/index.css" />
</head>
<body>
<div class="container center-contents">
	
	
	<sec:authorize access="!isAuthenticated()"> <!-- 로그인을 안 했다면 없다면 '로그인하기' 보여주기 -->
		<div class="row">
			<a href="/login">로그인하기</a>
		</div>
	</sec:authorize>
	
	
	<sec:authorize access="isAuthenticated()">
		<div class="links">
			<div class="link">
				<a href="/user/index">사용자페이지</a>		<!-- 사용자 권한이 있다면 '사용자페이지' 보여주기 -->
			</div>
		</div>
	</sec:authorize>

	
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="info" />
		<c:if test="${info.username == 'admin'}">
			<div class="links">
				<div class="link">
					<a href="/admin/index">관리자페이지</a>		<!-- 관리자 권한이 있다면 '관리자페이지' 보여주기 -->
				</div>
			</div>
		</c:if>
	</sec:authorize>
	
</div>
</body>
</html>



















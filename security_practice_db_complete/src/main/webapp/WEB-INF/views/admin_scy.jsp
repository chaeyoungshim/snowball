<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/bootstrap-4.6.1-dist/css/bootstrap.min.css" /><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>

<div class="container">
	<c:if test="${!empty login}">
	  <a class="btn btn-primary btn-lg" href="/logout" role="button" >로그아웃</a>
  	</c:if>
	<br />
	<div>
		<h1>관리자 페이지</h1>
		<a href="/admin/memInsert">직원 추가</a><br />
		<a href="/admin/memList">직원 조회</a><br />
	</div>
	
	<sec:authorize access="isAuthenticated()">
		<form action="/logout" method="post">
			<button type="submit">로그아웃</button>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</sec:authorize>
	<hr />
	
	
	<h5>사용자 페이지도 관리하기</h5>
	
	<sec:authorize access="isAuthenticated()">
		<a href="/user/index">사용자페이지</a>
	</sec:authorize>
	
	
	 <%-- <c:if test="${empty login}">
	 	<a class="btn btn-success btn-lg" href="/main/main" role="button">로그인</a>
  	 </c:if> --%>
 	 
</div>

</body>
</html>
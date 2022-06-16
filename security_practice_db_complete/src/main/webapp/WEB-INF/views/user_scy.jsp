<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>

<div class="container">
	<div>
		<%-- <input type="text" name="mem_name" value='<sec:authentication property="principal.username"/>님' class="login" readonly/> --%>
		<input type="text" name="curr_mem_id" value='<sec:authentication property="principal.user.mem_name"/>님' class="login" readonly/>
	</div>
	
	<sec:authorize access="isAuthenticated()">
		<form action="/logout" method="post">
			<div>
				<button type="submit">로그아웃</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</div>
		</form>
	</sec:authorize>
	
	
	<c:if test="${!empty login}">
	  <a class="btn btn-primary btn-lg" href="/logout" role="button" >로그아웃</a>
  	</c:if>
  	
	<br />
	
	<div>
		<h1>직원</h1>
		<a href="/user/approvalInsert">전자결재 기안</a><br />
		<a href="/user/approvalList">전자결재 조회</a><br />
	</div>
 	 
 	 <br />
 	 
 	 <div>
		<a href="/user/support/dispatch/att">파견 - 전체 직원 리스트</a>
		<br>
		<a href="/user/support/hr/att">인사 - 전체 직원 리스트</a>
	</div>
 	 
 	 
 	 
 	<hr />
 	
 	<h1>관리자 페이지</h1> 
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
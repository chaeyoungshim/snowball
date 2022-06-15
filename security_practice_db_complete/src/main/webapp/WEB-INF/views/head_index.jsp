<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Co-Mapping - Index</title> <!-- 이거 페이지마다 다르게 하려면? -->
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Co-Mapping</h3></div>
                                    <div class="card-body">
                                        <form>
                                            <div class="d-flex">
                                            	<sec:authorize access="!isAuthenticated()">
                                             	   <a class="btn btn-primary" style="width:100%" href="/login">로그인하기</a>
                                            	</sec:authorize>
                                            	<sec:authorize access="isAuthenticated()">
                                             	   <a class="btn btn-primary" style="width:100%" href="/user/index">메인페이지</a>
                                            	</sec:authorize>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
<%@include file="../views/includes/footer.jsp" %>

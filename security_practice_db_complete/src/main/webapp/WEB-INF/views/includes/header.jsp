<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Co-Mapping</title> <!-- 이거 페이지마다 다르게 하려면? -->
        <style>
/*         .table-msg{
        	display: inline-block;
		    white-space: nowrap;
		    overflow: hidden;
        } */
         #content-block {
		    display: inline-block;
			width: 27vw;
 		    height: fit-content;		    
 		    white-space: nowrap;
		    overflow: hidden; */
		    border: none;
		} 
		#calendar{
			height:38rem;		
		}
		
</style>
		
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="/resources/css/styles.css" rel="stylesheet" />
        
        <!-- mem_list head 태그 내의 링크 -->
        <!-- MetisMenu CSS -->
		<link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet"> 
		 <!-- Custom CSS -->
		<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">
		<!-- 이거 들어가야 하는지는 모르겠는데 지웠다가 큰일날까봐 여기로 뺌 + 근데 페이지 스타일이 안먹음 -->
		
		<!-- approval_read head 태그 내의 링크 -->
		<link rel="stylesheet" href="/resources/css/upload.css?after" />
		<!-- 이거 들어가야 하는지는 모르겠는데 지웠다가 큰일날까봐 여기로 뺌 -->
		
		<!-- Custom Fonts -->
        <!-- CSS only -->
           <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
      integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
      crossorigin="anonymous"
    />
		<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
        <link href='/resources/fullcalendar-5.11.0/lib/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar-5.11.0/lib/main.js'></script>
<script type='text/javascript'>

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    googleCalendarApiKey: 'AIzaSyBJ6ARqJPy-NrJ0QggzxwBnf_Ternk_bLs',
    eventSources: [
    {
          googleCalendarId: 'lk931101@gmail.com',
          className: '프로젝트',
          color: '#be5683', //rgb,#ffffff 등의 형식으로 할 수 있어요.
          //textColor: 'black' 
        }
    ]
  });
  calendar.render();
});
</script>
        
    </head>
	<body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            
            <a class="navbar-brand ps-3" href="/"><div class="sb-logo-link-icon"><i class="fas fa-hands-helping"></i></div>Co-Mapping</a>
            <!-- Sidebar Toggle-->
            <button 
            class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" 
            id="sidebarToggle" 
            href="#!">
                <i class="fas fa-bars"></i>
            </button>
            <!-- Navbar Search-->
            <form 
            class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input 
                    class="form-control" 
                    type="text" 
                    placeholder="뭘 검색할겨..." 
                    aria-label="뭘 검색할겨..." 
                    aria-describedby="btnNavbarSearch" />
                    <button 
                    class="btn btn-primary" id="btnNavbarSearch" type="button">
                    <i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a 
                    class="nav-link dropdown-toggle" 
                    id="navbarDropdown" 
                    href="#" 
                    role="button" 
                    data-bs-toggle="dropdown" 
                    aria-expanded="false">
                    <i class="fas fa-user fa-fw">
                    </i>
                </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">비밀번호 변경</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li>
							<sec:authorize access="isAuthenticated()">
								<form action="/logout" method="post">
									<button type="submit" class="dropdown-item">로그아웃</button>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								</form>
							</sec:authorize>
						</li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        
                        	<!-- 
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                             -->
                             
                            <div class="sb-sidenav-menu-heading">전자결재</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseApprovals" aria-expanded="false" aria-controls="collapseApprovals">
                                <div class="sb-nav-link-icon"><i class="fas fa-file-alt"></i></div>
                                전자결재
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseApprovals" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/user/approvalInsert">결재 기안</a>
                                    <a class="nav-link" href="/user/approvalList">결재 조회</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">업무지원</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseSupports" aria-expanded="false" aria-controls="collapseSupports">
                                <div class="sb-nav-link-icon"><i class="fas fa-building"></i></div>
                                인사
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseSupports" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/user/support/hr/att">근태 리스트</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseDSupports" aria-expanded="false" aria-controls="collapseDSupports">
                                <div class="sb-nav-link-icon"><i class="fas fa-briefcase"></i></div>
                                파견
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseDSupports" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/user/support/dispatch/att">근태 리스트</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">공지메일</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMail" aria-expanded="false" aria-controls="collapseMail">
                                <div class="sb-nav-link-icon"><i class="fas fa-envelope"></i></div>
                                공지메일
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseMail" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">공지메일</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">게시판</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseBoards" aria-expanded="false" aria-controls="collapseBoards">
                                <div class="sb-nav-link-icon"><i class="fas fa-clipboard"></i></div>
                                게시판
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseBoards" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">공지 게시판</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">커뮤니티</a>
                                </nav>
                            </div>
                           
                           
                        	<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal" var="info" />
								<c:if test="${info.username == 'admin'}">
                           			<div class="sb-sidenav-menu-heading">관리자</div>
		                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseAdmin" aria-expanded="false" aria-controls="collapseAdmin">
		                                <div class="sb-nav-link-icon"><i class="fas fa-certificate"></i></div>
		                                	관리자페이지
		                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
		                            </a>
		                            <div class="collapse" id="collapseAdmin" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
		                                <nav class="sb-sidenav-menu-nested nav">
		                                    <a class="nav-link" href="/admin/memInsert">사용자 추가하기</a>
		                                    <a class="nav-link" href="/admin/memList">사용자 조회하기</a>
		                                </nav>
		                            </div>
                            	</c:if>
							</sec:authorize>
                            
                            
                            
                            
                            <!-- 
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                             -->
                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
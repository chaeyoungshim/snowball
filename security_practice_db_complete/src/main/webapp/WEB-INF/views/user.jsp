<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../views/includes/header.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- <div class="modal" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">공지</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                 Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                 when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                 It has survived not only five centuries, but also the leap into electronic typesetting, 
                 remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets 
                 containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus 
                 PageMaker including versions of Lorem Ipsum.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id = "modal-today-close">today</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div> -->




            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4 breadcrumb mb-4 layout-center">
							<input type="text" name="mem_id" value='<sec:authentication property="principal.user.mem_name"/>님 안녕하세요' class="login-name" readonly/>   
						</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Main Page</li>
                        </ol>
                        
                        <!-- 
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Primary Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Warning Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Success Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Danger Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        -->
                        
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        쪽지
                                    </div>
                                    <div class="card-body" style="display: inline-block; white-space:nowrap;">
                                    
                                     <div>
                                    	<form action="" method="post" class="msgViewForm" style="overflow:scroll; height:38rem; letter-spacing:0; word-spacing:0;">
									      <table class=".table table-striped table-bordered table-hover " style="font-size: 18px; width:25vw;">
									          <thead>
									          <tr>
										         <th class="text-center" scope="col">번호</th> 
										         <th class="text-center" scope="col">발신자</th>
										         <th class="text-center" scope="col">수신자</th>
										         <th class="text-center" scope="col">내용</th>
										         <th class="text-center" scope="col"></th>
									          </tr>
									         
									          </thead>
									      <tbody>
									      <c:forEach var="list" items="${mList}">
									          <tr>
									          	<td class="text-center">${list.msg_id}</td>
									            <td class="text-center">${list.sender_id}</td>
									            <td class="text-center">${list.receiver_id}</td>
									            <td class="text-align:left;" id="content-block" style="border:none;">${list.msg_content}</td>
									            <td class="text"><button type="button" class="btn btn-primary btn-sm msgView" 
									            onclick="javascript:location.href = '/user/msg/msgRead/?msg_id=${list.msg_id}'">보기</button></td>
									          </tr>
									        </c:forEach> 
									        </tbody>
									        </table>
									        <button type="button" class="btn btn-primary msgBtn" onclick="location='/user/msg/msgInsert'" style="margin-top:5px;">작성</button>
									        <input type="hidden" name="mem_id" value="<sec:authentication property='principal.username'/>">
									    </form>
									   </div>  
									</div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        캘린더
                                    </div>
                                    <div class="card-body">
                                    <div id="calendar"></div>
                                    </div>

                                    
                                    
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                메모
                            </div>
                            <div class="card-body">
                            
                            
                              <div class="row">
								  <div class="col-mb-3 memocl">
								 	<form action="" method="post" role="form" id="listForm" >
								      	<div>
											<input class="form-control" style="width: 15%;" type="text" name="memo_id" value="${memoRead.memo_id}" readonly="readonly"/>
										</div>
										<div>	
											<input class="form-control" style="width: 15%;" type="text" name="mem_name" value='<sec:authentication property="principal.user.mem_name"/>' readonly="readonly"/>
											<input type="hidden" style="width: 15%;" name="mem_id" value='<sec:authentication property="principal.username"/>' readonly="readonly"/>
										</div>
										<div class="col-mb-6">
									  <textarea class="form-control" style="resize: none;" rows="7" name="memo_content">${memoRead.memo_content}</textarea>
									  </div>
									  <div class="col-mb-3">
									  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								      <button type="submit" class="btn btn-primary" id="memoUpdate">Update</button>
								      </div>
								    </form>
								  </div>
								</div>
                            
    
                            
                            
                            
                            
                            
                            </div>
                        </div>
                    </div>
                </main>

<%@include file="../views/includes/footer.jsp" %>
</div>


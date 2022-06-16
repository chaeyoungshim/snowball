<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>

<div id="layoutSidenav_content">
<main>
<div class="container-fluid px-4 pt-4">

<div class="row">
  <div>
    <h1 class="page-header">공지메일 발신</h1>
  </div>
<!-- post 방식으로 자료를 컨트롤러로 보냄 -->
<form action="/admin/email/send.do" method="post">

발신자 명 : <input name="mail_name" ><br><br>
발신자 이메일 : <input name="sender_id" value="jsw30295@gmail.com" readonly="readonly"><br><br>
수신자 이메일 : <input name="receiver_id"><br><br>
제목 : <input name="mail_title"><br><br>
<div style="text-align:top">내용 :</div> <textarea rows="5" cols="80" name="mail_content" style="resize: none;"></textarea>
<br>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="submit" value="전송">
</form>
<span style="color:red">${message}</span>

</div>
</div>
</main>
<%@include file="../../includes/footer.jsp" %>
</div>
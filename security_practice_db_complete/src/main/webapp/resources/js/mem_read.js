/**
 * read.jsp 스크립트
 */
$(function(){
	
	//operForm 가져오기
	let operForm = $("#operForm");
	
	
	//list 버튼 클릭시  /board/list 로 이동
	$(".btn-info").click(function(){
		
		
		// operForm action 수정	
		operForm.attr("action","/mem/mem_list");		
		// operForm 보내기
		operForm.submit();
	})
	
	
	//modify 버튼 클릭시 operForm 이동
	$(".btn-default").click(function(){
		operForm.submit();
	})
	
	
})


















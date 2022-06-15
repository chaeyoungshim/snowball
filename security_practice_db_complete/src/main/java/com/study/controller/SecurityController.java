package com.study.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.dto.MemoDTO;
import com.study.dto.MsgDTO;
import com.study.service.MemoService;
import com.study.service.MsgService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SecurityController {
	
	// 5. 메인 페이지 - 쪽지
	@Autowired
	private MsgService msgService;
	
	// 6. 메인 페이지 - 메모
	@Autowired
	private MemoService memoService;
	
	
	
	
	
	
	
	
	
	@GetMapping("/login")
	public void login() {
		log.info("로그인 폼 요청");
	}
	
	
	// 로그인 에러 시 /loginError 로 이동시켜주기
	@GetMapping("/loginError")
	public String loginError(Model model) {
		log.info("로그인 틀림");
		model.addAttribute("loginError", "아이디나 비밀번호를 확인하세요.");
		return "login";
	}
	
	@GetMapping("/access-denied")
	public String accessDenied() {
		log.info("접근제한");
		return "accessdenied";
	}
	
	
	// 사용자 main 페이지
	@GetMapping("/user/index")
	public String userPage(/* @RequestParam("mem_id") */String mem_id, Model model) {
		log.info("user page 요청");
		log.info("쪽지리스트 요청");
		log.info("캘린더도 추가");
		log.info("메모도 추가");
		
		List<MsgDTO> mList = msgService.mSelect(mem_id);
		
		model.addAttribute("mList", mList);
		
		MemoDTO memoRead = memoService.memoReadRow(mem_id);
		model.addAttribute("memoRead", memoRead);
		
		return "user";
	}
	
	// 사용자 main 페이지
	@PostMapping("/user/index")
	public String memoUpdate(MemoDTO memoRead, RedirectAttributes rttr) { 
		log.info("메모 수정 요청 ");
		memoService.memoUpdate(memoRead); // 메모 수정 후 메인페이지 이동
		return "redirect:/user/index";
	}
	
	// 사용자 main 페이지 - 쪽지 부분
	@PostMapping("/user/msg/msgList")
	public String msgListPost(@RequestParam("msg_id") String msg_id, RedirectAttributes rttr) {
		log.info("메세지 리스트를 보내기");
		rttr.addAttribute("msg_id", msg_id);
		return "redirect:/user/msg/msgRead";
	}
	
	
	@GetMapping("/user/msg/msgRead")
	public String msgReadGet(String msg_id, Model model) {
		log.info("쪽지 내용 확인 요청");
		MsgDTO mRead = msgService.msgReadRow(msg_id);
		model.addAttribute("mRead", mRead);
		model.addAttribute("msg_id",msg_id);
		return "/user/msg/msg_read"; //read.jsp 보여주기
	}
	
	@GetMapping("/user/msg/msgInsert")
	public String msgInsertGet() {
		log.info("insert form 요청");
		return "/user/msg/msg_insert"; //메모 인서트 jsp 보여주기
	}
	
	@PostMapping("/user/msg/msgInsert")
	public String msgInsertPost(@Param("receiver_id") String receiver_id, @Param("msg_content") String msg_content) {
		log.info("insert 확인");
		msgService.msgInsert(receiver_id, msg_content);
		return "redirect:/user/index";
		
	}
	
	@PostMapping("/user/msg/msgDelete")
	public String msgDelete(String msg_id, RedirectAttributes rttr) {
		log.info("delete 확인 요청");
		msgService.msgDelete(msg_id);
	 return "redirect:/user/index";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 관리자 main 페이지
	@GetMapping("/admin/index")
	public String adminPage() {
		log.info("admin page 요청");
		return "admin";
	}
	
	
}














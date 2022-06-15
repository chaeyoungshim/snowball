package com.study.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.dto.ApprovalDTO;
import com.study.dto.CriteriaDTO;
import com.study.dto.MemDTO;
import com.study.dto.PageDTO;
import com.study.service.AdminUserControlService;
import com.study.service.ApprovalService;
import com.study.service.UserListService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/*")
public class AdminController {
	
	// 관리자가 사용자를 회원가입시켜주고 권한 부여해주고 리스트도 확인하기 위한 서비스 주입
	@Autowired
	private AdminUserControlService controlService;
	
	// 페이지 나누기 서비스
	@Autowired
	private UserListService listService;
	
	
	//관리자 - 직원 리스트
	@GetMapping("/memList")
	public String adminMemList(Model model, @ModelAttribute("cri") CriteriaDTO cri) {
		log.info("관리자가 사용자 리스트 확인");
		
		List<MemDTO> mem = listService.select(cri);
		
		//전체 게시물 수 구하기
		int total = listService.totalCnt();
		
		model.addAttribute("pageDto", new PageDTO(cri, total));
        model.addAttribute("mem", mem);
		
		return "/admin/mem_list";
	}
	
	
	//관리자 - 직원 추가 => 회원가입 부분
	@GetMapping("/memInsert")
	public String userInsertGet() {
		log.info("관리자가 사용자 추가해주기");
		return "/admin/mem_insert";
	}
	
	
	// 직원 추가하는 폼 처리하기 => 회원가입 부분!!!!! insertUser
	@PostMapping("/memInsert")
	public String userInsert(MemDTO user) {
		log.info("직원 추가하기(회원가입)" + user);
		
		if(controlService.userInsert(user)) {
			return "redirect:/admin/memList";
		}
		return "redirect:/admin/memInsert";
		
	}
	
	
	
	
	
}

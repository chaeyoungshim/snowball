package com.study.service;

import java.util.List;

import com.study.dto.AuthorityDTO;
import com.study.dto.MemDTO;

public interface AdminUserControlService {

	// 사용자 리스트 보기
	public List<MemDTO> userList();
	
	// 사용자 회원가입시켜주기
	// 이 때 권한 주는 메소드는 여기에 추가 x => userInsert 안에서 실행시켜줄거라
	public boolean userInsert(MemDTO user);
	
	
	
	
	// 태현
	public MemDTO getRow(String mem_id);
	public boolean update(MemDTO updateDto);
	public boolean delete(String mem_id);
}

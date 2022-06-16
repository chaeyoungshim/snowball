package com.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.dto.AuthorityDTO;
import com.study.dto.MemDTO;
import com.study.mapper.AdminUserControlMapper;

@Service
public class AdminUserControlServiceImpl implements AdminUserControlService {
	
	// AdminUserControlMapper 주입시켜놓기
	@Autowired
	private AdminUserControlMapper mapper;
	
	// 사용자가 입력한 비밀번호를 암호화시켜주기
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	
	
	@Override
	public List<MemDTO> userList() {
		return mapper.userList();
	}
	
	
	//mapper 에서 userInsert의 Mem 테이블과 authInsert의 Mem과 Authority 조인 테이블을 
	//동시에 접근해야 하기 때문에 둘 중 하나라도 실패하면 실행 불가로 만들어주기
	@Transactional 	@Override
	public boolean userInsert(MemDTO user) {
		// 비밀번호 암호화 여기서 처리해주기
		user.setMem_pwd(encoder.encode(user.getMem_pwd()));
		
		// 사용자 추가 성공하면 result 에 담기 => 회원가입 시켜주기
		boolean result = mapper.userInsert(user)==1;
		
		// 회원가입 시켜줬으면 이 때 권한도 같이 부여해주기
		AuthorityDTO auth = new AuthorityDTO(user.getMem_id(), "ROLE_USER");
		mapper.authInsert(auth);
		
//		// 관리자 처음에만 권한주기
//		auth = new AuthorityDTO(user.getMem_id(), "ROLE_ADMIN");
//		mapper.authInsert(auth);
		
		mapper.memoInsert(user);
		
		return result;
	}


	@Override
	public MemDTO getRow(String mem_id) {
		return mapper.read(mem_id);
	}


	@Override
	public boolean update(MemDTO updateDto) {
		return mapper.update(updateDto)==1?true:false;
	}


	@Override
	public boolean delete(String mem_id) {
		return mapper.delete(mem_id)==1?true:false;
	}

}

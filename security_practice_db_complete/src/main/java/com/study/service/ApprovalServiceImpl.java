package com.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.dto.ApprovalDTO;
import com.study.dto.ApprovalFileDTO;
import com.study.dto.CriteriaDTO;
import com.study.mapper.ApprovalMapper;
import com.study.mapper.AttachMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private ApprovalMapper mapper;
	
	@Autowired
	private AttachMapper attachMapper;
	
	
	@Transactional
	@Override
	public void insert(ApprovalDTO insertDto) {
		log.info("service---- "+insertDto);
		//첨부 파일 개수만큼 루프돌기
		
		mapper.commit_insert(); // 승인 먼저 해주기
	    mapper.insert(insertDto); // 승인 후 결재 기안하기
		
		if(insertDto.getAttachList() == null) {
			return;
		}
		
		insertDto.getAttachList().forEach(attach -> {
			//attach.setApproval_id(insertDto.getApproval_id());
			//첨부파일 삽입
			attachMapper.insertFile(attach);
		});
	}

	@Override
	public List<ApprovalDTO> select(CriteriaDTO cri) {
		return mapper.select(cri);
	}

	@Override
	public int totalCnt(CriteriaDTO cri) {
		return mapper.totalCnt(cri);
	}

	@Override
	public ApprovalDTO read(String att_id) {
		return mapper.read(att_id);
	}
	
	@Override
	public List<ApprovalFileDTO> attachList(String approval_id) {
		return attachMapper.list(approval_id);
	}

	@Override
	public boolean insertFile(ApprovalFileDTO attach) {
		return attachMapper.insertFile(attach)==1?true:false;
	}




}

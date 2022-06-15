package com.study.service;

import java.util.List;

import com.study.dto.ApprovalDTO;
import com.study.dto.ApprovalFileDTO;
import com.study.dto.CriteriaDTO;

public interface ApprovalService {
	//public List<ApprovalDTO> selectAll(CriteriaDTO cri);
	public void insert(ApprovalDTO insertDto);
	public List<ApprovalDTO> select(CriteriaDTO cri);
    public int totalCnt(CriteriaDTO cri);
    public ApprovalDTO read(String att_id);
    public boolean insertFile(ApprovalFileDTO attach);
    
	//첨부파일
	public List<ApprovalFileDTO> attachList(String approval_id);
    
}

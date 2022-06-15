package com.study.mapper;

import java.util.List;

import com.study.dto.ApprovalDTO;
import com.study.dto.CriteriaDTO;

public interface ApprovalMapper {
	//public List<ApprovalDTO> selectAll(CriteriaDTO cri);
	public int insert(ApprovalDTO insertDto);
	public List<ApprovalDTO> select(CriteriaDTO cri);
	public int totalCnt(CriteriaDTO cri); //처리할 인자 없으니까
	public ApprovalDTO read(String approval_id);
}

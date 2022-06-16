package com.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.study.dto.CriteriaDTO;
import com.study.dto.MemDTO;
import com.study.mapper.MemMapper;


@Service
public class MemServiceImpl implements MemService {

	@Autowired	
	private MemMapper mapper;

	@Override
	public List<MemDTO> getList(CriteriaDTO cri) {		
		return mapper.select(cri);
	}


	@Override
	public void insert(MemDTO insertDto) {	
		
		//새글등록
		mapper.insert(insertDto);

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

	@Override
	public int getTotalCnt(CriteriaDTO cri) {		
		return mapper.totalCnt(cri);
	}


}
















package com.study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.dto.MemoDTO;
import com.study.mapper.MemoMapper;

@Service
public class MemoServiceImpl implements MemoService {
	@Autowired
	private MemoMapper mapper;
	
	@Override
	public MemoDTO memoReadRow(String mem_id) {
		return mapper.memoReadRow(mem_id);
	}

	@Override
	public boolean memoUpdate(MemoDTO memoRead) {
		return mapper.memoUpdate(memoRead)==1?true:false;
	}


}

package com.study.mapper;


import com.study.dto.MemoDTO;

public interface MemoMapper {
	public MemoDTO memoReadRow(String mem_id);
	public int memoUpdate(MemoDTO memoRead);
}

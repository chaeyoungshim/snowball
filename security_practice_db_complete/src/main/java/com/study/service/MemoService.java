package com.study.service;



import com.study.dto.MemoDTO;

public interface MemoService {
	public MemoDTO memoReadRow(String mem_id);
	public boolean memoUpdate(MemoDTO memoRead);
}

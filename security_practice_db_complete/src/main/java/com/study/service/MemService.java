package com.study.service;

import java.util.List;


import com.study.dto.CriteriaDTO;
import com.study.dto.MemDTO;

public interface MemService {
	public List<MemDTO> getList(CriteriaDTO cri);
	public void insert(MemDTO insertDto);
	public MemDTO getRow(String mem_id);
	public boolean update(MemDTO updateDto);
	public boolean delete(String mem_id);
	public int getTotalCnt(CriteriaDTO cri);

}

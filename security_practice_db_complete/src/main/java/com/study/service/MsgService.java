package com.study.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.MsgDTO;

public interface MsgService {
	public List<MsgDTO> mSelect(String mem_id);
	public MsgDTO msgReadRow(String msg_id);
	public boolean msgInsert(@Param("mem_id") String mem_id ,@Param("receiver_id") String receiver_id, @Param("msg_content") String msg_content);
	public boolean msgDelete(String msg_id);
}

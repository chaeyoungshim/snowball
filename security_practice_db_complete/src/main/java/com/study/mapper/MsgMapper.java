package com.study.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.MsgDTO;

public interface MsgMapper {
	public List<MsgDTO> mSelect(String mem_id);
	public MsgDTO msgReadRow(String msg_id);
	public int msgInsert(@Param("receiver_id") String receiver_id, @Param("msg_content") String msg_content);
	public int msgDelete(String msg_id);
}

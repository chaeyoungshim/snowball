package com.study.service;

import java.util.List;

import com.study.dto.CriteriaDTO;
import com.study.dto.ReplyDTO;
import com.study.dto.ReplyPageDTO;

public interface ReplyService {
	public boolean replyInsert(ReplyDTO insertDto);
	
	public ReplyDTO replyRow(String reply_id);
	
	public boolean replyUpdate(ReplyDTO updateDto);
	
	public boolean replyDelete(String reply_id);

	
	public ReplyPageDTO getList(CriteriaDTO cri, String board_id);
	
	public boolean getCountBoard_id(String board_id);
	
	public boolean deleteAll(String board_id);
	
}

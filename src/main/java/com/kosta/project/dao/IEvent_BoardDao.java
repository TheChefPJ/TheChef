package com.kosta.project.dao;

import java.util.HashMap;
import java.util.List;

import com.kosta.project.dto.CommentDTO;
import com.kosta.project.dto.EventBoardCommentDto;
import com.kosta.project.dto.EventBoardDto;
import com.kosta.project.dto.NoticeBoardDto;

public interface IEvent_BoardDao {
	//목록보기
	public List<EventBoardDto> list(HashMap<String, Object> map);
	//게시글 갯수받아오기
	public int getListCount();
	//글쓰기
	public void write(EventBoardDto dto);
	//상세보기
	public EventBoardDto contentView(String e_no);
	//조회수 증가
	public void readcount(String e_no);
	//수정하기
	public void modify(EventBoardDto dto);
	//삭제하기
	public void delete(String e_no);
	
	public List<EventBoardDto> backpage_search_bytitle(HashMap<String, Object> map);
	public List<EventBoardDto> backpage_search_byno(HashMap<String, Object> map);
	public int getListCount_back1(HashMap<String, Object> map);
	public int getListCount_back2(HashMap<String, Object> map);
	
	//방명록 코멘트 저장
	public int insertComment(EventBoardCommentDto cdto);	
	//방명록 코멘트 조회
	public List<CommentDTO> ListComment(String e_no);
	//방명록 코멘트 삭제	
	public void commentDelete(String comment_seq);
	//삭제시 댓글도 같이 삭제
		public void deletecomment(String e_no);
}
//댓글
//public void reply(String bId, String bName, String bTitle, String bContent, String bGroup, String bStep, String bIndent);
//public void reply(BDto dto);
//public BDto reply_view(String bId);



package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;


public interface BoardService { //얘는 보드맵퍼자바와 연결

	
	public void register(BoardVO vo);
	public BoardVO get(Long bno);
	public boolean modify(BoardVO vo); //1 OR 0
	public boolean remove(Long bno);
//	public List<BoardVO> getList();
	
	
	public List<BoardVO> getList(Criteria cri);
	public List<BoardVO> getList();
	
	public int getTotal(Criteria cri);
	public int readCount(Long bno);
	public List<BoardVO> bestList(Criteria cri);
	public List<BoardAttachVO> getAttachList(Long bno);
	
	
	
}


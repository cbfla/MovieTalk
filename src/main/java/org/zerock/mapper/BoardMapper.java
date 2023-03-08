package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {
	
	
//	@Select("select*from tbl_board where bno > 0") 
	public List<BoardVO> getList(); //전체 게시글 조회
	public int insert(BoardVO vo);
	public int insertSelectKey(BoardVO vo);
	public BoardVO read(Long bno);
	public int delete(Long bno);
	public int update(BoardVO vo);
	public List<BoardVO> getListWithPaging(Criteria cri); //criteria 타입을 매개변수로 하는,,
	public int getTotalCount(Criteria cri); //criteria 타입을 매개변수로 하는,,
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	public int readCount(Long bno);
	public List<BoardVO> bestList(Criteria cri);
	
	
	
	//게시글의 페이지 번호와 읽어올 개수에 따라 게시글을 조회하는 함수
	
	
}

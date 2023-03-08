package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);//댓 등록
	public ReplyVO read(Long rno); //특정 댓글 읽어오기
	public int delete(Long rno);    //특정 댓글 삭제
	public int update(ReplyVO vo); //댓 수정
	public List<ReplyVO> getListWithPaging(   //댓 페이징
			@Param("cri")Criteria cri,
			@Param("bno") Long bno);
	
	
	public int getCountByBno(Long bno);
	
	
	

}

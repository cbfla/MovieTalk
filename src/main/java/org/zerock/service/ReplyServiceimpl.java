package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;



@Service
@Log4j
public class ReplyServiceimpl implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;
	
	@Setter(onMethod_ = @Autowired) // =============================/dho dlfjgrp?
	private BoardMapper boardMapper;
	
	
	@Transactional  //모든 작업들이 성공적으로 완료되어야 작업 묶음의 결과를 적용하고, 
	//어떤 작업에서 오류가 발생했을 때는 이전에 있던 모든 작업들이 성공적이었더라도 없었던 일처럼 완전히 되돌리는 것이 트랜잭션
	@Override
	public int register(ReplyVO vo) {
	
		boardMapper.updateReplyCnt(vo.getBno(), 1); //하나씩 증가
		log.info("리플 register =====>"+ vo);
		return replyMapper.insert(vo);
		
	}

	@Override
	public ReplyVO get(Long rno) {
		log.info("리플 get =====>"+ rno);
		return replyMapper.read(rno);
	}

	
	
	@Override
	public int modify(ReplyVO vo) {
		
		log.info("리플 modify =====>"+ vo);
		return replyMapper.update(vo);
	}
	
	
	
	
	@Transactional
	@Override
	public int remove(Long rno) {
		ReplyVO vo = replyMapper.read(rno);
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		log.info("리플 remove rno =====>"+ rno);
		log.info("리플 remove vo =====>"+ vo);
		return replyMapper.delete(rno);
	}
	
	
	

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		log.info("리플 getList cri =====>"+ cri);
		log.info("리플 getList bno =====>"+ bno);
		return replyMapper.getListWithPaging(cri, bno);
	}
	
	

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		log.info("리플 getListPage cri =====>"+ cri);
		log.info("리플 getListPage bno =====>"+ bno);
		
		return new ReplyPageDTO(
				replyMapper.getCountByBno(bno),
				replyMapper.getListWithPaging(cri, bno)
				);
	}

	
	
	
}

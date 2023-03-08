package org.zerock.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@AllArgsConstructor
@Log4j
public class BoardServiceImpl implements BoardService{
   
   @Autowired
   private BoardMapper boardMapper;
   
   @Autowired
   private BoardAttachMapper attachMapper;
   
   


   @Override
   public BoardVO get(Long bno) {
      return boardMapper.read(bno);
   }


   @Override
   public List<BoardVO> getList(Criteria cri) {  
      return boardMapper.getListWithPaging(cri);   //전체 데이터를 가져오는게 아님 //보드맵퍼자바의 값을 가지고 옴// 그리테리얼 의 1,10의 값을 가지고 옴...
   }
   
   
   
   @Override
   public int getTotal(Criteria cri) {  
	   log.info("get total count");
	   return boardMapper.getTotalCount(cri);   
   
}

@Override
public List<BoardVO> getList() {
	return boardMapper.getList();
}



@Override
public int readCount(Long bno) { //추가
return boardMapper.readCount(bno);
}






//베스트 게시판 게시글 목록 출력
@Override
public List<BoardVO> bestList(Criteria cri) {
    
    return boardMapper.bestList(cri);
    
    }







@Transactional
@Override
public void register(BoardVO board) {

	log.info("register......" + board);

	boardMapper.insertSelectKey(board);

	if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
		return;
	}

	board.getAttachList().forEach(attach -> {

		attach.setBno(board.getBno());
		attachMapper.insert(attach);
	});
}


@Override
public List<BoardAttachVO> getAttachList(Long bno) {//게시물의 첨부파일들의 목록을 가져온다.

	log.info("get Attach list by bno" + bno);

	return attachMapper.findByBno(bno);
}



@Transactional
@Override
public boolean remove(Long bno) {

	log.info("remove...." + bno);

	attachMapper.deleteAll(bno);

	return boardMapper.delete(bno) == 1;
}




@Transactional 
@Override
public boolean modify(BoardVO board) {
	
	log.info("modify......" + board);
	
	attachMapper.deleteAll(board.getBno());
	
	boolean modifyResult = boardMapper.update(board) == 1;
	
	if (modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
		
		board.getAttachList().forEach(attach -> {
			
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}
	
	return modifyResult;
}

}




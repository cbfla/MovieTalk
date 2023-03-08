package org.zerock.mapper;

import java.util.Iterator;
import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	private Long[] bnoArr = {1L,2L,3L,4L,5L}; 
	
	
	
   @Autowired
   private ReplyMapper mapper;

   
   
   @Test     //해석해보기
   public void testList() {
  	 	Criteria cri = new Criteria();
  	 	
  	 	List<ReplyVO> replies = mapper.getListWithPaging(cri,  bnoArr[0]);
  	 	
  	 	replies.forEach(reply -> log.info(reply));
 
   }    
   
   
   
   
   
   
   
   
   
   
   
   
   
   @Test
   public void testUpdate() {
  	 	Long targetRno = 2L;
  	 	
  	 	ReplyVO vo = mapper.read(targetRno);
  	 	
  	 	vo.setReply("수정수정수수정");
  	 	
  	 	int count = mapper.update(vo);
  	 	
  	 	log.info("UPDATE COUNT:" + count);
 
   }   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   @Test
   public void testDelete() {
  	 	Long targetRno = 1L;
  	 	
  	 	mapper.delete(targetRno);

   } 
   
   
   
   
   
   
   
   @Test
   public void testRead() {
  	 	Long targetRno = 5L;
  	 	
  	 	ReplyVO vo = mapper.read(targetRno);
	   
	   log.info(vo);
   } 
   
   
   
   
   
   
   @Test
   public void testCreate() {
  	
	   IntStream.rangeClosed(1,10).forEach(i->{
		   
		   ReplyVO vo = new ReplyVO();
		   
		   
		   vo.setBno(bnoArr[i%5]);
		   vo.setReply("댓글 테스트" +i);
		   vo.setReplyer("replyer" +i);
		   
		   mapper.insert(vo);
	   });
   }   
   
   
 @Test
 public void testMapper() {
	 log.info(mapper);
 }
   
}
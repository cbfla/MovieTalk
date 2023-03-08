package org.zerock.domain;

import lombok.Data;


@Data
public class PageDTO {
   
   private int startPage;
   private int endPage;
   private boolean prev, next;
   
   private int total;
   private Criteria cri;
   			//				4,10      72					
   public PageDTO(Criteria cri, int total) {//아래는 생성자 통해서 온 것들 
   
	  this.cri = cri;//pageNum(내가 보는 페이지 ex:3), amount(화면에 나오는 데이터 수 ex:10)
      this.total = total; //전체 데이터 수 (ex:152)
      
      this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;//무조건 올림       
      this.startPage = this.endPage -9;     //10 -9= 1 시작페이지는 1
      
     //시작페이지와 끝페이지
     // ===============================================================================
      
      
      								//72=> 7.2 => 8 
      
      int realEnd = (int)(Math.ceil(total*1.0)/cri.getAmount()); 
      
      if(realEnd < endPage) {  //8 <  10 참
         endPage = realEnd;    //끝 페이지가 8이된다.
      }
      
      this.prev = this.startPage > 1;      //   시작페이지가 1보다 크면 이전 버튼 생성
      this.next = this.endPage < realEnd;  // 10< 8 거직이므로 다음페이지 생성되지 않는다.
      
   }
}



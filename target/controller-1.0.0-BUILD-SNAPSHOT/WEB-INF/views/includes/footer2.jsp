<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 </div>
 <!-- /#page-wrapper -->
        
  <!-- /#wrapper -->


    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>
 
 
 
 
<style>
/* Add a dark background color to the footer */
footer {
  background-color: lightgray;
  color: #2d2d30;
  padding: 25px;
  font-size: 12px;
}

footer a {
  color: #f5f5f5;
}

footer a:hover {
  color: #777;
  text-decoration: none;
}
</style> 
 
 
        
        
        
  
<!-- Footer -->
<footer class="text-center">
  <a class="up-arrow" href="#myCarousel" data-toggle="tooltip" title="TO TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br>
  
  <p>회사소개 | 이용약관 | 고객센터 | 광고문의 | 채용정보</p> 
  <p>(주) DanMovie    대표이사 : 김단비 | 사업자등록번호 : 199-21-22310 </p> 
  <p>대표전화 : 070-2132-5832(수신자 부담전화)</p> 
  <p>COPYRIGHT(C) <strong>kimmovie.moviestory.com </strong> ALL RIGHTS RESERVED.</p> 
</footer>










<script>
$(document).ready(function(){
    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip(); 
})
</script>

        


    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({ //크기 조정 문제때문에 리스트에서 dataTables-example 찾아서 id 삭제
            responsive: true
        });
  
    $(".sidebar-nav")
    .attr("class","sidebar-nav navbar-collapse collapse")
    .attr("aria-expanded",'false')
    .attr("style","height:1px");
    
    });
    
    </script>

</body>

</html>
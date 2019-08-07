<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <link href="bootstrap-4.3.1/shop-item.css" rel="stylesheet">
<!--   <script> -->
  
  
//   	var lander_daum_map = function() {
//   		new daum.roughmap.Lander({
//   			"timestamp" : "1564365821910",
//   			"key" : "uirp"
//   		}).render();
//   	}
  
//   	$( document ).ready(function() {
//   		lander_daum_map();
// 	});
  
<!--   </script> -->
  
  
<div class="container">
<div class="row">
      <div class="col-lg-3">
        <h1 class="my-4">찾아오는 길</h1>
        <div class="list-group">
          <a href="?contentPage=B_01.jsp" class="list-group-item">찾아오는 길</a>
          <a href="?contentPage=B_02.jsp" class="list-group-item active">대중교통으로 찾기</a>
          <a href="?contentPage=B_03.jsp" class="list-group-item">자가용으로 찾기</a>
        </div>
      </div>
      <!-- /.col-lg-3 -->
      
      <div class="col-xs col-sm col-md col-lg">
      <!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->


<!--
	* 카카오맵 - 약도서비스
	* 한 페이지 내에 약도를 2개 이상 넣을 경우에는
	* 약도의 수 만큼 소스를 새로 생성, 삽입해야 합니다.
-->
<!-- 1. 약도 노드 -->
<div id="daumRoughmapContainer1565068753796" class="root_daum_roughmap root_daum_roughmap_landing" style="width:100%;height:auto;"></div>

<!-- 2. 설치 스크립트 -->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1565068753796",
		"key" : "umva"
	}).render();
</script>
      <p><h5><b>주소 : 서울 서초구 잠월동 7-3</b></h5></p>
      <p><h6>Hotel Kjoon</b></h5></p>
      <h6>대표자 : 권 준 / 매니저 : 김기윤 </h6>
      <h6>Cell : 010-3106-6004 / Phone : 02-2156-7589</h6>
      </div>
      
      </div>
      
      </div>
      <!-- /.container -->
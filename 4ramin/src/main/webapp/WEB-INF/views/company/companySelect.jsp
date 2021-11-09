<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4RAMIN</title>
    <link rel="stylesheet" href="css/custom-bs.css">
    <link rel="stylesheet" href="css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="css/bootstrap-select.min.css">
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="fonts/line-icons/style.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/animate.min.css">
    
    <script src="js/jquery.min.js"></script>
    
    <script type="text/javascript">
    
    	function likeplus() {   
    		var com_id = $("#com_id").val() ;
    		$.ajax({
    			url : "companyLike.do?com_id=" + com_id ,
    			type : "get" ,
    			data : {
    				com_id : com_id
    			} ,    			
    			success : function() {
    				likeview() 
    			}    			
    		}) 
    	}
    	
    	function likeview() {
    		var com_id = $("#com_id").val() ;
    		$.ajax({
    			url : "companyLikeSelect.do?com_id=" + com_id ,
    			type : "get" ,
    			data : {
    				com_id : com_id
    			} ,
    			success : function(result) {
    				$("#like").html("<span class='icon-heart-o mr-2 text-danger'></span>좋아요 : " + result) ;
    			}
    		}) 
    	}
    	
    </script>
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['연도', '평균연봉 (단위 : 만원)'],
          ['2019', '${salary.sal_2019}'],
          ['2020', '${salary.sal_2020}'],
          ['2021', '${salary.sal_2021}']
        ]);

        var options = {
          chart: {
            title: '연도별 신입직원 평균연봉',
            subtitle: '평균연봉',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
      
      function insertBookmark(com_id,com_name,com_intro,com_sal) {
    	  $.ajax({
    		  url : "comBookmarkInsert.do" ,
    		  type : "get" ,
    		  data : {
    			  com_id : com_id ,
    			  com_name : com_name ,
    			  com_intro : com_intro ,
    			  com_sal : com_sal
    		  } ,
    		  success : function() {
    			  alert("기업 즐겨찾기에 추가되었습니다") ;
    			  return ;
    		  } ,
    		  error : function() {
    			  alert("이미 즐겨찾기에 추가되어있습니다") ;
    		  }
    	  })
      }
    </script>
    
</head>
<body>
  <section class="site-section">
      <div class="container">
        <div class="row align-items-center mb-5">
          <div class="col-lg-8 mb-4 mb-lg-0">
            <div class="d-flex align-items-center">
              <div>
                <h2>${company.com_name }</h2>
                <div>
                  <span class="m-2"><span class="icon-room mr-2"></span>${company.com_loc }</span>
                  <span class="m-2" onclick='location.href="searchInfo.do?comName=${company.com_name}"'><span class="icon-rocket mr-3"></span>해당 기업의 공고 보러가기</span>  
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="row">
              <c:if test="${empty com_reg }">
              <c:if test="${id != 'admin' }">
              <div class="col-6">
                <a onclick="insertBookmark('${company.com_id}','${company.com_name}','${company.com_intro}','${company.com_sal}')" href="javascript:void(0)" class="btn btn-block btn-light btn-md">기업 즐겨찾기</a>
              </div>
              </c:if>
              </c:if>
              <div class="col-6">
                <a onclick="likeplus()" href="javascript:void(0)" id="like" class="btn btn-block btn-primary btn-md"><span class="icon-heart-o mr-2 text-danger"></span>좋아요 : ${company.com_like }</a>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-8">
            
            <div class="mb-5">
              <div id="columnchart_material" style="width: 730px; height: 486px;"></div>
              <!-- 지도 들어갈 자리 크기는 730 X 486 -->
            </div>

          </div>
          <div class="col-lg-4">
            <div class="bg-light p-3 border rounded mb-4">
              <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">기업개요</h3>
              <ul class="list-unstyled pl-3 mb-0">
                <li class="mb-2"><strong class="text-black">기업명 : </strong>${company.com_name }</li>
                <li class="mb-2"><strong class="text-black">기업소개 : </strong>${company.com_intro }</li>
                <li class="mb-2"><strong class="text-black">대표자 : </strong>${company.com_man }</li>
                <li class="mb-2"><strong class="text-black">사업자번호 : </strong>${company.com_reg }</li>
                <li class="mb-2"><strong class="text-black">주소 : </strong>${company.com_loc }</li>
                <li class="mb-2"><strong class="text-black">직원수 : </strong>${company.com_imp }</li>
                <li class="mb-2"><strong class="text-black">신입평균연봉 : </strong>${company.com_sal }</li>
                <li class="mb-2"><strong class="text-black">연락처 : </strong>${company.com_phone }</li>
                <li class="mb-2"><strong class="text-black">이메일 : </strong>${company.com_email }</li>
              </ul>
            </div>

            <div class="bg-light p-3 border rounded">
              <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Share</h3>
              <div class="px-3">
                <a href="https://ko-kr.facebook.com/" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-facebook"></span></a>
                <a href="https://twitter.com/?lang=ko" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-twitter"></span></a>
              </div>
            </div>

          </div>
        </div>
      </div>
      <input type="hidden" id="com_id" name="com_id" value="${company.com_id }">
    </section>
   
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/stickyfill.min.js"></script>
    <script src="js/jquery.fancybox.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.animateNumber.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    
    <script src="js/bootstrap-select.min.js"></script>
    
    <script src="js/custom.js"></script>
</body>
</html>
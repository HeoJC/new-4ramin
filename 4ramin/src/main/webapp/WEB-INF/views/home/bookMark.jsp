<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	
    	function comList() {
    		$.ajax({
    			url : "comBookmarkList.do" ,
    			type : "get" ,
    			success : function(result) {
    				let json = JSON.parse(result) ;
    				for (let key of json) {
    					$("#company").append(
    						$("<tr />").append(
    							$("<td style='width:6cm;'/>").html("기업명 : " + key.com_name) ,
    							$("<td style='width:11cm;' />").html("기업소개 : " + key.com_intro) ,
    							$("<td style='width:8cm;' />").html("추가한 날짜 : " + key.marked_date) ,
    							$('<button onclick="moveComapny(\'' + key.com_id + '\')" />').addClass('badge badge-success').html("이동") ,
    							$('<button onclick="delCompany(\'' + key.com_id + '\')" />').addClass('badge badge-danger').html("삭제")
    					)) ;
    				}
    			}
    		})
    	}
    	
    	function moveComapny(com_id) {
    		location.href = "companySelect.do?com_id=" + com_id ;    		
    	}
    	
    	function delCompany(com_id) {
    		var check = confirm("해당 즐겨찾기를 삭제하시겠습니까?") ;
    		if (check) {
    			$.ajax({
    				url : "comBookmarkDelete.do?com_id=" + com_id ,
    				type : "get" ,
    				data : {
    					com_id : com_id
    				} ,
    				success : function() {
    					alert("즐겨찾기가 삭제되었습니다") ;
    					$("#company").empty() ;
    					comList() ;
    				}
    			})
    		} else {
    			alert("즐겨찾기 삭제를 취소했습니다") ;
    		}
    	}
    	
    	function adtList() {
    		$.ajax({
    			url : "adtBookMarkList.do" ,
    			type : "get" ,
    			success : function(result) {
    				let json = JSON.parse(result) ;
    				for (let key of json) {
    					$("#adt").append(
  							$("<tr />").append(
  	    							$("<td style='width:6cm;' />").html("기업명 : " + key.com_name) ,
  	    							$("<td style='width:11cm;'/>").html("공고제목 : " + key.title) ,
  	    							$("<td style='width:8cm;' />").html("공고 마감일 : " + key.adt_exp) ,
  	    							$('<button onclick="moveAdt(\'' + key.adt_idx + '\')" />').addClass('badge badge-success').html("이동") ,
  	    							$('<button onclick="delAdt(\'' + key.title + '\')" />').addClass('badge badge-danger').html("삭제")
    					)) ;
    				}
    			}
    		})
    	}
    	
    	function moveAdt(adt_idx) {
    		location.href = "adtSelect.do?adt_idx=" + adt_idx ;    		
    	}
    	
    	function delAdt(title) {
    		var check = confirm("해당 즐겨찾기를 삭제하시겠습니까?") ;
    		if (check) {
    			$.ajax({
    				url : "adtBookmarkDelete.do?title=" + title ,
    				type : "get" ,
    				data : {
    					title : title
    				} ,
    				success : function() {
    					alert("즐겨찾기가 삭제되었습니다") ;
    					$("#adt").empty() ;
    					adtList() ;
    				}
    			})
    		} else {
    			alert("즐겨찾기 삭제를 취소했습니다") ;
    		}
    	}
    	
    	function moveComList() {
    		location.href = "companySelectList.do" ;
    	}
    	
    	function moveAdtList() {
    		location.href = "adtSelectAll.do" ;
    	}
    	
    	comList() ;
    	adtList() ;
    
    </script>
    
    <!-- ------------------------------------------------------------------------------------------------------------ -->
    <style>
      .modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal.show {
        display: block;
      }

      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;

        width: 1200px;
        height: 600px;

        padding: 40px;

        text-align: center;

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
      }
    </style>
    <!-- ------------------------------------------------------------------------------------------------------------ -->
    
</head>
<body>
    <section class="site-section" id="next">
    <div style="height:2cm;"></div>
      <div class="container">
	<!-- ------------------------------------------------------------------------------------------------------------ -->
    <div align="center" style="height:11cm;">
    <div class="modal">
    <div class="modal_body" align="center">
    <!-- ------------------------------------------------------------------------------------------------------------ -->
    
    <!-- 여기가 모달안 -->
    
    <span class="text-primary">공고 즐겨찾기</span>
    <div align="center">
    	<table class="type05" id="adt">
    	</table>
    </div>
    
    <br>
    
    <span class="text-primary">기업 즐겨찾기</span>
    <div align="center">
		<table class="type05" id="company">
		</table>
	</div>
	
	<!-- 여기까지 모달안 -->
	
	<!-- ------------------------------------------------------------------------------------------------------------ -->
    </div>
    </div>
    <button onclick="moveAdtList()" class="btn btn-primary border-width-2 d-none d-lg-inline-block">← 공고 즐겨찾기 하러가기</button>
    <button class="btn-open-popup btn btn-primary border-width-2 d-none d-lg-inline-block">내 즐겨찾기 보기</button>
    <button onclick="moveComList()" class="btn btn-primary border-width-2 d-none d-lg-inline-block">기업 즐겨찾기 하러가기 →</button>
    </div>
    
    <script>
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');

      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
    </script>    
    <!-- ------------------------------------------------------------------------------------------------------------ -->
      </div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/custom-bs.css">
    <link rel="stylesheet" href="css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="css/bootstrap-select.min.css">
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="fonts/line-icons/style.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/quill.snow.css">
    
    <script src="js/jquery.min.js"></script>
    
    <style type="text/css">
	    table.type05 {
		  border-collapse: separate;
		  border-spacing: 1px;
		  text-align: left;
		  line-height: 1.5;
		  border-top: 1px solid #ccc;
		  margin: 20px 10px;
		}
		table.type05 th {
		  width: 150px;
		  padding: 10px;
		  font-weight: bold;
		  color: #fff;
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;
		  background: #89ba16;
		}
		table.type05 td {
		  width: 350px;
		  padding: 10px;
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;
		}
    </style>
    
    <script type="text/javascript">
    
    	function userList() {
    		$.ajax({
    			url : "ajaxUserList.do" ,
    			type : "get" ,
    			success : function(result) {    
    				let json = JSON.parse(result) ;
    				for (let key of json) {
    					$("#user").append(
							$("<tr />").append(
								$("<th />").html(key.user_id) ,
								$("<td />").html(key.user_name) ,
								$("<td />").append($('<button style="background:#89ba16 ; color:#fff" onclick="delUser(\'' + key.user_id + '\')" />').html("탈퇴"))
    					))
    				}
    			}
    		})
    	}
    	
    	function companyList() {
    		$.ajax({
    			url : "AjaxCompanyList.do" ,
    			type : "get" ,
    			success : function(result) {
    				let json = JSON.parse(result) ;
    				for (let key of json) {
    					$("#company").append(
   							$("<tr />").append(
   									$("<th />").html(key.com_id) ,
   									$("<td />").html(key.com_name) ,
   									$("<td />").append($('<button style="background:#89ba16 ; color:#fff" onclick="delCompany(\'' + key.com_id + '\',\'' + key.com_pw + '\',\'' + key.com_reg + '\')" />').html("탈퇴"))
	    				))	
    				}
    			}
    		})
    	}
    	
    	function delUser(id) {
    		var check = confirm("해당 회원을 탈퇴시키겠습니까?") ;
    		if (check) {
	   			$.ajax({
	       			url : "UserDeleto.do?user_id=" + id ,
	       			type : "get" ,
	       			data : {
	       				user_id : id
	       			} ,
	       			success : function() {
	       				alert(id+"회원이 탈퇴되었습니다") ;
	       				$("#user").empty() ;
	       				userList() ;
	       			}
	       		})
    		} else {
    			alert("해당 회원 탈퇴를 취소했습니다") ;
    		}
    	}
    	
    	function delCompany(com_id , com_pw , com_reg) {
    		var check = confirm("해당 회원을 탈퇴시키겠습니까?") ;
    		if (check) {
    		$.ajax({
    			url : "companyDelete.do" ,
    			type : "get" ,
    			data : {
    				com_id : com_id ,
    				com_pw : com_pw ,
    				com_reg : com_reg
    			} ,
    			success : function() {
    				alert(com_id+"기업이 탈퇴되었습니다") ;
    				$("#company").empty() ;
    				companyList() ;
    			}
    		})
    		} else {
    			alert("해당 회원 탈퇴를 취소했습니다") ;
    		}
    	}
    	
    	userList() ;
    	companyList() ;
    	
    </script>
    
</head>
<body>
	<section class="site-section" id="accordion">
      <div class="container">
        
        <div class="row accordion justify-content-center block__76208">
          <div class="col-lg-6">
            <img src="images/admin.jpg" alt="Image" class="img-fluid rounded">
          </div>
          <div class="col-lg-5 ml-auto">
          
            <div class="accordion-item">
              <h3 class="mb-0 heading">
                <a class="btn-block h4" data-toggle="collapse" href="#collapseFive" role="button" aria-expanded="true" aria-controls="collapseFive">회원 관리<span class="icon"></span></a>
              </h3>
              <div id="collapseFive" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="body-text">
                  <table class="type05" id="user">
				  </table>
                </div>
              </div>
            </div> <!-- .accordion-item -->

            <div class="accordion-item">
              <h3 class="mb-0 heading">
                <a class="btn-block h4" data-toggle="collapse" href="#collapseSix" role="button" aria-expanded="false" aria-controls="collapseSix">기업 관리<span class="icon"></span></a>
              </h3>
              <div id="collapseSix" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="body-text">
                  <table class="type05" id="company">
				  </table>
                </div>
              </div>
            </div> <!-- .accordion-item -->
            
          </div>
        </div>
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
    <script src="js/quill.min.js"></script>
    
    
    <script src="js/bootstrap-select.min.js"></script>
    
    <script src="js/custom.js"></script>
</body>
</html>
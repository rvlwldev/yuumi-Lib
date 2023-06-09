<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
 <%@include file="/inc/common_header.jsp" %>
 	<link href="<c:url value='/css/index.css'/>" rel="stylesheet">
 
<meta charset="UTF-8">
    <style>
    .myChatbot{
      position: fixed;
      right:20px; 
      bottom: 150px;
      z-index: 1;
    }
    
      img{ 
      width:50px;
      height:50px;
      }
/*       #ff9b00 */
	#mycolor{
		background:  #ff9b00;
		padding: 4%;
		border-top-left-radius: 0.5rem;
		border-bottom-left-radius: 0.5rem;
	}
	.contact-info{
		margin-top:10%;
	}
	.contact-info img{
		margin-bottom: 15%;
	}
	.contact-info h2{
		margin-bottom: 10%;
	}
	
	/* linear-gradient(to bottom, #FFB88C, #DE6262) */
	#mycolorbody{
		background: #f5f5f5;
		padding: 3%;
		border-top-right-radius: 0.5rem;
		border-bottom-right-radius: 0.5rem;
	}
	.contact-form label{
		font-weight:600;
	}
	.contact-form button{
		background: #25274d;
		color: #fff;
		font-weight: 600;
		width: 25%;
	}
	.contact-form button:focus{
		box-shadow:none;
	}
      
    </style>
</head>
<body id="mybody">
 <%@include file="/inc/top_menu.jsp" %>

<div class="myChatbot">
	<a href="#" id="addClass">
		<img src="<c:url value='/image/chatbot.png'/>" alt="My Image">
	</a>
</div>	

	<!-- 위 메인 정보 -->
<section class="banner-sec">
        <div class="container">
    <div class="row">
            <div class="col-md-3">
        <div class="card"> 
                <div class="card-img-overlay"> <span class="badge badge-pill badge-danger">News</span> </div>
                <div class="card-body">
            <div class="news-title">
                    <h2 class=" title-small"><a href="#">Syria war: Why the battle for Aleppo matters</a></h2>
                  </div>
            <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
          </div>
              </div>
        <div class="card"> 
                <div class="card-img-overlay"> <span class="badge badge-pill badge-danger">Politics</span> </div>
                <div class="card-body">
            <div class="news-title">
                    <h2 class=" title-small"><a href="#">Key Republicans sign letter warning against</a></h2>
                  </div>
            <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
          </div>
              </div>
      </div>
            <div class="col-md-3">
        <div class="card"> 
                <div class="card-img-overlay"> <span class="badge badge-pill badge-danger">Travel</span> </div>
                <div class="card-body">
            <div class="news-title">
                    <h2 class=" title-small"><a href="#">Obamacare Appears to Be Making People Healthier</a></h2>
                  </div>
            <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
          </div>
              </div>
        <div class="card"> 
                <div class="card-img-overlay"> <span class="badge badge-pill badge-danger">News</span> </div>
                <div class="card-body">
            <div class="news-title">
                    <h2 class=" title-small"><a href="#">‘S.N.L.’ to Lose Two Longtime Cast Members</a></h2>
                  </div>
            <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
          </div>
              </div>
      </div>
            <div class="col-md-6 top-slider">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel"> 
                <!-- Indicators -->
                <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
          </ol>
                
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
                    <div class="news-block">
                <div class="news-media"></div>
                <div class="news-title">
                        <h2 class=" title-large"><a href="#">Ray madison may struggle to get best from Paul in a 4-2-3-1 formation</a></h2>
                      </div>
                <div class="news-des">Condimentum ultrices mi est a arcu at cum a elementum per cum turpis dui vulputate vestibulum in vehicula montes vel. Mauris nam suspendisse consectetur mus...</div>
                <div class="time-text"><strong>2h ago</strong></div>
                <div></div>
              </div>
                  </div>
            <div class="carousel-item">
                    <div class="news-block">
                <div class="news-media"></div>
                <div class="news-title">
                        <h2 class=" title-large"><a href="#">An Alternative Form of Mental Health Care Gains a Foothold</a></h2>
                      </div>
                <div class="news-des">Condimentum ultrices mi est a arcu at cum a elementum per cum turpis dui vulputate vestibulum in vehicula montes vel. Mauris nam suspendisse consectetur mus...</div>
                <div class="time-text"><strong>2h ago</strong></div>
                <div></div>
              </div>
                  </div>
            <div class="carousel-item">
                    <div class="news-block">
                <div class="news-media"></div>
                <div class="news-title">
                        <h2 class=" title-large"><a href="#">Key Republican Senator Says She Will Not Vote for former president!</a></h2>
                      </div>
                <div class="news-des">Condimentum ultrices mi est a arcu at cum a elementum per cum turpis dui vulputate vestibulum in vehicula montes vel. Mauris nam suspendisse consectetur mus...</div>
                <div class="time-text"><strong>2h ago</strong></div>
                <div></div>
              </div>
                  </div>
          </div>
              </div>
      </div>
          </div>
  </div>
      </section>
      
<section class="section-01">


	<!-- 메인 정보 페이지 -->

  <div class="container">
    <div class="row">
            <div class="col-lg-8 col-md-12">
        <h3 class="heading-large">Politics</h3>
        <div class="">
                <div class="col-lg-6 card">
            <div class="card"> 
                    <div class="card-body">
                <div class="news-title"><a href="#">
                  <h2 class=" title-small">Minorities Suffer From Unequal Pain Treatment</h2>
                  </a></div>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
              </div>
                  </div>
          </div>
                <div class="col-lg-6 card">
            <div class="card"> 
                    <div class="card-body">
                <div class="news-title"><a href="#">
                  <h2 class=" title-small">Minorities Suffer From Unequal Pain Treatment</h2>
                  </a></div>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
              </div>
                  </div>
          </div>
                <div class="col-lg-6 card">
            <div class="card">
                    <div class="card-body">
                <div class="news-title"><a href="#">
                  <h2 class=" title-small">Minorities Suffer From Unequal Pain Treatment</h2>
                  </a></div>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
              </div>
                  </div>
          </div>
                <div class="col-lg-6 card">
            <div class="card"> 
                    <div class="card-body">
                <div class="news-title"><a href="#">
                  <h2 class=" title-small">Minorities Suffer From Unequal Pain Treatment</h2>
                  </a></div>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
              </div>
                  </div>
          </div>
              </div>
      </div>
      
      
      
      
      <!-- 사이드 정보 -->
      
      
      
            <aside class="col-lg-4 side-bar col-md-12">
        <ul class="nav nav-tabs" role="tablist" id="myTab">
                <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home" role="tab">이번달 인기도서</a> </li>
                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile" role="tab">대출 급상승</a> </li>
                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages" role="tab">Featured</a> </li>
              </ul>
        
        <!-- Tab panes -->
        <div class="tab-content sidebar-tabing" id="nav-tabContent">
                <div class="tab-pane active" id="home" role="tabpanel">

          </div>
                <div class="tab-pane" id="profile" role="tabpanel">
<!--             <div class="media"> <a href="#"> </a>
                    <div class="media-body">
                <div class="news-title">
                        <h2 class="title-small"><a href="#">Key Republicans sign letter warning against candidate</a></h2>
                      </div>
                <div class="news-auther"><span class="time">1h ago</span></div>
              </div>
                  </div>
               <div class="media"> <a href="#"> </a>
                    <div class="media-body">
                <div class="news-title">
                        <h2 class="title-small"><a href="#">Key Republicans sign letter warning against candidate</a></h2>
                      </div>
                <div class="news-auther"><span class="time">1h ago</span></div>
              </div>
                  </div>
            <div class="media"> <a href="#"> </a>
                    <div class="media-body">
                <div class="news-title">
                        <h2 class="title-small"><a href="#">‘S.N.L.’ to Lose Two Longtime Cast Members</a></h2>
                      </div>
                <div class="news-auther"><span class="time">1h ago</span></div>
              </div>
                  </div>
            <div class="media"> <a href="#"> </a>
                    <div class="media-body">
                <div class="news-title">
                        <h2 class="title-small"><a href="#">Obamacare Appears to Be Making People Healthier</a></h2>
                      </div>
                <div class="news-auther"><span class="time">1h ago</span></div>
              </div>
                  </div> -->
          </div>
                <div class="tab-pane" id="messages" role="tabpanel">
            <div class="media"> <a href="#"> </a>
                    <div class="media-body">
                <div class="news-title">
                        <h2 class="title-small"><a href="#">Key Republicans sign letter warning against candidate</a></h2>
                      </div>
                <div class="news-auther"><span class="time">1h ago</span></div>
              </div>
                  </div>
            <div class="media"> <a href="#"> </a>
                    <div class="media-body">
                <div class="news-title">
                        <h2 class="title-small"><a href="#">‘S.N.L.’ to Lose Two Longtime Cast Members</a></h2>
                      </div>
                <div class="news-auther"><span class="time">1h ago</span></div>
              </div>
                  </div>
            <div class="media"> <a href="#"> </a>
                    <div class="media-body">
                <div class="news-title">
                        <h2 class="title-small"><a href="#">Key Republicans sign letter warning against candidate</a></h2>
                      </div>
                <div class="news-auther"><span class="time">1h ago</span></div>
              </div>
                  </div>
            <div class="media"> <a href="#"> </a>
                    <div class="media-body">
                <div class="news-title">
                        <h2 class="title-small"><a href="#">Key Republicans sign letter warning against candidate</a></h2>
                      </div>
                <div class="news-auther"><span class="time">1h ago</span></div>
              </div>
                  </div>
          </div>
              </div>
<!--         <div class="video-sec">
                <h4 class="heading-small">Featured Video</h4>
                <div class="video-block">
            <div class="embed-responsive embed-responsive-4by3">
                    <iframe class="embed-responsive-item" src="//www.youtube.com/embed/zpOULjyy-n8?rel=0" allowfullscreen></iframe>
             </div>
          </div>
              </div> -->
      </aside>
          </div>
  </div>
  <hr>
      </section>

<!-- 채팅 -->

<div class="popup-box chat-popup" id="qnimate">
 	<div class="popup-head">
	<div class="popup-head-left pull-left"><img src="<c:url value='/image/chatbot.png'/>" alt="My Image"> Yummi</div>
		<div class="popup-head-right pull-right">
			<button data-widget="remove" id="removeClass" class="chat-header-button pull-right" type="button"><i class="fas fa-times"></i></button>
        </div>
  	</div>
  	
  	<!-- chat message main -->
	<div class="popup-messages" style="height: 290px;" id="topmainM">		
	 	<div class="direct-chat-messages" id="mainMessage">			
<%-- 		<div class="chat-box-single-line">
						<abbr class="timestamp">October 8th, 2015</abbr>
			</div>				
			<!-- Message. Default to the left -->
            <div class="direct-chat-msg doted-border">
                    <div class="direct-chat-info clearfix">
                      <span class="direct-chat-name pull-left">Yummi</span>
                    </div>
                    <!-- /.direct-chat-info -->
                    <img alt="message user image" src="<c:url value='/image/chatbot.png'/>" class="direct-chat-img"><!-- /.direct-chat-img -->
                    <div class="direct-chat-text">
                      		안녕하세요?
                    </div>
			  	<div class="direct-chat-info clearfix">
                      <span class="direct-chat-timestamp pull-right">3.36 PM</span>
                </div>
				<div class="direct-chat-info clearfix">
					<span class="direct-chat-img-reply-small pull-left"></span>
					<span class="direct-chat-reply-name">Singh</span>
				</div>
                    <!-- /.direct-chat-text -->
             </div>
                  <!-- /.direct-chat-msg -->			
			<div class="chat-box-single-line">
				<abbr class="timestamp">October 9th, 2015</abbr>
			</div>	
			<!-- Message. Default to the left -->
                  <div class="direct-chat-msg doted-border">
                    <div class="direct-chat-info clearfix">
                      <span class="direct-chat-name pull-left">Yummi</span>
                    </div>
                    <!-- /.direct-chat-info -->
                    <img alt="iamgurdeeposahan" src="<c:url value='/image/chatbot.png'/>" class="direct-chat-img"><!-- /.direct-chat-img -->
                    <div class="direct-chat-text">
                      Hey bro, how’s everything going ?
                    </div>
			  <div class="direct-chat-info clearfix">
                      <span class="direct-chat-timestamp pull-right">3.36 PM</span>
              </div>
				<div class="direct-chat-info clearfix">
				  <img alt="iamgurdeeposahan" src="<c:url value='/image/chatbot.png'/>" class="direct-chat-img big-round">
				<span class="direct-chat-reply-name">Singh</span>
				</div>
                    <!-- /.direct-chat-text -->
                  </div>
                  <!-- /.direct-chat-msg -->  --%>
                </div>	
	</div>
	<div class="popup-messages-footer">
		<form  name="frm_chat"  class="popup-messages-footer" action="<c:url value='/chat/chatForm'/>" method="post" onclick="return false;" >
			<textarea id="status_message" placeholder="궁금한 사항을 입력하세요!" rows="10" cols="30" name="message"></textarea>
			<button type="button" class="btn btn-light" style="margin-bottom:20px;" id="chatButton"><i class="fas fa-paper-plane"></i></button>
		</form>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="chatBotModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">관리자에게 문의하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      
		  <div class="container contact">
			<div class="row">
				<div class="col-md-3" id="mycolor">
					<div class="contact-info">
						<img src="https://image.ibb.co/kUASdV/contact-image.png" alt="image"/>
						<h2>Contact Us</h2>
						<h4>We would love to hear from you !</h4>
					</div>
				</div>
				<div class="col-md-9" id="mycolorbody">
					<div class="contact-form">
					<form id="emailForm" method="post">
						<div class="form-group">
						  <label class="control-label col-sm-2" for="emailName">이 름 : </label>
						  <div class="col-sm-10">          
							<input type="text" class="form-control" id="emailName" placeholder="이름을 입력하세요." name="emailName">
						  </div>
						</div>
						<div class="form-group">
						  <label class="control-label col-sm-2" for="email">Email : </label>
						  <div class="col-sm-10">
							<input type="email" class="form-control" id="email" placeholder="이메일 형식에 맞게 작성해주세요" name="email">
						  </div>
						</div>
						<div class="form-group">
						  <label class="control-label col-sm-3" for="emailComment">문의 사항 :</label>
						  <div class="col-sm-10">
							<textarea class="form-control" rows="10" id="emailComment" name="emailComment"></textarea>
						  </div>
						</div>
						<div class="form-group">        
						  <div class="col-sm-offset-2 col-sm-10">
							<button id="emailSubmit" type="button" class="btn btn-default">Submit</button>
						  </div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
      </div>
    </div>
  </div>
</div><


<!-- footer -->
	<footer class="footer-classic context-dark bg-image" style="background: #2d3246;">
        <div class="container">
          <div class="row row-30">
            <div class="col-md-4 col-xl-5">
              <div class="pr-xl-4">
              	<div style="margin-top: 10px;margin-bottom: 10px;">
              		<a class="brand" href="index.html"><i class="fas fa-home"></i>&nbsp;&nbsp; 메인으로</a>
              	</div>
                <p>이 홈페이지는 4MI한테 판권이 있으며, 어떤 목적으로도 상업적으로 이용하지 않습니다.<br> yuumi Library는 모든 사람이 이용할 수 있는 도서 종합 서비스 시스템입니다.</p>
                <!-- Rights-->
                <p class="rights"><span>©  </span><span class="copyright-year">2020</span><span> </span><span>4MI Team</span><span>. </span><span>All Rights Reserved.</span></p>
              </div>
            </div>
            <div class="col-md-4">
              <h5>Contacts</h5>
              <dl class="contact-list">
                <dt>Address:</dt>
                <dd>(34856) 넥스트 IT 교육센터 <br>대전광역시 중구 계룡로 825 (용두동, 희영빌딩 2층)</dd>
              </dl>
              <dl class="contact-list">
                <dt>email:</dt>
                <dd><a href="mailto:#">nextitcenter@gmail.com</a></dd>
              </dl>
              <dl class="contact-list">
                <dt>phones:</dt>
                <dd><a href="tel:#">042-719-8850</a> <span>or</span> <a href="http://www.nextit.or.kr/">http://www.nextit.or.kr/</a>
                </dd>
              </dl>
            </div>
            <div class="col-md-4 col-xl-3">
              <h5>Links</h5>
              <ul class="nav-list">
                <li><a href="#">About</a></li>
                <li><a href="#">Projects</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Contacts</a></li>
                <li><a href="#">Pricing</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="row no-gutters social-container">
          <div class="col"><a class="social-inner" href="#"><i class="fab fa-facebook-f"></i><span>Facebook</span></a></div>
          <div class="col"><a class="social-inner" href="#"><i class="fab fa-instagram"></i><span>instagram</span></a></div>
          <div class="col"><a class="social-inner" href="#"><i class="fab fa-twitter"></i><span>twitter</span></a></div>
          <div class="col"><a class="social-inner" href="#"><i class="fab fa-google"></i><span>google</span></a></div>
        </div>
      </footer>
	<!-- ./Footer -->

	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/js/top_menu.js'/>"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://kit.fontawesome.com/4a2ee2359f.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
	
	
	$( document ).ready(function() {
		$.ajax({
			type:"POST",
			url: '<c:url value="/index/bestbook"/>',
			success : function(data) {
				
				$area=$('#home');
				str='';
				for(var i =0; i<data.length; i++){				
					str+='<div class="media"><span class="bookP">'+data[i].bookRanking+'</span>';
					str+='	<div class="media-body">';
					str+='	<div class="news-title">';
					str+='		<h2 class="title-small"><a href="book/bookView.lol?bookIsbn='+data[i].bookIsbn+'&bookName='+data[i].bookName+'&bookAuthors='+data[i].bookAuthors+'"><img src="'+data[i].bookImageUrl+'"></a></h2>';
					str+='		<h2 class="title-small"><a href="book/bookView.lol?bookIsbn='+data[i].bookIsbn+'&bookName='+data[i].bookName+'&bookAuthors='+data[i].bookAuthors+'">'+data[i].bookName+'</a></h2>';
					str+='	</div>';
					str+='	<div class="news-auther"><span class="time">'+data[i].bookAuthors+'</span></div>';
					str+='	</div>';
					str+='</div>';
					
					
				}
				$area.append(str);
				
			},error:function(request,status,error){
		        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		     }
		});
		
		
		
		$.ajax({
			type:"POST",
			url: '<c:url value="/index/upbook"/>',
			success : function(data) {
				console.log(data);
				$area=$('#profile');
				str='';
				for(var i =0; i<data.length; i++){
					var bookran=parseInt(data[i].bookNo);
					var bookbaseran=parseInt(data[i].bookBaseWeekRank);
					var diffrence=bookbaseran-bookran;
					str+='<div class="media"><p class="bookP"><span style="display: block;">'+data[i].bookNo+'</span><span class="baseRank">'+data[i].bookBaseWeekRank+'위</span><span class="rankview"><em><i class="fas fa-sort-up"></i>'+data[i].bookDifference+'</em></span></p>';
					str+='	<div class="media-body">';
					str+='	<div class="news-title">';
					str+='		<h2 class="title-small"><a href="book/bookView.lol?bookIsbn='+data[i].bookIsbn+'&bookName='+data[i].bookName+'&bookAuthors='+data[i].bookAuthors+'"><img src='+data[i].bookImageUrl+'></a></h2>';
					str+='		<h2 class="title-small"><a href="book/bookView.lol?bookIsbn='+data[i].bookIsbn+'&bookName='+data[i].bookName+'&bookAuthors='+data[i].bookAuthors+'">'+data[i].bookName+'</a></h2>';
					str+='	</div>';
					str+='	<div class="news-auther"><span class="time">'+data[i].bookAuthors+'</span></div>';
					str+='	</div>';
					str+='</div>';
					
					
				}
				$area.append(str);
				
			},error:function(request,status,error){
		        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		     }
		});
		
		
		
	});
	
	
		var str='';
		
		var monthNames = [ "1월", "2월", "3월", "4월", "5월", "6월",
		    "7월", "8월", "9월", "10월", "11월", "12월" ];
		var dayNames= ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"]
		
		$("#addClass").click(function (e) {
			e.preventDefault();
			$('#qnimate').addClass('popup-box-on');
			$.ajax({
			type:"POST",
			url: '<c:url value="/chat/chatForm"/>',
			dataType:'json',
			data: {'message':"open"},
			success : function(data) {
				var newDate = new Date();
				newDate.setDate(newDate.getDate());    
				var todaydate=newDate.getFullYear() + "년 " +monthNames[newDate.getMonth()]+ ' ' +newDate.getDate()   + '일 ' + dayNames[newDate.getDay()];
				var timestamp=newDate.getHours()+"시 "+("0"+newDate.getMinutes()).slice(-2)+"분";
				if(data.result){
					$area=$('#mainMessage');
					str ='';
					if(data.input=='open'){
						str +='<div class="chat-box-single-line">';
						str +='		<abbr class="timestamp">'+todaydate+'</abbr>';
						str +='</div>';
						
					}
					str +='<div class="direct-chat-msg doted-border">';
					str +='		<div class="direct-chat-info clearfix">';
					str +='			<span class="direct-chat-name pull-left">Yummi</span>';
					str +='		</div>';
					str +='		<img alt="message user image" src="<c:url value="/image/chatbot.png"/>" class="direct-chat-img">';
					str +='		<div class="direct-chat-text">'+data.msg.text+'</div>';
					str +='		<div class="direct-chat-info clearfix">';
					str +='			<span class="direct-chat-timestamp pull-right">'+timestamp+'</span>';
					str +='		</div>';
					str +='</div>';

					$area.append(str);			
					
					var chatAreaHeight = $("#topmainM").height();
					var maxScroll = $("#mainMessage").height() - chatAreaHeight;
					$("#topmainM").scrollTop(maxScroll);	
					
				}
	
			},error:function(request,status,error){
		        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		     }
			});

		});        
		$("#removeClass").click(function () {
			$('#qnimate').removeClass('popup-box-on');
			$('#mainMessage').empty();
			$.ajax({
				type:"POST",
				url: '<c:url value="/chat/chatClose"/>'
			})
		});
		
		function addMessage(){
			
			var frmChat=document.forms.frm_chat.message.value;
			if(frmChat==""){
				swal({
	                  title: "내용을 입력하세요.",
	                  icon: "error",
	                }).then(function(){
	                	return false;
	                });   
			}else{
				f= document.forms.frm_chat
				params= $(f).serialize();
				$.ajax({
					type:"POST",
					url: '<c:url value="/chat/chatText"/>',
					dataType: 'json',
					data : params,
					success : function(data) {
						
						var newDate = new Date();
						newDate.setDate(newDate.getDate());    
						var todaydate=newDate.getFullYear() + "년 " +monthNames[newDate.getMonth()]+ ' ' +newDate.getDate()   + '일 ' + dayNames[newDate.getDay()];
						var timestamp=newDate.getHours()+"시 "+("0"+newDate.getMinutes()).slice(-2)+"분";

						if(data.result){
							$area=$('#mainMessage');
							str ='';
							str +='<div class="direct-chat-msg doted-border">';
							str +='		<div class="direct-chat-info clearfix">';
							str +='				<span class="direct-chat-img-reply-small pull-right"></span>';
							str +='				<span class="direct-chat-reply-name pull-right">고객님</span>';
							str +='		</div>';
							str +='		<div class="direct-chat-textleft" style="background-color: #feeb08;">'+data.input+'</div>';
							str +='		<div class="direct-chat-info clearfix">';
							str +='			<span class="direct-chat-name pull-left">Yummi</span>';
							str +='		</div>';
							str +='		<img alt="message user image" src="<c:url value="/image/chatbot.png"/>" class="direct-chat-img">';
							
							if(data.msgCata.intent=='문의응답'){
								str +='		<div class="direct-chat-text">'+data.msg.text+'<br><a href="#" data-toggle="modal" data-target="#chatBotModal">여기를 클릭해주세요.<a></div>';
								
							}else{
								str +='		<div class="direct-chat-text">'+data.msg.text+'</div>';
							}
							str +='		<div class="direct-chat-info clearfix">';
							str +='			<span class="direct-chat-timestamp pull-right">'+timestamp+'</span>';
							str +='		</div>';
							str +='</div>';
							
							$area.append(str);		
							
							var chatAreaHeight = $("#topmainM").height();
							var maxScroll = $("#mainMessage").height() - chatAreaHeight;
							$("#topmainM").scrollTop(maxScroll);
							
							
							
							
							
							
							
							
						}
					}		
				}); 			
			}
			
		}
		
		$("#status_message").keydown(function(e){
			if (e.keyCode == 13 && !e.shiftKey){
					e.preventDefault();
					addMessage();
					$("textarea#status_message").val("");
					return false;
				}
			});

		$("#chatButton").click(function (e) {
			e.preventDefault();
			addMessage();
			$("textarea#status_message").val("");
		});
	
        $("#chatBotModal").on("hidden.bs.modal", function(){
        	$("#emailName").val("");
            $("#email").val("");
            $("textarea#emailComment").val("");    
        });
		
		
        $("#emailSubmit").on("click",function(){
            var formdata=$("#emailForm").serialize();
            var emailName=$('#emailName').val();
            var email=$("#email").val();
            var emailComment=$("textarea#emailComment").val();
			console.log(formdata);
            if(emailName==""){
                swal({
                    title: "이름을 입력하세요.",
                    icon: "warning",
                    buttons: '확인',
                  })
                  return false;
            }else if(emailComment==""){
                swal({
                    title: "보낼 메시지를 입력하세요.",
                    icon: "warning",
                    buttons: '확인',
                  })
                  return false;
            }else if(email.indexOf('@')<0){
                swal({
                    title: "이메일 형식으로 입력하세요.",
                    icon: "warning",
                    buttons: '확인',
                  })
                  return false;
            }else if(email==""){
                swal({
                    title: "이메일 형식으로 입력하세요.",
                    icon: "warning",
                    buttons: '확인',
                  })
                  return false;
            }
            swal({
                title: "이메일을 보내시겠습니까?",
                icon: "info",
                buttons: ['닫기','확인'],
              }).then((ok) => {
                if (ok) {
                	
                	if (ok) {
                        $area=$('#mybody');
                        str ='';
                        str+='<div class="container" id="dotcontainer">';
                        str+='	<div class="row">';
                        str+='		<div id="loader">';
                        str+='			<div class="dot"></div><div class="dot"></div><div class="dot"></div><div class="dot"></div>';
                        str+='			<div class="dot"></div><div class="dot"></div><div class="dot"></div><div class="dot"></div>';
                		str+='			<div class="lading"></div>';
                        str+='		</div>';
                        str+='	</div>';
                        str+='</div>';
                        $area.append(str);
                        $("#chatBotModal").css( "display", "contents" );
                    
                        
                    $.ajax({
                        cache:false,
                        url:"https://script.google.com/macros/s/AKfycbyP3hXWDy9f_BpFU1a8Ryr3YY80DMXRY6gF0Nku/exec",
                        type:"POST",
                        data:formdata,
                        success: function(){
                        	$("#dotcontainer").remove();
                            swal({
                                title: "전송되었습니다.",
                                icon: "success",
                                buttons: '확인',
                              }).then(function(){
                                $('#chatBotModal').modal("hide"); 
                              })
                        },
                        error : function(xhr, status) {
                            swal({
                                title: xhr,
                                text:status+"에러 입니다.",
                                icon: "error",
                                buttons: '닫기',
                              })
                              return false;
                        }
                    })
        
                }
            }
        
        })
        
        });
		
		
		
		
		
	
	
	</script>
</body>
</html>
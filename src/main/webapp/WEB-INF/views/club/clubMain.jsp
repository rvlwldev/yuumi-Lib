<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/inc/common_header.jsp"%>
<link href="<c:url value='/css/index.css'/>" rel="stylesheet">
<title>유미 라이브러리 클럽</title>
</head>
<body>
	<%@include file="/inc/top_menu.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="card">
					<div class="card-img-overlay">
						<span class="badge badge-pill badge-danger">나의 클럽<br></span>
					</div>
					<div class="card-body">
						<div class="news-title">
							<h2 class=" title-small">
								<a href="#">내가 가입한 클럽 1<br>클럽의 소식이나 새로 올라온 공지사항..?</a>
							</h2>
						</div>
						<p class="card-text">
							<small class="text-time"><em>시간..? (ex. 3 mins ago)</em></small>
						</p>
					</div>
				</div>
				<div class="card">
					<div class="card-img-overlay">
						<span class="badge badge-pill badge-danger">Politics</span>
					</div>
					<div class="card-body">
						<div class="news-title">
							<h2 class=" title-small">
								<a href="#">Key Republicans sign letter warning against</a>
							</h2>
						</div>
						<p class="card-text">
							<small class="text-time"><em>3 mins ago</em></small>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<div class="card-img-overlay">
						<span class="badge badge-pill badge-danger">Travel</span>
					</div>
					<div class="card-body">
						<div class="news-title">
							<h2 class=" title-small">
								<a href="#">Obamacare Appears to Be Making People Healthier</a>
							</h2>
						</div>
						<p class="card-text">
							<small class="text-time"><em>3 mins ago</em></small>
						</p>
					</div>
				</div>
				<div class="card">
					<div class="card-img-overlay">
						<span class="badge badge-pill badge-danger">News</span>
					</div>
					<div class="card-body">
						<div class="news-title">
							<h2 class=" title-small">
								<a href="#">‘S.N.L.’ to Lose Two Longtime Cast Members</a>
							</h2>
						</div>
						<p class="card-text">
							<small class="text-time"><em>3 mins ago</em></small>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 top-slider">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<div class="news-block">
								<div class="news-media"></div>
								<div class="news-title">
									<h2 class=" title-large">
										<a href="#">내 주변 곧 열릴 클럽모임이나 뉴스등등</a>
									</h2>
								</div>
								<div class="news-des">(클럽관리자가 올린 공지사항의 content를 일부 가져옴) 예시.한밭도서관 앞 유미 카페에서 ㄹㅇ 마스크쓰고 아무말 없이 지 할꺼 하는 모임이
								 4월 55일 새벽2시부터 2024년 13월 41일까지 시작 됩니다 오고싶으면 오고 말꺼면 마는데 중간에 못나갑니다 ...</div>
								<div class="time-text">
									<strong>2h ago</strong>
								</div>
								<div></div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="news-block">
								<div class="news-media"></div>
								<div class="news-title">
									<h2 class=" title-large">
										<a href="#">An Alternative Form of Mental Health Care
											Gains a Foothold</a>
									</h2>
								</div>
								<div class="news-des">Condimentum ultrices mi est a arcu
									at cum a elementum per cum turpis dui vulputate vestibulum in
									vehicula montes vel. Mauris nam suspendisse consectetur musㅋㅋㅋㅋㅋㅋㅋㅋ...</div>
								<div class="time-text">
									<strong>2h ago</strong>
								</div>
								<div></div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="news-block">
								<div class="news-media"></div>
								<div class="news-title">
									<h2 class=" title-large">
										<a href="#">Key Republican Senator Says She Will Not Vote
											for former president!</a>
									</h2>
								</div>
								<div class="news-des">Condimentum ultrices mi est a arcu
									at cum a elementum per cum turpis dui vulputate vestibulum in
									vehicula montes vel. Mauris nam suspendisse consectetur mus...</div>
								<div class="time-text">
									<strong>2h ago</strong>
								</div>
								<div></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<h3 class="heading-large">추천클럽 목록</h3>
		<div class="col-lg-8 col-md-12">
			<div class="">
				<div class="col-lg-6 card">
					<div class="card">
						<div class="card-body">
							<div class="news-title">
								<a href="#">
									<h2 class="title-small">추천클럽을 할지 새로생긴 클럽을 할지...</h2>
								</a>
							</div>
							<p class="card-text">추천클럽을 했을때 추천해주는 알고리즘 어케함? 새로생긴 클럽??<br>
							아니면 다른 아이디어<br>
							칸맞추기</p>
							<p class="card-text">
								<small class="text-time"><em>3 mins ago</em> <- 이런 시간 뺄지말지 결정</small>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 card">
					<div class="card">
						<div class="card-body">
							<div class="news-title">
								<a href="#">
									<h2 class="title-small">Minorities Suffer From Unequal
										Pain Treatment</h2>
								</a>
							</div>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<p class="card-text">
								<small class="text-time"><em>3 mins ago</em></small>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 card">
					<div class="card">
						<div class="card-body">
							<div class="news-title">
								<a href="#">
									<h2 class=" title-small">Minorities Suffer From Unequal
										Pain Treatment</h2>
								</a>
							</div>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<p class="card-text">
								<small class="text-time"><em>3 mins ago</em></small>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 card">
					<div class="card">
						<div class="card-body">
							<div class="news-title">
								<a href="#">
									<h2 class=" title-small">Minorities Suffer From Unequal
										Pain Treatment</h2>
								</a>
							</div>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<p class="card-text">
								<small class="text-time"><em>3 mins ago</em></small>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
	</div>
	<%@include file="/inc/footer.jsp"%>
</body>
</html>
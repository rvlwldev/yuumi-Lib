<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/inc/common_header.jsp"%>

<title>대전 도서관 목록</title>
</head>
<body>
	<%@include file="/inc/top_menu.jsp"%>

	<div class="container">
		<div class="left">
			<h1 class="title">대전 지역 도서관 목록</h1>
			<hr class="boardtitle">
		</div>
		<div class="row">
			<div class="pull-right">
				<div>
					<span id="total" class="glyphicon glyphicon-list"></span>
				</div>
			</div>

			<div id="map" style="width: 500px; height: 400px;"></div>



			<div style="float: left; width: 40%">
				<table id="mytable" class="table table-hover table-striped"
					style="text-align: center; border: 1px solid #dddddd;">
					<thead>
						<tr>
							<th scope="col"
								style="background-color: #eeeeee; text-align: center;">도서관
								이름</th>
							<!-- <th scope="col"
								style="background-color: #eeeeee; text-align: center;">주소</th> -->
							<!-- 							<th scope="col"
								style="background-color: #eeeeee; text-align: center;">전화번호</th> -->
							<!-- <th scope="col"
								style="background-color: #eeeeee; text-align: center;">운영시간</th> -->
							<th scope="col"
								style="background-color: #eeeeee; text-align: center;">홈페이지</th>
							<th scope="col"
								style="background-color: #eeeeee; text-align: center;">전화번호</th>
						</tr>
					</thead>
					<tbody class="mybody">
						<c:forEach items="${list}" var="vo" varStatus="status">
							<tr class="text-center">
								<%-- <td>${vo.libTel}</td> --%>
								<%-- <td>${vo.libAdd}</td> --%>
								<td><a
									href="libraryList.lol?libCode=${vo.libCode}&curPage=${searchVO.curPage}">${vo.libName}</a></td>
								<%-- <td>${vo.libTime}</td> --%>
								<td><a href="${vo.libUrl}">홈페이지 바로가기</a></td>
								<td>${vo.libTel}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="text-align: center;">
					<div class="text-center" style="text-align: center;">
						<ul class="pagination">

							<c:if test="${searchVO.curPage > searchVO.pageSize}">
								<li><a class="page-link"
									href="libraryList.lol?curPage=${searchVO.lastPage - searchVO.pageSize}&libCode=${detail.libCode}">
										&lt; </a>
							</c:if>
							<!-- 페이지 단위 뒤로가기 -->

							<c:forEach var="i" begin="${searchVO.firstPage}"
								end="${searchVO.lastPage}">
								<c:if test="${searchVO.curPage eq i}">
									<li class="page-item active"><a class="page-link">
											${i}</a>
								</c:if>

								<c:if test="${searchVO.curPage ne i}">
									<c:choose>

										<c:when test="${detail.libCode ne ''}">
											<li class="page-item"><a class="page-link"
												href="libraryList.lol?curPage=${i}&libCode=${detail.libCode}"
												data-page="${i}">${i}</a></li>
										</c:when>

										<c:when test="${detail.libCode eq ''}">
											<li class="page-item"><a
												href="libraryList.lol?curPage=${i}" class="page-link"
												data-page="${i}">${i}</a></li>
										</c:when>

									</c:choose>
								</c:if>
							</c:forEach>

							<c:if test="${searchVO.lastPage != searchVO.totalPageCount}">
								<li class="page-item"><a class="page-link"
									href="libraryList.lol?curPage=${searchVO.lastPage+1}&libCode=${detail.libCode}">
										&gt; </a>
							</c:if>
							<!-- 페이지 단위 앞으로가기 -->

						</ul>
					</div>
				</div>
			</div>

			<br>







			<hr class="boardtitle">
			<hr>





		</div>
	</div>
	<%@include file="/inc/footer.jsp"%>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4290105fb11c5287ec4cb13e18464873"></script>
	<script>
		var lat = "<c:out value='${detail.libLatitude}'/>";
		var lng = "<c:out value='${detail.libLongitude}'/>";

		if (lat == "" || lng == "") {
			lat = 33.450701
			lng = 126.570667
		}

		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(lat, lng),
			level : 3
		};

		var map = new kakao.maps.Map(container, options); //맵 생성

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(lat, lng);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});
		marker.setMap(map);
	</script>
</body>


</html>
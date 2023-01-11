<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
<link rel="stylesheet" href="/common/css/bootstrap.min.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/common/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$(".main_content table td").hover(
			function(){
				$(this).find(".more_info").addClass("active");
			},
			function(){
				$(".more_info").removeClass("active");
			}
		);
	});

	function checkPurchase(){
		var msg = "구매하시겠습니까?";
		if(confirm(msg)){
			alert("개발중");//location.href;
		}
		else{
			return;
		}
	}

	function checkBag(){
		var msg = "추가하시겠습니까?";
		if(confirm(msg)){
			alert("개발중");//location.href;
		}
		else{
			return;
		}
	}
	function viewProduct(cateNo, productNo){
		location.href="view.do?bbs="+cateNo+"&productNo="+productNo;		
	}
	
</script>
<style>
.slide-item{
	width:100%;
	height:auto;
}

.slide-item img{
	width:100%;
	height:auto;
}

.slider-for, .slider-nav{
	width:100%;
	height:auto;
}

</style>
</head>
<body>
<c:import url="/WEB-INF/jsp/front/common/header.jsp"/>

<div id="content">
	<div class="content_title">
		<c:choose>
			<c:when test="${param.bbs == '11' || param.bbs == '12' || param.bbs == '13' || param.bbs == '14' || param.bbs == '15'}">
				CLOTHING
			</c:when>
			<c:when test="${param.bbs == '21' || param.bbs == '22'}">
				SHOES
			</c:when>
			<c:when test="${param.bbs == '31' || param.bbs == '32' || param.bbs == '33'}">
				ACCESSORIES
			</c:when>
			<c:otherwise>
				NO CONTENT
			</c:otherwise>
		</c:choose>		
	</div>

	<div class="main_content">
		<div class="main_content_inner">
			<c:choose>
				<c:when test="${list.size() ne 0}">
					<table class="table_11">
						<colgroup>
							<col width="224px"/>							
							<col width="224px"/>
							<col width="224px"/>
						</colgroup>
						<thead><tr><td></td><td></td><td></td></tr></thead>
						<tbody>							
							<tr>						
								<c:forEach items="${list}" var="item" varStatus="loop">
									<td><img src="/image/front/clothing/top/${item.IMG1}" /><div class="more_info" onclick="javascript:viewProduct(${item.CATENO}, ${item.PRODUCTNO})">More Info..</div></td>
									<c:choose>
										<c:when test="${loop.count%3==0}">
											</tr><tr>
										</c:when>
									</c:choose>
								</c:forEach>
							</tr>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<div class="no_content">등록된 상품이 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>



<!-- 상품 정보 모달-->
<div class="modal" id="myModal" data-toggle="modal">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				카라 여름니트반팔
			</div>

			<div class="modal-body">
				<div class="slider-for">
					<div class="slide-item">
						<img src="/image/front/clothing/top/kara/kara1.JPG"/>
					</div>
					<div class="slide-item">						
						<img src="/image/front/clothing/top/kara/kara2.JPG"/>
					</div>
					<div class="slide-item">					
						<img src="/image/front/clothing/top/kara/kara3.JPG"/>
					</div>
					<div class="slide-item">					
						<img src="/image/front/clothing/top/kara/kara4.JPG"/>
					</div>
					<div class="slide-item">					
						<img src="/image/front/clothing/top/kara/kara5.JPG"/>
					</div>
				</div>

				<b>상품정보</b>
				<div class="table_03">
					<table>
						<colgroup>
							<col width="16.6%"/>
							<col width="16.6%"/>
							<col width="16.6%"/>
							<col width="16.6%"/>
							<col width="16.6%"/>
							<col width="16.6%"/>
						</colgroup>
						<tbody>
							<tr>
								<td>상품상태</td>
								<td colspan="2">새 상품</td>
								<td>상품번호</td>
								<td colspan="2">3195386530</td>
							</tr>
							<tr>
								<td>원산지</td>
								<td colspan="5">국산</td>
							</tr>
						</tbody>
					</table>
				</div>
				</br></br>
				<div class="table_03">
					<table>
						<colgroup>
							<col width="16.6%"/>
							<col width="16.6%"/>
							<col width="16.6%"/>
							<col width="16.6%"/>
							<col width="16.6%"/>
							<col width="16.6%"/>
						</colgroup>
						<tbody>
							<tr>
								<td>성별</td>
								<td colspan="2">여성용</td>
								<td>총기장</td>
								<td colspan="2">기본</td>
							</tr>
							<tr>
								<td>핏</td>
								<td colspan="2">기본핏</td>
								<td>네크라인</td>
								<td colspan="2">V넥</td>
							</tr>
							<tr>
								<td>패턴</td>
								<td colspan="2">무지</td>
								<td>색상(패션)</td>
								<td colspan="2">베이지, 카키</td>
							</tr>
							<tr>
								<td>사이즈</td>
								<td colspan="2">FREE</td>
								<td>주요소재</td>
								<td colspan="2">폴리에스테르</td>
							</tr>
							<tr>
								<td>소매기장</td>
								<td colspan="5">반팔</td>
							</tr>
						</tbody>
					</table>
				</div>

				</br></br>
				<div class="table_03">
					<table>
						<colgroup>
							<col width="16.6%"/>
							<col width="16.6%"/>
							<col width="16.6%"/>
							<col width="16.6%"/>
							<col width="16.6%"/>
							<col width="16.6%"/>
						</colgroup>
						<tbody>
							<tr>
								<td>영수증발급</td>
								<td colspan="5">신용카드전표, 현금영수증 발급</td>
							</tr>
							<tr>
								<td>A/S안내</td>
								<td colspan="5">01079338779</br>상품에 대해 궁금하신 점이 있으시면 연락주세요.</td>
							</tr>
						</tbody>
					</table>
				</div>				
			</div>




			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>				
				<button type="button" class="btn btn-primary" onclick="javascript:checkBag();">장바구니 추가</button>
				<button type="button" class="btn btn-primary" onclick="javascript:checkPurchase();">상품 구매</button>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/jsp/front/common/footer.jsp"/>

<script>
	$(document).ready(function(){
			
		 $('.slider-for').slick();

});
</script>
</body>
</html>
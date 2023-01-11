<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="mm" uri="/WEB-INF/tld/mm.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
<title>MICMAC 온라인 쇼핑몰</title>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="initial-scale=1.0"/>
<link rel="stylesheet" href="/common/css/front.css" type="text/css">
<link rel="stylesheet" href="/common/css/demo.css" type="text/css">
<link rel="stylesheet" href="/common/css/slick.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/common/js/ScrollTrigger.js"></script>
<script type="text/javascript" src="/common/js/slick.js"></script>
</head>
<script>

	$(document).ready(function(){			
		$("#user_tab").css('height', $(document).height());
		$("#user_tab .user_tab_inner").css('height', $(document).height() - 275 +"px");

		if('${param.bbs}' !=""){
			if('${param.bbs}' == '11' || '${param.bbs}' == '12' || '${param.bbs}' == '13' || '${param.bbs}' == '14' || '${param.bbs}' == '15'){
				$(".header_bottom li:nth-child(1), .clothing").addClass("active");
			}
			else if('${param.bbs}' == '21' || '${param.bbs}' == '22'){
				$(".header_bottom li:nth-child(2), .shoes").addClass("active");			
			}
			else if('${param.bbs}' == '31' || '${param.bbs}' == '32' || '${param.bbs}' == '33'){
				$(".header_bottom li:nth-child(3), .acc").addClass("active");			
			}
			else if('${param.bbs}' == '41' || '${param.bbs}' == '42'){
				$(".header_bottom li:nth-child(4), .cs").addClass("active");			
			}
			$(".header_gnb_cate .${param.bbs}").addClass("active");
		}

		/* 메인 메뉴 활성화/비활성화 */
		$("#header .header_bottom li").hover(		
			function(){			
				$(".header_gnb_cate, .header_gnb_cate ul").removeClass("active");
				$(".header_gnb_cate, .header_gnb_cate ul."+$(this).data('cate')).addClass("active");
				$(this).children("span").removeClass("active");
				$(this).children("span:nth-child(2)").addClass("active");			
			},function(){
				$(this).children("span").removeClass("active");
				$(this).children("span:nth-child(1)").addClass("active");		
			}	
		);
		$("#header .header_gnb_cate").hover(		
			function(){
			},function(){
				$(".header_gnb_cate, .header_gnb_cate ul").removeClass("active");	
			}	
		);	
		$("#header .header_gnb_cate li").hover(		
			function(){
				$(this).children("span").removeClass("active");
				$(this).children("span:nth-child(2)").addClass("active");
			},function(){
				$(this).children("span").removeClass("active");
				$(this).children("span:nth-child(1)").addClass("active");
			}	
		);	






		/* 우측 네비 활성화/비활성화 */
		$("#user_tab_control .user_tab_login, #user_tab_control .user_tab_bag, #user_tab_control .user_tab_wishlist, #user_tab_control .user_tab_search").click(function(){
			$(this).parent().animate({
				right:300
			});
			$("#user_tab").animate({
				right:0
			});
			$(".user_tab_rmt, .user_tab_link").removeClass("active");
			$(this).addClass("active");$(".user_tab_close").addClass("active");

			if($(".user_tab_login").hasClass("active")){
				$(".user_info").addClass("active");
			}
			else if($(".user_tab_bag").hasClass("active")){
				$(".user_bag_list").addClass("active");
			}
			else if($(".user_tab_wishlist").hasClass("active")){
				$(".user_wish_list").addClass("active");
			}
			else if($(".user_tab_search").hasClass("active")){
				$(".user_search").addClass("active");
			}
		});			

		/* 페이지 이동 관련	*/
		$(".header_bottom li, .header_gnb_cate li").click(function(){
			$("#naviForm").attr("action","/front/"+$(this).data('cate')+"/main.do");
			$("#bbs").val($(this).data('bbs'));
			$("#naviForm").submit();
		});

		$(".user_tab_close").click(function(){
			$(this).parent().animate({
				right:0
			});
			$("#user_tab").animate({
				right:-300
			});
			$(this).removeClass("active");$(".user_tab_rmt, .user_tab_link").removeClass("active");
		});

	});	
	
	/* 창조절 시 우측 네비 조절 */
	$(window).resize(function(){
		$("#user_tab").css('height', $(document).height());
		$("#user_tab .user_tab_inner").css('height', $(document).height() - 275 +"px");
	});	
	
	$(window).scroll(function(){
		var position=$(window).scrollTop();

		/* 상단 네비 조절 */
		if(position >$("#header .header_bottom").offset().top) {
			$("#header .header_bottom").css({
				"position":"fixed",
				"top":0				
			});
			$("#header .header_gnb_cate").css({
				"position":"fixed",
				"top":75			
			});
		}				
		else if(position < 100 ){
			$("#header .header_bottom").css("position","relative");
			$("#header .header_gnb_cate").css({
				"position":"relative",
				"top":0			
			});
		}
		/* 우측 리모컨 이동 */
		$("#user_tab_control").stop().animate({"top":position+175+"px"},300);
	});
</script>
<body>

<div id="header">
	<form id="naviForm" action="" method="post">
		<input id="bbs" name="bbs" value="" type="hidden"/>
	</form>
	<div class="header_top">
		<div class="header_gnb">
			<div class="header_logo" onclick="javascript:location.href='../main/main.do';"><span class="main_logo">MICMAC&nbsp&nbsp&nbsp&nbsp&nbsp</span></div>
		</div>
	</div>
	<div class="header_bottom">
		<div class="header_gnb">
			<ul>
				<li data-cate='clothing' data-bbs='11'><span class="active">Clothing</span><span class="kr">의류</span></li>
				<li data-cate='shoes' data-bbs='21'><span class="active">Shoes</span><span class="kr">신발</span></li>
				<li data-cate='acc' data-bbs='31'><span class="active">Acc</span><span class="kr">악세서리</span></li>
				<li data-cate='cs' data-bbs='41'><span class="active">C/S</span><span class="kr">고객센터</span></li>
			</ul>
		</div>
	</div>	
	<div class="header_gnb_cate">
		<div class="header_gnb_cate_menu">
			<ul class="clothing">
				<li class="11" data-cate='clothing' data-bbs='11'><span class="active">Top</span><span class="kr">상의</span></li>
				<li class="12" data-cate='clothing' data-bbs='12'><span class="active">Bottom</span><span class="kr">하의</span></li>
				<li class="13" data-cate='clothing' data-bbs='13'><span class="active">Dress</span><span class="kr">원피스</span></li>
				<li class="14" data-cate='clothing' data-bbs='14'><span class="active">Outer</span><span class="kr">아우터</span></li>
				<li class="15" data-cate='clothing' data-bbs='15'><span class="active">Seasonal Items</span><span class="kr">시즌 상품</span></li>
			</ul>
			<ul class="shoes">
				<li class="21" data-cate='shoes' data-bbs='21'><span class="active">Boots</span><span class="kr">부츠</span></li>
				<li class="22" data-cate='shoes' data-bbs='22'><span class="active">Heels</span><span class="kr">힐</span></li>
			</ul>
			<ul class="acc">
				<li class="31" data-cate='acc' data-bbs='31'><span class="active">Hat</span><span class="kr">모자</span></li>
				<li class="32" data-cate='acc' data-bbs='32'><span class="active">Bag</span><span class="kr">가방</span></li>
				<li class="33" data-cate='acc' data-bbs='33'><span class="active">Etc</span><span class="kr">기타</span></li>
			</ul>
			<ul class="cs">
				<li class="41" data-cate='cs' data-bbs='41'><span class="active">Notice</span><span class="kr">공지사항</span></li>
				<li class="42" data-cate='cs' data-bbs='42'><span class="active">QnA</span><span class="kr">질문/답변</span></li>
			</ul>			
		</div>
	</div>
</div>

<div id="user_tab_control">
	<div class="user_tab_rmt user_tab_login"><img class="login_icon" src="/image/sitemng/login_icon.png"/></div>
	<div class="user_tab_rmt user_tab_bag"><img class="bag_icon" src="/image/sitemng/bag_icon.png"/></div>
	<div class="user_tab_rmt user_tab_wishlist"><img class="wishlist_icon" src="/image/sitemng/wishlist_icon.png"/></div>
	<div class="user_tab_rmt user_tab_search"><img class="search_icon" src="/image/sitemng/search_icon.png"/></div>
	<div class="user_tab_rmt user_tab_close"><img class="close_icon" src="/image/sitemng/closetab_icon.png"/></div>
</div>

<div id="user_tab">
	<div class="user_tab_title">
		<div class="user_tab_title_inner">
			<c:choose>
				<c:when test="${mm:isLogin()}">
					<a href="/front/login/logoutExec.do">LOGOUT</a>
					<span>&nbsp&nbsp | &nbsp&nbsp</span>
					<a href="/front/member/mypage.do">MY PAGE</a>
				</c:when>
				<c:otherwise>
					<a href="/front/login/login.do">LOGIN</a>
					<span>&nbsp&nbsp | &nbsp&nbsp</span>
					<a href="/front/member/join.do">JOIN US</a>
				</c:otherwise>
			</c:choose>	
		</div>
	</div>
	<div class="user_tab_inner">

		<!-- 로그인 정보 -->
		<div class="user_info user_tab_link">
			<c:choose>
				<c:when test="${mm:isLogin()}">
					<div class="user_welcome">
						<c:out value="${mm:getUserNm()}"/><span>&nbsp님 반갑습니다 :)</span>
					</div>


					<div class="user_info_table table_05">
						<table>
							<colgroup>
								<col width="50%" />
								<col width="50%" />
							</colgroup>
							<tbody>
								<tr>
									<td><b>회원 등급</b></td>
									<td>
										<c:choose>	
											<c:when test="${mm:getUserGradeNo() == '1'}"><span class="green">일반회원</span></c:when>
											<c:when test="${mm:getUserGradeNo() == '50'}"><span class="red">VIP</span></c:when>
											<c:when test="${mm:getUserGradeNo() == '100'}"><span class="blue">관리자</span></c:when>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td><b>포인트</b></td>
									<td><c:out value="${mm:getPoints()}"/>&nbsp원</td>
								</tr>
							</tbody>
						</table>						
					</div>

				</c:when>
				<c:otherwise>
					<div class="user_welcome">
						<span class="please_login">로그인 해주세요 :)</span>
					</div>
				</c:otherwise>
			</c:choose>			
		</div>



		<!-- 장바구니 -->
		<div class="user_bag_list user_tab_link">
			<div class="rnav_title">BASKET</div>
			<div class="rnav_title_ul"></div>


		</div>

		<!-- 위시리스트 -->
		<div class="user_wish_list user_tab_link">
			<div class="rnav_title">WISHLIST</div>
			<div class="rnav_title_ul"></div>
			
		</div>

		<!-- 검색 -->
		<div class="user_search user_tab_link">
			<div class="rnav_title">SEARCH</div>
			<div class="rnav_title_ul"></div>
								
		</div>

	</div>
</div>


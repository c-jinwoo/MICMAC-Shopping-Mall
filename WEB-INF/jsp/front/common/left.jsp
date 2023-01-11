<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="initial-scale=1.0"/>
<link rel="stylesheet" href="/common/css/front.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

	$(document).ready(function(){
		var bbs = ${param.bbs};
		
		$("li[data-bbs='"+bbs+"']").addClass("active");
		
	});

</script>
</head>
<body>

<div id="left_gnb">
	<c:choose>
		<c:when test="${param.bbs == '11' || param.bbs == '12' || param.bbs == '13' || param.bbs == '14' || param.bbs == '15'}">
			<div class="cate_list">
				<ul>
					<li data-bbs='11' onclick="location.href='../clothing/main.do?bbs=11';">TOP</li>
					<li data-bbs='12' onclick="location.href='../clothing/main.do?bbs=12';">BOTTOM</li>
					<li data-bbs='13' onclick="location.href='../clothing/main.do?bbs=13';">DRESS</li>
					<li data-bbs='14' onclick="location.href='../clothing/main.do?bbs=14';">OUTER</li>
					<li data-bbs='15' onclick="location.href='../clothing/main.do?bbs=15';">SEASONAL ITEMS</li>
				</ul>
			</div>
		</c:when>
		<c:when test="${param.bbs == '21' || param.bbs == '22'}">
			<div class="cate_list">
				<ul>
					<li data-bbs='21' onclick="location.href='../shoes/main.do?bbs=21';">BOOTS</li>
					<li data-bbs='22' onclick="location.href='../shoes/main.do?bbs=22';">HEELS</li>
				</ul>
			</div>
		</c:when>
		<c:when test="${param.bbs == '31' || param.bbs == '32' || param.bbs == '33'}">
			<div class="cate_list">
				<ul>
					<li data-bbs='31' onclick="location.href='../acc/main.do?bbs=31';">HAT</li>
					<li data-bbs='32' onclick="location.href='../acc/main.do?bbs=32';">BAG</li>
					<li data-bbs='33' onclick="location.href='../acc/main.do?bbs=33';">ETC</li>
				</ul>
			</div>
		</c:when>
		<c:when test="${param.bbs == '41' || param.bbs == '42'}">
			<div class="cate_list">
				<ul>
					<li data-bbs='41' onclick="location.href='../cs/main.do?bbs=41';">NOTICE</li>
					<li data-bbs='42' onclick="location.href='../cs/main.do?bbs=42';">QnA</li>
				</ul>
			</div>
		</c:when>
	</c:choose>
</div>
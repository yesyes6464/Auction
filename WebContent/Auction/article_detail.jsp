<%@page import="vo.ArticleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	ArticleBean article = (ArticleBean) request.getAttribute("article");
%>
<%
	String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />

<SCRIPT language=JavaScript>
	function getTime() {

		now = new Date();
		dday = new Date(20, 08, 12, 23, 00, 00);

		// 원하는 날짜, 시간 정확하게 초단위까지 기입.

		days = (dday - now) / 1000 / 60 / 60 / 24;

		daysRound = Math.floor(days);

		hours = (dday - now) / 1000 / 60 / 60 - (24 * daysRound);

		hoursRound = Math.floor(hours);

		minutes = (dday - now) / 1000 / 60 - (24 * 60 * daysRound)
				- (60 * hoursRound);

		minutesRound = Math.floor(minutes);

		seconds = (dday - now) / 1000 - (24 * 60 * 60 * daysRound)
				- (60 * 60 * hoursRound) - (60 * minutesRound);

		secondsRound = Math.round(seconds);

		document.getElementById("counter1").innerHTML = hoursRound;

		document.getElementById("counter2").innerHTML = minutesRound;

		document.getElementById("counter3").innerHTML = secondsRound;

		newtime = window.setTimeout("getTime();", 1000);

	}
</SCRIPT>
</head>
<body>

	<jsp:include page="../include/top.jsp" />

	<article>
		<div class="content_wrap">
			<h1 align="center">게시글</h1>
			<table border="1" align="center">
				<tr>
					<td rowspan="7">상품 이미지</td>
					<td rowspan="7"><img
						src="${pageContext.request.contextPath}/<%=article.getArticle_img()%>"
						width="300" height="300"></td>
					<td>판매자ID</td>
					<td id="writer"><%=article.getArticle_writer()%></td>
					<td>작성일</td>
					<td id="date"><%=article.getRegistration_date()%></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td colspan="3"><%=article.getArticle_subject()%></td>
				</tr>
				<tr>
					<td>경매시작가</td>
					<td colspan="3"><%=article.getLimit_price()%></td>
				</tr>
				<tr>
					<td>유통기한</td>
					<td colspan="3"><%=article.getExpiration_date()%></td>
				</tr>
				<tr>
					<td>분류</td>
					<td colspan="3"><%=article.getClassification()%></td>
				</tr>
				<tr>
					<td>경매시간</td>
					<td colspan="3"><SPAN id=counter1></SPAN>시간 <SPAN id=counter2></SPAN>분
						<SPAN id=counter3></SPAN>초 <SCRIPT>
							getTime()
						</SCRIPT></td>
				</tr>
				<tr>
					<td>현재입찰가</td>
					<td colspan="3"><%=article.getNow_price()%></td>
				</tr>
			</table>
			<div class="writing_button">
				<a href="${pageContext.request.contextPath}/articleList.bo"><input
					class="post_btn" type="button" value="목록" /></a>
			</div>
		</div>
	</article>

	<jsp:include page="../include/bottom.jsp" />

</body>
</html>
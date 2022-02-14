<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="urlHome" value="/" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("div.title").css("cursor", "pointer").click(function(){
			let no = $(this).attr("id");
			let currentPage = $("#currentPage").val();
			let searchOp = $("#searchSel option:selected").text();
			let search = $("#searchText").val();
			let sortOp = $("#sort option:selected").val();
			$("#writeNo").val(no);
			$("#frm").attr("action", "${urlHome }review/detailRead?searchOp="+searchOp+"&search="+search+"&sortOp="+sortOp+"&currentPage="+currentPage);
			$("#frm").submit();
		})
		
		$("#searchButton").click(function(){
			let searchOp = $("#searchSel option:selected").text();
			let search = $("#searchText").val();
			$("#frm").attr("action", "${urlHome }review/searchReview?searchOp="+searchOp+"&search="+search);
			$("#frm").submit();
		})
		
		$("#sort").change(function(){
			let searchOp = $("#searchSel option:selected").text();
			let search = $("#searchText").val();
			let sortOp = $("#sort option:selected").val();
			$("sortOp").val(sortOp);
			$("#frm").attr("action", "${urlHome }review/reviewList?searchOp="+searchOp+"&search="+search+"&sortOp="+sortOp);
			$("#frm").submit();
		})
	})
</script>

<center>
	<br>
		<table>
			<tr align="left">
				<th style="width: 650px; height: 20px;">리뷰 목록</th>
			</tr>
		</table>
	<hr/>
	<form id="frm" action="${urlHome }review/write" method="post">
		<input type="hidden" id="writeNo" name="writeNo"/>
		<input type="hidden" id="searchOp" value="${searchOp }"/>
		<input type="hidden" id="search" value="${search }"/>
		<input type="hidden" id="sortOp" value="${sortOp }"/>
		<input type="hidden" id="currentPage" value="${currentPage}"/>
		<table>
			<tr>
				<td colspan="5" style="width:650px;" align="right">
					<select id="sort">
						<c:choose>
							<c:when test="${sortOp eq 'recent'}">
								<option value="recent" selected>최신순</option>
								<option value="hits">조회수</option>
							</c:when>
							<c:when test="${sortOp eq 'hits'}">
								<option value="recent">최신순</option>
								<option value="hits" selected>조회수</option>
							</c:when>
							<c:otherwise>
								<option value="recent" selected>최신순</option>
								<option value="hits">조회수</option>
							</c:otherwise>
						</c:choose>
					</select> 
				</td>
			</tr>
		</table>
		<table style="width: 650px;" class="table table-hover">
			<thead>
				<tr align="center" class="table-secondary">
					<th style="width: 70px; height: 20px;">글번호</th>
					<th style="width: 300qpx; height: 20px;">제 목</th>
					<th style="width: 80px; height: 20px;">작성자</th>
					<th style="width: 120px; height: 20px;">작성일</th>
					<th style="width: 80px; height: 20px;">조회수</th>
				</tr>
			</thead>
			<c:forEach var="review" items="${reviewLst}">
				<tr>
					<td style="width: 40px; height: 40px;" align="center">${review.rnum }</td>
					<td style="width: 330px; height: 40px;" align="left"><div class="title" id="${review.no }"><pre>${review.title }</pre></div></td>
					<td style="width: 80px; height: 40px;" align="center">${review.id }</td>
					<td style="width: 120px; height: 40px;" align="center">${review.writedate}</td>
					<td style="width: 80px; height: 40px;" align="center">${review.hit }</td>
				</tr>
			</c:forEach>
		</table>
		<table>
			<tr align="center">
				<td colspan="5" style="width: 650px;">
					${navi }
				</td>
			</tr>
		</table>	
		<br>
		<table>
			<tr align="right">
				<td style="width: 650px;">
					<button style="width:100px;">리뷰쓰기</button>
				</td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<td>
					<select id="searchSel">
						<c:choose>
							<c:when test="${searchOp eq '전체'}">
								<option selected>전체</option>
								<option>제목</option>
								<option>작성자</option>
							</c:when>
							<c:when test="${searchOp eq '제목'}">
								<option>전체</option>
								<option selected>제목</option>
								<option>작성자</option>
							</c:when>
							<c:when test="${searchOp eq '작성자'}">
								<option>전체</option>
								<option>제목</option>
								<option selected>작성자</option>
							</c:when>
							<c:otherwise>
								<option selected>전체</option>
								<option>제목</option>
								<option>작성자</option>
							</c:otherwise>
						</c:choose>
					</select> 
					<input type="text" id="searchText" value="${searchWord}"/>
					<button id="searchButton" style="width:100px;" class="btn btn-danger">검색</button>
				</td>
			</tr>
		</table>
	</form>
</center>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/" />

<center>
	<form>
	<br>
		<table>
			<tr align="left">
				<th style="width: 650px; height: 20px;">상세 리뷰</th>
			</tr>
		</table>
	</form>
	<hr/>
	<form action="${home }review/write" method="post">
		<input type="hidden" name="pno" value="${review.no }" />
		<input type="hidden" name="title" value="${review.title }" />
		<input type="hidden" name="id" value="${review.id}" />
		<input type="hidden" name="content" value="${review.content}" />
		
		<input type="hidden" id="searchOp" value="${searchOp }"/>
		<input type="hidden" id="search" value="${searchWord }"/>
		<input type="hidden" id="sortOp" value="${sortOp }"/>
		<table style="width: 650px;">
			<tr>
				<td colspan="2" style="width: 600px; height: 40px; color:#F08282;" valign="middle"><h3>${review.title }</h3></td>
				<td style="width: 50px; height: 40px;" align="right" valign="bottom">${review.writedate }</td>
			</tr>
			<tr>
				<td colspan=3><hr /></td>
			</tr>
			<tr>
				<td style="width: 80px; height: 40px; font-weight:bold;" valign="top">작성자</td>
				<td style="width: 220px; height: 40px;" valign="top"><input readonly="readonly" value="${review.id }"/></td>
				<td style="width: 350px; height: 40px;" align="right" valign="top">
					<a href="${home }resources/upload/${attachFileMap.SYSTEMFILE }">${attachFileMap.ORIGINFILE }</a>
				</td>
			</tr>
			<tr>
				<td style="width: 80px; font-weight:bold;" valign="top">내&nbsp;&nbsp;&nbsp;용</td>
				<td colspan="2" valign="top"><textArea readonly="readonly" style="width: 570px; height: 300px; resize:none;">${review.content }</textArea></td>
			</tr>
			<tr>
				<td colspan=3><hr /></td>
			</tr>
			<tr>
				<td colspan=3 align="right">
					<button formaction="${home }review/write" style="width: 70px;">리뷰쓰기</button>
					<button formaction="${home }review/reply" style="width: 60px;">답글</button>
					<button formaction="${home }review/update" style="width: 60px;">수정</button>
					<button formaction="${home }review/deleteReview" style="width: 60px;">삭제</button>
					<button formaction="${home }review/pageProc?searchOp=${searchOp }&search=${searchWord }&sortOp=${sortOp }&currentPage=${currentPage}" style="width: 60px;">목록</button>
				</td>
			</tr>
		</table>
	</form>
</center>
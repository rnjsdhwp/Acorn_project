<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="urlHome" value="/" />
<c:set var="update" value="${update }" />

<center> 
<form>
<br>
	<table>
		<tr align="left">
			<th style="width: 650px; height: 20px;">리뷰 작성</th>
		</tr>
	</table>
</form>
<hr/>
<form action="${urlHome }review/writeProc" method="post" enctype="multipart/form-data" >
	<input type="hidden" name="pno" value="${pno}"/>
	<table style="width: 650px; ">
		<tr>
			<td style="width: 80px; height:40px;">작성자</td>
			<td style="width: 570px; height:40px;">
				<input type=text name="id" value="user1"<%-- value="<%=session.getAttribute("id")%>" --%> readonly="readonly"/> 
			</td>
		</tr>
		<tr>
			<td  style="width: 80px; height:40px;">제&nbsp;&nbsp;&nbsp;목</td>
			<td style="width: 570px; height:40px;">
				<input type=text name="title" style="width: 570px;" value="${review.title }"/> 
			</td>
		</tr>
		<tr>
			<td  style="width: 80px; height:40px;">내&nbsp;&nbsp;&nbsp;용</td>
			<td  >
				<textarea name="content" style="width: 570px; height: 300px; resize: none;" >${review.content }</textarea>
			</td>
		</tr>
		<tr>
			<td align="right" style="height:40px;" colspan="2">
				<input type=file name="uploadFile" style="width: 300px; " /> 
			</td>
		</tr>
		<tr>
			<td align='center' height=40 colspan=2>
				<c:choose>
					<c:when test="${update eq 'update' }">
						<button formaction="${urlHome }review/updateReview" style="width: 70px;">수정</button>
					</c:when>
					<c:otherwise>
						<button style="width: 70px;">리뷰등록</button>
					</c:otherwise>
				</c:choose>
				<button formaction="${urlHome }review/cancel" style="width: 70px;">취소</button>	 
			</td>
		</tr>
	</table>
</form>
</center>
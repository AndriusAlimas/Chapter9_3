<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result page</title>
</head>
<body>
	<!--This value is output if the value attribute evaluates to null:-->
		<b>Hello <c:out value="${applicationScope.user}">guest</c:out></b>
		<hr>
		<!-- All users members can see this:-->
		<strong>Member Comments:</strong><hr>
		<c:forEach var="comment" items="${applicationScope.commentList}" varStatus="counter" >
				<br>Comment number ${counter.count}    ${comment}
		</c:forEach>
		
		<!-- userType attribute based on the user login information
	    using jstl if condition with attribute test(always in this way has to be)-->
	    <c:if test="${applicationScope.userType eq 'member'}">
			<jsp:include page="inputComments.jsp" />
	    </c:if>
	    <form action="index.jsp" method="POST">
			<input type="submit" value="back">
	    </form>
</body>
</html>
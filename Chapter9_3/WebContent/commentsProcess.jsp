<% // Add the new user comment to the commentList
  java.util.List comments = (java.util.List) application.getAttribute("commentList");
  String currentUser  = (String)application.getAttribute("user");
  if ( comments == null ) {
    comments = new java.util.ArrayList();
    application.setAttribute("commentList", comments);
  }
  comments.add("<b>" + request.getParameter("input") + "</b> >>>>> <i>" + currentUser + "</i>");
 
%>
<%-- Go back to comments page --%>
<jsp:forward page="result.jsp" />

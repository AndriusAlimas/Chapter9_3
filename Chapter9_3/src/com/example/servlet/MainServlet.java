package com.example.servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class MainServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,
			HttpServletResponse response)throws ServletException,IOException{
		// set String array of available user names 
		String[] available_userNames = new String[]{"Andrius", "Tomas", "Rita"};
			// using request object we want get ServletContext, p.s we can get using servletConfig
	        ServletContext servletContext = request.getSession().getServletContext();
	        // check form parameter if it empty or null, then we will save as application scope(context)
	        String user_name = request.getParameter("user");
	        if (user_name.isEmpty() || user_name == null) {
	            servletContext.setAttribute("user", null);
	        } else {
	            servletContext.setAttribute("user", user_name);
	        }
	        
	        // check all of String available name with that you enter in form
	        for (String name : available_userNames) {
	            if (user_name.equals(name)) { // if name exist in available name array, save this as userType member
	                servletContext.setAttribute("userType", "member");
	                break; //  if you find one, stop looking
	            } // otherwise set userType as not-member, all this goes to servlet context scope
	            servletContext.setAttribute("userType", "not-member");
	        }
	        
	        RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
	        rd.forward(request, response);
	}
}

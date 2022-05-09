
<%@page import="alg.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
Connection con =DB.Con();
String email="",pkey="";
try
{

PreparedStatement pss = con.prepareStatement("update data set status='Repo' where id='"+id+"' ");
pss.executeUpdate();   
 out.println("<script>"
				+"alert('Request Send Successfully...')"
				+"</script>");
		RequestDispatcher rd=request.getRequestDispatcher("/admin.jsp");
		rd.include(request, response); 
}
catch(Exception ex)
{
System.out.println(ex);
out.println("<script>"
				+"alert('Request Not Sent. Something went wrong.')"
				+"</script>");
		RequestDispatcher rd=request.getRequestDispatcher("/admin.jsp");
		rd.include(request, response); 
}
finally
{
con.close();
}
%>


<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="BlockChain.Block"%>
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
PreparedStatement pst = con.prepareStatement("select * from data where id='"+id+"' ");
ResultSet rs = pst.executeQuery();
String ip="",recent="",modi="",dataset="";
if(rs.next()){
    ip = rs.getString("ip");
    recent = rs.getString("recent");
    modi = rs.getString("modified");
    dataset = rs.getString("dataset");
}

Block genesisBlock = new Block(ip, "0");
Block secondBlock = new Block(recent,genesisBlock.hash);
Block thirdBlock = new Block(modi,secondBlock.hash);
Block fourthBlock = new Block(dataset,thirdBlock.hash);

PreparedStatement pss = con.prepareStatement("update data set status='Converted',h1='"+genesisBlock.hash+"',"
        + "h2='"+secondBlock.hash+"', h3='"+thirdBlock.hash+"',h4='"+fourthBlock.hash+"', t1='"+genesisBlock.getTimeStamp()+"'"
        + " , t2='"+secondBlock.getTimeStamp()+"', t3='"+thirdBlock.getTimeStamp()+"', t4='"+fourthBlock.getTimeStamp()+"',"
        + " ip='"+new String(Base64.encodeBase64(ip.getBytes()))+"', recent='"+new String(Base64.encodeBase64(recent.getBytes()))+"', "
        + "modified='"+new String(Base64.encodeBase64(modi.getBytes()))+"', dataset='"+new String(Base64.encodeBase64(dataset.getBytes()))+"'"
        + " where id='"+id+"' ");

pss.executeUpdate();   
 out.println("<script type=\"text/javascript\">"); 			
                  out.println("alert(\"Datas converted successfully...\")");
                  out.println("</script>");
		RequestDispatcher rd=request.getRequestDispatcher("/repository.jsp");
		rd.include(request, response); 
}
catch(Exception ex)
{
System.out.println(ex);
out.println("<script type=\"text/javascript\">"); 			
                  out.println("alert(\"Datas Not converted. Something went wrong...\")");
                  out.println("</script>");
		RequestDispatcher rd=request.getRequestDispatcher("/repository.jsp");
		rd.include(request, response); 
}
finally
{
con.close();
}
%>

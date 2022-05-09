

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="alg.DB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
	<meta charset="UTF-8">
	<title>Block Chain Forensic</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
    <%
        String uname = session.getAttribute("uname").toString();
        session.setAttribute("uname",uname);
    %>
	<div id="background">
		<div id="page">
			<div id="header">
				<div id="logo">
					<a href="index.html"><img src="images/banner.png" alt="LOGO" height="112" width="118"></a>
				</div>
				<div id="navigation">
					<ul>
						<li style="width:200px;">
							<a href="repository.jsp">Repository Home</a>
						</li>
                                                <li class="selected" style="width:200px;">
							<a href="viewreq.jsp">View Admin Request</a>
						</li>
                                                <li style="width:200px;">
							<a href="viewdata.jsp">View Block Datas</a>
						</li>
						<li>
							<a href="logout.jsp">Logout</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="contents">
				<div id="adbox">
					<center><h1>Blockchain-Based Digital Forensics Investigation Framework in the Internet of Things and Social Systems</h1></center>
                                        <center><img src="images/banner1.jpg" alt="Img" style="    width: 77%;"></center>
                                        
				</div>
                            
                            <div>
                                <center><h1>View Admin Security Request</h1><br>
              <table id="pro_display_table" border="0" cellspacing="1px"  style="border: 4px solid #FB9217; width:auto;height: auto;">
                                <tr>
    <th scope="row">&nbsp;</th>
    <td>&nbsp;</td>
  </tr>
         <tr>  
                                    <td align="center" style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&nbsp;&nbsp;S. No</strong></b></td>
                                    <td align="center" style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&nbsp;&nbsp;Case Id</strong></b></td>
                                    <td align="center" style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&nbsp;&nbsp;&nbsp;&nbsp;Ip Address</strong></b></td>                                      
                                    <td align="center" style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&nbsp;&nbsp;&nbsp;&nbsp;Secure Data using Block Chain</strong></b>&emsp;</td>   
         </tr>
                               <tr>
    <th scope="row">&nbsp;</th>
    <td>&nbsp;</td>
  </tr>
<%  Connection con= DB.Con();
    try{
        String status="";
                        PreparedStatement ps=con.prepareStatement("select * from data where status='Repo' ");
                        ResultSet rs=ps.executeQuery();
                                      while(rs.next())
                                      {                                          
                                         status=rs.getString("status");
                                          %>
                                <tr>
                                    <td align="center" style="color:#080606;font-weight: bold;">&nbsp;&nbsp;<%=rs.getString("id")%></td>
                                    <td align="center" style="color:#080606;font-weight: bold;">&nbsp;&nbsp;<%=rs.getString("caseid")%></td>
                                    <td align="center" style="color:#080606;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("ip")%></td>
                                    <td align="center"><a style="color:red;font-weight: bold;" href="convert.jsp?id=<%=rs.getString("id")%>" >Convert</a></td>
                                    
         
                                    <%}%>
                                                           <tr>
    <th scope="row">&nbsp;</th>
    <td>&nbsp;</td>
  </tr>
              </table><br>
</center><br>
     <%//}                                     
   }catch(Exception e){
   System.out.println(e);
   }
    finally
    {
        con.close();
    }
   %>    
                            </div>
			
				
			</div>
		</div>
		<div id="footer">
			<div>
				
				<div id="connect">
					<a  target="_blank" class="pinterest"></a> <a  target="_blank" class="facebook"></a> <a  target="_blank" class="twitter"></a> <a  target="_blank" class="googleplus"></a>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>
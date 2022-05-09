

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="alg.DB"%>
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
        String id = request.getParameter("id");
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
                                                <li style="width:200px;">
							<a href="viewreq.jsp">View Admin Request</a>
						</li>
                                                <li class="selected" style="width:200px;">
							<a href="viewdata.jsp">View Block Datas</a>
						</li>
						<li>
							<a href="logout.jsp">Logout</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="contents">
                            <div>
                                <center><h1 style="color:white">Block Chained Datas</h1></center><br>
              
<%  Connection con= DB.Con();
    try{
        String status="";
                        PreparedStatement ps=con.prepareStatement("select * from data where id='"+id+"' and status='Converted' ");
                        ResultSet rs=ps.executeQuery();
                                      if(rs.next())
                                      {                                          
                                         %>
                                         <div style="margin-left: 92px;">
                                         <span style="margin-left:40px;font-size: 19px;">Block 1 with Hash Value</span> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span style="margin-left:90px;font-size: 19px;">Block 2 with Hash Value</span><br><br><br>
                                         <textarea cols="35" rows="5"><%=rs.getString("ip")+ rs.getString("h1")%></textarea>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                         <textarea cols="35" rows="5"><%=rs.getString("h2")+rs.getString("recent")%></textarea><br><br><br><br>
                                         <span style="margin-left:40px;font-size: 19px;">Block 3 with Hash Value</span> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span style="margin-left:90px;font-size: 19px;">Block 4 with Hash Value</span><br><br><br>
                                         <textarea cols="35" rows="5"><%=rs.getString("h3")+rs.getString("modified")%></textarea> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                         <textarea cols="35" rows="5"><%=rs.getString("h4")+rs.getString("dataset")%></textarea> <br><br><br><br>
                                         </div>
     <% }                                     
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


<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
        String uname = session.getAttribute("uname").toString();
        session.setAttribute("uname",uname);
        String id = request.getParameter("id");
        Connection con = DB.Con();
        PreparedStatement ps = con.prepareStatement("select * from data where id='"+id+"' ");
        ResultSet rs = ps.executeQuery();
        String ip="",recent="",modi="",dataset="",caseid = "";
        if(rs.next()) {
            ip = rs.getString("ip");
            recent = rs.getString("recent");
            modi = rs.getString("modified");
            dataset = rs.getString("dataset");
            caseid = rs.getString("caseid");
        }
        System.out.println(ip+" "+recent+" "+modi);
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
							<a href="defence.jsp">Defence Home</a>
						</li>
                                                <li class="selected" style="width:200px;">
							<a href="viewcases.jsp">View Cases</a>
						</li>
						<li>
							<a href="logout.jsp">Logout</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="contents">
				<div id="main"> 
                                    <br><center><h1 style='color: white;'>View Original Datas</center></h1>
                                   <br>&emsp;&emsp;&emsp;&emsp;<span style="font-size: 20px;">Case Id &emsp;&emsp;&emsp;&nbsp;</span><input type="text" name="cid" value="<%=caseid%>" readonly="">
                                            <br><br>&emsp;&emsp;&emsp;&emsp;<span style="color:black;font-size: 20px;">Case Recently Accessed Directories: </span>
                                            <center><textarea name="recent" cols="60" rows="15"><%=new String (Base64.decodeBase64(recent.getBytes()))%></textarea></center> <br>
                                            &emsp;&emsp;&emsp;&emsp;<span style="color:black;font-size: 20px;">Case Modified Files: </span>
                                            <center><textarea name="modify" cols="60" rows="15"><%=new String (Base64.decodeBase64(modi.getBytes()))%></textarea></center>                                            
                                            &emsp;&emsp;&emsp;&emsp;<span style="color:black;font-size: 20px;">Case Dataset:  </span>
                                            <center><textarea name="modify" cols="60" rows="15"><%=new String (Base64.decodeBase64(dataset.getBytes()))%></textarea></center>       
                                            <br>&emsp;&emsp;&emsp;&emsp;<span style="font-size: 20px;">IP Address &emsp;&emsp;</span><input type="text" name="ip" value="<%=new String (Base64.decodeBase64(ip.getBytes()))%>" readonly=""><br>
                                            <br><br>
                                               
                                    
				</div>
				<div id="sidebar">   
					<br><br><img src="images/recent.png">
                                        <br><br><br><br>
                                        <img src="images/modi.png" style="width: 88%;"><br>
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
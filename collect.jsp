

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
						<li>
							<a href="admin.jsp">Admin Home</a>
						</li>
						<li style="width:220px;" class="selected">
							<a href="collect.jsp">Collect Forensic Data</a>
						</li>
                                                <li style="width:260px;">
							<a href="sendreq.jsp">Send Request to Repository</a>
						</li>
						<li>
							<a href="logout.jsp">Logout</a>
						</li>
						
					</ul>
				</div>
			</div>
			<div id="contents">
				
				<div id="main">
                                    <center><form action="collect1.jsp" method="post" class="contact-form">
                                                       <br> <h2>Click below button to Collect Digital Data</h2>
								<p class="text-right">
                                                                <center><input type="submit" value="Collect Data" style="color:white;background-color:green;width:120px;height:30px;"></center>
								</p>
							</form></center>
				</div>
				<div id="sidebar">
					<img src="images/banner.png">
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
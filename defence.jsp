
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
						<li class="selected" style="width:200px;">
							<a href="defence.jsp">Defence Home</a>
						</li>
                                                <li style="width:200px;">
							<a href="viewcases.jsp">View Cases</a>
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
                                        <p>The decentralized nature of blockchain technologies can well match the needs of integrity and provenances of evidences collecting in digital forensics (DF) across jurisdictional borders. 
                                        In this paper, a novel blockchain-based DF investigation framework in the Internet of Things (IoT) and social systems environment is proposed, which can provide proof of exis-tence and privacy preservation for evidence items examination. To implement such features, we present a block-enabled forensics framework for IoT, namely, IoT forensic chain (IoTFC), which can offer forensic investigation with good authenticity, immutabil-ity, traceability, resilience, and distributed trust between evi-
dential entitles as well as examiners.  </p>
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
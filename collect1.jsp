

<%@page import="java.net.InetAddress"%>
<%@page import="java.util.Random"%>
<%@page import="alg.Investigation"%>
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
        Investigation obj = new Investigation();
        String modi = obj.modifiedFile();
        String recent = obj.recentFiles();
        Random rd = new Random();
        int val = rd.nextInt(10000);
        String caseId = "FOREN_"+val;
        InetAddress inetAddress = InetAddress. getLocalHost();
        String ip = inetAddress. getHostAddress();
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
						<li style="width:220px;">
							<a href="collect.jsp" class="selected">Collect Forensic Data</a>
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
                                    &emsp;&emsp;&emsp;&emsp;<span style="color:black;font-size: 20px;">Recently Accessed Files:</span>
                                            <center><textarea name="recent" cols="60" rows="15"><%=recent%></textarea></center> <br>
                                            &emsp;&emsp;&emsp;&emsp;<span style="color:black;font-size: 20px;">Recently Modified Files:</span>
                                            <center><textarea name="modify" cols="60" rows="15"><%=modi%></textarea></center>                                            
                                            
                                        <form action="Upload" method="post" enctype="multipart/form-data">
                                            <br>&emsp;&emsp;&emsp;&emsp;<span style="font-size: 20px;">IP Address &emsp;&emsp;</span><input type="text" name="ip" value="<%=ip%>" readonly=""><br>
                                            <br>&emsp;&emsp;&emsp;&emsp;<span style="font-size: 20px;">Case Id &emsp;&emsp;&emsp;&nbsp;</span><input type="text" name="cid" value="<%=caseId%>" readonly="">
                                            <br><br>&emsp;&emsp;&emsp;&emsp;<span style="font-size: 20px;">Upload File &emsp;&nbsp;&nbsp;</span><input type="file" name="data" required="">
                                            <br><br>
                                            <br><br>
                                            <input type="submit" value="Combine All Data" style="width: 210px;height:30px;margin-left: 220px;"><br><br>
                                        </form>
                                    
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
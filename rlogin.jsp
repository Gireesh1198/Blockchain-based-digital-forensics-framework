

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
	<div id="background">
		<div id="page">
			<div id="header">
				<div id="logo">
					<a href="index.html"><img src="images/banner.png" alt="LOGO" height="112" width="118"></a>
				</div>
				<div id="navigation">
					<ul>
						<li>
							<a href="index.jsp">Home Page</a>
						</li>
						<li>
							<a href="alogin.jsp">Admin Login</a>
						</li>
						<li class="selected">
							<a href="rlogin.jsp">Repository</a>
						</li>
                                                <li>
							<a href="dlogin.jsp">Defence Team</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="contents">				
				<div id="main">
                                    <center><form action="log" method="post" class="contact-form">
                                            <h2 style="color:white;">Block Chain Repository Login</h2>
								<p>
									<label for="username">Username</label>
									<span class="control"><input type="text" name="uname" style="width:180px;height:20px;" placeholder="Username" required=""></span>
								</p>
								<p>
									<label for="password">Password</label>
									<span class="control"><input type="password" name="password" style="width:180px;height:20px;" placeholder="Password" required=""></span>
								        <input type="hidden" value="Repository" name="type">
                                                                </p>
								<p class="text-right">
                                                                <center><input type="submit" value="Login" style="width:100px;height:30px;"></center>
								</p>
							</form></center>
				</div>
				<div id="sidebar">
					<img src="images/bc.jpg" style="width: 80%;">
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
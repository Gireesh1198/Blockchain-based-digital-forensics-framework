<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            alert ( "Your Account is Logout" );
        </script>
    </head>
    <body>
        <%
        session.invalidate();        
        RequestDispatcher re=request.getRequestDispatcher("index.jsp");
                  re.include(request, response);
        %>
    </body>
</html>

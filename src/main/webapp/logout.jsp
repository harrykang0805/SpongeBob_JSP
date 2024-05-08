<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    // 로그아웃 처리 - 세션 무효화
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
</body>
</html>

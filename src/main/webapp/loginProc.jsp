<%@ page import="com.MemberMgr" %>
<%@ page import="com.bean.MemberBean" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<body>
<%
    response.setContentType("text/html; charset=UTF-8");
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String pwd= request.getParameter("pwd");

    MemberMgr memberMgr = MemberMgr.getInstance();
    boolean isSuccess = memberMgr.isMember(id, pwd);

    if (isSuccess) {
        MemberBean member = memberMgr.getMember(id);

        request.getSession();
        session.setAttribute("member", member);
        request.setAttribute("msg", "Login successful");
        response.sendRedirect("main.jsp");
    } else {
        request.setAttribute("msg", "Incorrect ID or password");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>

</body>
</html>
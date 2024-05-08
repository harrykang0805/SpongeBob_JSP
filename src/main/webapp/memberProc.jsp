<%@ page import="com.bean.MemberBean" %>
<%@ page import="com.MemberMgr" %><%--
  Created by IntelliJ IDEA.
  User: Changho
  Date: 2024-04-30
  Time: 오후 2:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    MemberBean bean = new MemberBean();

    bean.setId(request.getParameter("id"));
    bean.setPwd(request.getParameter("pwd"));
    bean.setName(request.getParameter("name"));
    bean.setGender(request.getParameter("gender").charAt(0));
    bean.setBirth(request.getParameter("birth"));
    bean.setEmail(request.getParameter("email"));
    bean.setAddress(request.getParameter("address"));
    bean.setZipcode(request.getParameter("zipcode"));
    bean.setHobby(request.getParameter("hobby"));
    bean.setJob(request.getParameter("job"));

    MemberMgr mmgr = MemberMgr.getInstance();
    if(!mmgr.isDuplicatedId(bean.getId())) {
        mmgr.insertMember(bean);
%>
        <script type="text/javascript">
                alert("회원가입 되었습니다.");
                window.location.href = "login.jsp";
        </script>
<%
        //response.sendRedirect("login.jsp");
    } else {
%>
<script type="text/javascript">
    alert("중복된 아이디");
    history.go(-1);
</script>
<%
    }
%>
</body>
</html>

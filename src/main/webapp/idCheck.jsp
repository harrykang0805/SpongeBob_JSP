<%@ page import="com.MemberMgr" %><%--
  Created by IntelliJ IDEA.
  User: Changho
  Date: 2024-04-30
  Time: 오후 4:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    MemberMgr mmgr = MemberMgr.getInstance();
    if(mmgr.isDuplicatedId(id)){
%>
<script type="text/javascript">
    alert("중복되는 아이디 입니다");
    history.go(-1);
</script>
<%
} else {
%>
<script type="text/javascript">
    alert("사용가능한 아이디 입니다");
    history.go(-1);
</script>
<%
    }
%>
</body>
</html>

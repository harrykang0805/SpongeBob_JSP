<%@ page import="com.bean.MemberBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    MemberBean member = (MemberBean) session.getAttribute("member");
    if (member == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String id = member.getId();
    String name = member.getName();
%>
<html>
<head>
    <title>Main Screen</title>
    <link rel="stylesheet" type="text/css" href="script.css">

</head>
<body>
<center>

    <div class="bgimg">
        <div class="topleft">
            <p>BIKINI CITY</p>
        </div>
        <div class="middle">
            <h1 id="typing-text"></h1>
            <hr>
            <p>Hello! <%=id %>(<%=name %>)</p>
            <p> Have a nice day!</p>
        </div>
        <div class="bottomleft">
            <a href="logout.jsp">로그아웃</a>
            <a href="update.jsp">회원정보수정</a>
            <a href="delete.jsp">회원탈퇴</a>
        </div>
    </div>


</center>
<script>
    const text = "WELCOME TO BIKINI CITY!"; // 표시할 텍스트
    let index = 0;
    const typingTextElement = document.getElementById("typing-text");

    function typeWriter() {
        typingTextElement.textContent += text.charAt(index);
        index++;
        if (index < text.length) {
            setTimeout(typeWriter, 30);
        }
    }

    // 타이핑 효과 시작
    typeWriter();

</script>
</body>
</html>

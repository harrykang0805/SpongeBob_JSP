<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log In</title>
    <style>
        body {
            background-image: url("image/pineapple.png"); /* 배경 이미지 경로 설정 */
            background-size: cover; /* 배경 이미지를 화면에 맞게 늘리거나 축소 */
            background-repeat: no-repeat; /* 배경 이미지 반복 없음 */
        }

        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        table {
            border-collapse: collapse;
        }

        tr, td {
            border: none;
        }

        input {
            border: none;
            background-color: #BDE3FF;
        }

        .container {
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .header {
            font-family: Inter;
            color: #FFEC46;
            font-size: 50px;
        }

        .tableForm {
            border-collapse: collapse;
            border: none;
        }

        .login_btn {
            width: 200px;
            height: 35px;
            border-radius: 5px;
            background-color: #F9A18D;
            color: white;
            font-weight: bold;
        }

        .login_btn:hover {
            background-color: tomato;
        }

        .sign_btn {
            width: 90px;
            height: 40px;
            border-radius: 5px;
            background-color: #FFEC46;
            gap: 10px;
            color: #90531A;
            font-weight: bold;
        }

        .sign_btn:hover {
            background-color: yellow;
        }



        .table_Id {
            height: 40px;
            width: 200px;
            border-radius: 5px;
            color: #757575;
            font-width: bold;
        }

        .login_form {
            margin-top: 50px;
        }
    </style>
</head>
<body>
<center>
    <div class="container">
        <form action="loginProc.jsp" method="post" class="login_form">

            <h2 class="header">LOG IN</h2>

            <table width="60" border="1" class="tableForm">
                <tr height="60">
                    <td width="250"><input type="text" name="id" placeholder="   ID" class="table_Id" required></td>
                </tr>

                <tr height="60" class="table_pwd">
                    <td width="250"><input type="password" name="pwd" placeholder="   Password" class="table_Id" required></td>
                </tr>

                <tr height="60">
                    <td align="center">
                        <input type="submit" value="Login" class="login_btn">&nbsp;
                    </td>
                </tr>

                <tr height="30" class="buttons">
                    <td colspan="2" align="center">

                        <input type="button" value="Sign Up" onclick="location.href='member.jsp'" class="sign_btn">&nbsp;

                        <input type="button" value="Forgot?" onclick="location.href='forget.jsp'" class="sign_btn">
                    </td>
            </table>
        </form>
    </div>
</center>
</body>
</html>

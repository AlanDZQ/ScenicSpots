<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2017/12/22
  Time: 下午4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<%--<head>--%>
<%--<title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>

<%--<button onclick="submit()">submit</button>--%>

<%--<script>--%>
<%--function submit() {--%>
<%--alert("aaa")--%>
<%--}--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>

<html>
<head></head>
<form id="table">
    <table border="1" style="border-collapse: collapse; width: 100%;">
        <tbody>
        <tr style="height: 57px;">
            <td colspan="5" style="width: 96.246%; height: 55px;"></td>
        </tr>
        <tr style="height: 51px;">
            <td style="width: 11.1458%; height: 55px;"> Name</td>
            <td style="width: 25%; height: 51px;">
                <html>
                <body><input name="0" type="text"/></body>
                </html>
            </td>
            <td style="width: 12.8125%; height: 51px;"> Sex</td>
            <td style="width: 24.6541%;">
                <html>
                <body><input name="1" type="radio" value="female"/> female</body>
                </html>
                <html>
                <body><input name="1" type="radio" value="male"/> male</body>
                </html>
            </td>
            <td style="width: 22.6336%; height: 51px;"></td>
        </tr>
        <tr style="height: 49px;">
            <td style="width: 11.1458%; height: 55px;"> City</td>
            <td style="width: 25%; height: 49px;">
                <html>
                <body><input name="2" type="t"/></body>
                </html>
            </td>
            <td style="width: 12.8125%; height: 49px;"></td>
            <td style="width: 24.6541%;"></td>
            <td style="width: 22.6336%; height: 49px;"></td>
        </tr>
        <tr style="height: 65px;">
            <td colspan="5" style="width: 11.1458%; height: 55px;"> Are you a citizen of the United States? If so, when?
                <html>
                <body><input name="3" type="radio" value="no"/> no</body>
                </html>
                <html>
                <body><input name="3" type="radio" value="yes"/> yes</body>
                </html>
            </td>
        </tr>
        </tbody>
    </table>
    <html>
    <body><input type="button" value="submit" onclick="submit()"/>
    <script>function submit() {
        document.getElementById("table").submit()
    } </script>


    <script>
        var data = "0=" + $('#0').val()+ "&1=" + $('#1').val() + "&2=" + $('#2').val() + "&3=" + $('#3').val();
    </script>
    </body>
    </html>
</form>
</html>
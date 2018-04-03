<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Заказы</title>
</head>
<body style="background-image: linear-gradient(to bottom, #5399C2, #B8C2A9); background-size: cover; padding-bottom: 750px;  text-shadow: #ffffff 0 0 1px">

<h1 align="center"><font face="Times New Roman" color="#20269E" size="7">Введите дату</font></h1>

<c:url var="saveUrl" value="/order/find" />
<form:form modelAttribute="FindDate" method="POST" action="${saveUrl}">
    <table align="center">
        <tr>
            <td><form:label path="date"><font face="Times New Roman" color="#20269E" size="5">Дата:</font></form:label></td>
            <td><form:input path="date"/></td>
        </tr>
    </table>

    <p align="center"><input type="submit" value="Продолжить" /></p>
</form:form>

</body>
</html>
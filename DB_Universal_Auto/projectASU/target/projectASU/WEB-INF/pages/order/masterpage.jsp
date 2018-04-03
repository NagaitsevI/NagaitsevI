<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Заказы</title>
</head>
<body style="background-image: linear-gradient(to bottom, #5399C2, #B8C2A9); background-size: cover; padding-bottom: 790px;">

<h1 align="center"><font face="Times New Roman" color="#20269E" size="7">Выбор мастера</font></h1>

<table style="border: 1px solid; width: 500px; text-align:center" align="center">
    <thead style="background:#20269E">
    <tr>
        <th><font face="Times New Roman" color="#f5f5dc">Фамилия</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Имя</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Специальность</font></th>
        <th colspan="3"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${masters}" var="master">

        <c:url value="/order/masteradd"  var="addUrl" >
            <c:param name="idM" value="${master.id}" />
            <c:param name="id" value="${idOrder}" />
        </c:url>

        <tr>
            <td><c:out value="${master.surname}" /></td>
            <td><c:out value="${master.name}" /></td>
            <td><c:out value="${master.specialty}" /></td>
            <td><a href="${addUrl}">Добавить</a></td>

        </tr>

    </c:forEach>
    </tbody>
</table>

<c:url var="mainUrl" value="/" />




</body>
</html>
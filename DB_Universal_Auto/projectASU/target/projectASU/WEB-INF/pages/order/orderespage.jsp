<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Заказы</title>
</head>
<body style="background-image: linear-gradient(to bottom, #5399C2, #B8C2A9); background-size: cover; padding-bottom: 450px;">
<h1 align="center"><font face="Times New Roman" color="#20269E" size="7">Заказы</font></h1>

<c:forEach items="${orders}" var="order">
    <p align="center"><b><font face="Times New Roman" color="#20269E" size="5">Заказ: №${order.id} от ${order.date} <a href="/order/delete?id=${order.id}">Удалить</a></font></b></p>
    <p align="center"><font face="Times New Roman" color="#20269E" size="5">Клиент: ${order.client.surname} ${order.client.name} &nbsp;&nbsp; Мастер: ${order.master.surname} ${order.master.name}</font></p>
    <p align="center"><font face="Times New Roman" color="#20269E"size="5">Услуги:</font></p>
    <p align="center"><font face="Times New Roman" color="#20269E">
    <c:forEach items="${order.serviceList}" var="service">
        ${service.name}&nbsp;&nbsp;
    </c:forEach>
    </font></p>

</c:forEach>

<c:if test="${empty orders}">
    <p align="center"><font face="Times New Roman" color="#20269E" size="5">Нет заказов с такой датой или дата введена неверно.</font></p>
</c:if>



<p align="center"><font face="Times New Roman" color="#20269E" size="5"><a href="/">Главное меню</a></font></p>

</body>
</html>

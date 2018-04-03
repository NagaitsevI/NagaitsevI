<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Клиенты</title>
</head>
<body style="background-image: linear-gradient(to bottom, #5399C2, #B8C2A9); background-size: cover; padding-bottom: 690px;">
<h1 align="center"><font face="Times New Roman" color="#20269E" size="7">Клиенты</font></h1>

<c:url var="addUrl" value="/client/add" />

<table style="border: 1px solid; width: 500px; text-align:center" align="center">
    <thead style="background:#20269E">
    <tr>
        <th><font face="Times New Roman" color="#f5f5dc">Фамилия</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Имя</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Телефон</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Марка машины</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Модель машины</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Регистрационный знак</font></th>
        <th colspan="3"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${clients}" var="client">

           <c:url var="editUrl" value="/client/edit?id=${client.id}" />
           <c:url var="deleteUrl" value="/client/delete?id=${client.id}" />
           <c:url var="orderUrl" value="/order/add?id=${client.id}" />

           <tr>
               <td><c:out value="${client.surname}" /></td>
               <td><c:out value="${client.name}" /></td>
               <td><c:out value="${client.phone}" /></td>
               <td><c:out value="${client.brand}" /></td>
               <td><c:out value="${client.model}" /></td>
               <td><c:out value="${client.registration_plate}" /></td>

               <td><a href="${editUrl}">Изменить</a></td>
               <td><a href="${deleteUrl}">Удалить</a></td>
               <td><a href="${orderUrl}">Оформить заказ</a></td>
           </tr>

    </c:forEach>
    </tbody>
</table>



<c:if test="${empty clients}">
<p align="center"><font face="Times New Roman" color="#20269E" size="4">Еще не добавлено клиентов.</font></p>
</c:if>
<p align="center"><font face="Times New Roman" color="#20269E" size="4"><a href="/">Главное меню</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${addUrl}">Добавить клиента</a></font></p>


</body>
</html>

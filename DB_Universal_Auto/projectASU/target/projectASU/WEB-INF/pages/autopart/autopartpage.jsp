<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Запчасти</title>
</head>
<body style="background-image: linear-gradient(to bottom, #5399C2, #B8C2A9); background-size: cover; padding-bottom: 730px;">
<h1 align="center"><font face="Times New Roman" color="#20269E" size="7">Запчасти</font></h1>

<c:url var="addUrl" value="/autopart/add" />

<table style="border: 1px solid; width: 500px; text-align:center" align="center">
    <thead style="background:#20269E">
    <tr>
        <th><font face="Times New Roman" color="#f5f5dc">Наименование</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Количество</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Стоимость</font></th>
        <th colspan="3"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${autoparts}" var="autopart">

           <c:url var="editUrl" value="/autopart/edit?id=${autopart.id}" />
           <c:url var="deleteUrl" value="/autopart/delete?id=${autopart.id}" />

           <tr>
               <td><c:out value="${autopart.name}" /></td>
               <td><c:out value="${autopart.number}" /></td>
               <td><c:out value="${autopart.price}" /></td>

               <td><a href="${editUrl}">Изменить</a></td>
               <td><a href="${deleteUrl}">Удалить</a></td>
           </tr>

    </c:forEach>

    </tbody>
</table>



<c:if test="${empty autoparts}">
    <p align="center"><font face="Times New Roman" color="#20269E" size="4">Еще не добавлено запчастей.</font></p>
</c:if>
<p align="center"><font face="Times New Roman" color="#20269E" size="4" ><a href="/">Главное меню</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${addUrl}">Добавить запчасть</a></font></p>

</body>
</html>

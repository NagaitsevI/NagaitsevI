<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Услуги</title>
</head>
<body style="background-image: linear-gradient(to bottom, #5399C2, #B8C2A9); background-size: cover; padding-bottom: 700px;">
<h1 align="center"><font face="Times New Roman" color="#20269E" size="7">Услуги</font></h1>

<c:url var="addUrl" value="/service/add" />

<table style="border: 1px solid; width: 500px; text-align:center" align="center">
    <thead style="background:#20269E">
    <tr>
        <th><font face="Times New Roman" color="#f5f5dc">Наименование</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Стоимость</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Запчасть</font></th>
        <th colspan="3"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${services}" var="service">

           <c:url var="deleteUrl" value="/service/delete?id=${service.id}" />

        <c:if test="${!empty service.autopartList}">
            <c:forEach items="${service.autopartList}" var="autopart">
                <tr>
                    <td><c:out value="${service.name}" /></td>
                    <td><c:out value="${service.price}" /></td>
                    <td><c:out value="${autopart.name}" /></td>

                    <td><a href="${deleteUrl}">Удалить</a></td>
                </tr>
            </c:forEach>
        </c:if>

        <c:if test="${empty service.autopartList}">
            <tr>
                <td><c:out value="${service.name}" /></td>
                <td><c:out value="${service.price}" /></td>

                <td><a href="${deleteUrl}">Удалить</a></td>
            </tr>

        </c:if>


    </c:forEach>
    </tbody>
</table>



<c:if test="${empty services}">
    <p align="center"><font face="Times New Roman" color="#20269E" size="5">Еще не добавлено услуг.</font></p>
</c:if>

<p align="center"><font face="Times New Roman" color="#20269E" size="5"><a href="/">Главное меню</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${addUrl}">Добавить услугу</a></font></p>


</body>
</html>

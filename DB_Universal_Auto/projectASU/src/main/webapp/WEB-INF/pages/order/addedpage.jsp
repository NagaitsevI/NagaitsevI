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
<body style="background-image: linear-gradient(to bottom, #5399C2, #B8C2A9); background-size: cover; padding-bottom: 740px;">

<h1 align="center"><font face="Times New Roman" color="#20269E" size="7">Выбор услуги</font></h1>

<table style="border: 1px solid; width: 500px; text-align:center" align="center">
    <thead style="background:#20269E">
    <tr>
        <th><font face="Times New Roman" color="#f5f5dc">Наименование</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Стоимость</font></th>
        <th colspan="3"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${services}" var="service">
        <c:set var="check" value="0" />

        <c:url value="/order/service"  var="addUrl" >
            <c:param name="idS" value="${service.id}" />
            <c:param name="id" value="${order.id}" />
        </c:url>

        <tr>


            <c:if test="${!empty order.serviceList}">
                <c:forEach items="${order.serviceList}" var="serauto">
                    <c:if test="${service.name == serauto.name}">
                        <c:set var="check" value="1" />
                    </c:if>
                </c:forEach>
                <c:if test="${check != 1}">
                    <td><c:out value="${service.name}" /></td>
                    <td><c:out value="${service.price}" /></td>
                    <td><a href="${addUrl}">Добавить</a></td>
                </c:if>
                <c:if test="${check == 1}">
                    <td><c:out value="${service.name}" /></td>
                    <td><c:out value="${service.price}" /></td>
                    <td>+</td>
                </c:if>
            </c:if>
            <c:if test="${empty order.serviceList}">
                <td><c:out value="${service.name}" /></td>
                <td><c:out value="${service.price}" /></td>
                <td><a href="${addUrl}">Добавить</a></td>
            </c:if>

        </tr>

    </c:forEach>
    </tbody>
</table>


<c:url var="masterUrl" value="/order/master?id=${order.id}" />

<c:if test="${!empty order.serviceList}">
    <p align="center"><font face="Times New Roman" color="#20269E" size="4"><a href="${masterUrl}">Не нужно больше добавлять услуг</a></font></p>
</c:if>





</body>
</html>
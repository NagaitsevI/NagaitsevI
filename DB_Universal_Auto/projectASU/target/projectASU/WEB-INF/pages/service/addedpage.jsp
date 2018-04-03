<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Услуги</title>
</head>
<body style="background-image: linear-gradient(to bottom, #5399C2, #B8C2A9); background-size: cover; padding-bottom: 750px;">

<h1 align="center"><font face="Times New Roman" color="#20269E" size="7">Выбор запчастей</font></h1>

<table style="border: 1px solid; width: 500px; text-align:center" align="center">
    <thead style="background:#00008B">
    <tr>
        <th><font face="Times New Roman" color="#f5f5dc">Наименование</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Количество</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Стоимость</font></th>
        <th colspan="3"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${autoparts}" var="autopart">
        <c:set var="check" value="0" />

        <c:url value="/service/autopart"  var="editUrl" >
                <c:param name="idS" value="${service.id}" />
                <c:param name="id" value="${autopart.id}" />
        </c:url>

        <tr>

            <c:if test="${!empty service.autopartList}">
                <c:forEach items="${service.autopartList}" var="serauto">
                    <c:if test="${autopart.name == serauto.name}">
                        <c:set var="check" value="1" />
                    </c:if>
                </c:forEach>
                <c:if test="${check != 1}">
                    <td><c:out value="${autopart.name}" /></td>
                    <td><c:out value="${autopart.number}" /></td>
                    <td><c:out value="${autopart.price}" /></td>
                    <td><a href="${editUrl}">Добавить</a></td>
                </c:if>
                <c:if test="${check == 1}">
                    <td><c:out value="${autopart.name}" /></td>
                    <td><c:out value="${autopart.number}" /></td>
                    <td><c:out value="${autopart.price}" /></td>
                    <td>+</td>
                </c:if>
            </c:if>
            <c:if test="${empty service.autopartList}">
                <td><c:out value="${autopart.name}" /></td>
                <td><c:out value="${autopart.number}" /></td>
                <td><c:out value="${autopart.price}" /></td>
                <td><a href="${editUrl}">Добавить</a></td>
            </c:if>


        </tr>

    </c:forEach>
    </tbody>
</table>

<c:url var="mainUrl" value="/" />

<c:if test="${!empty service.autopartList}">
    <p align="center"><font face="Times New Roman" color="#20269E" size="5"><a href="${mainUrl}">Не нужно больше добавлять</a></font></p>
</c:if>

<c:if test="${empty service.autopartList}">
    <p align="center"><font face="Times New Roman" color="#20269E" size="5"><a href="${mainUrl}">В данной услуге нет запчастей</a></font></p>
</c:if>


</body>
</html>
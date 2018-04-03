<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Услуги</title>
</head>
<body style="background-image: linear-gradient(to bottom, #5399C2, #B8C2A9); background-size: cover; padding-bottom: 720px;  text-shadow: #ffffff 0 0 1px">

<h1 align="center"><font face="Times New Roman" color="#20269E" size="7">Добавление новой услуги</font></h1>

<c:url var="saveUrl" value="/service/add" />
<form:form modelAttribute="serviceAttribute" method="POST" action="${saveUrl}">
    <table align="center">
        <tr>
            <td><form:label path="name"><font face="Times New Roman" color="#20269E" size="5">Наименование:</font></form:label></td>
            <td><form:input path="name"/></td>
        </tr>

        <tr>
            <td><form:label path="price"><font face="Times New Roman" color="#20269E" size="5">Цена:</font></form:label></td>
            <td><form:input path="price" pattern="^[ 0-9]+$"/></td>
        </tr>
    </table>

    <p align="center"><input type="submit" value="Сохранить" /></p>
</form:form>

</body>
</html>
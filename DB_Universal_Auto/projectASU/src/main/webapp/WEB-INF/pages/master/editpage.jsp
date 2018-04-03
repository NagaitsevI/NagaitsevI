<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Мастера</title>
</head>
<body style="background-image: linear-gradient(to bottom, #5399C2, #B8C2A9); background-size: cover; padding-bottom: 575px;  text-shadow: #ffffff 0 0 1px">

<h1 align="center"><font face="Times New Roman" color="#20269E" size="7">Изменение данных мастера</font></h1>

<c:url var="saveUrl" value="/master/edit?id=${masterAttribute.id}" />
<form:form modelAttribute="masterAttribute" method="POST" action="${saveUrl}">
    <table align="center">
        <tr>
            <td><form:label path="surname"><font face="Times New Roman" color="#20269E" size="5">Фамилия:</font></form:label></td>
            <td><form:input path="surname" pattern="^[А-Яа-яЁё\s]+$"/></td>
        </tr>

        <tr>
            <td><form:label path="name"><font face="Times New Roman" color="#20269E" size="5">Имя:</font></form:label></td>
            <td><form:input path="name" pattern="^[А-Яа-яЁё\s]+$"/></td>
        </tr>

        <tr>
            <td><form:label path="phone"><font face="Times New Roman" color="#20269E" size="5">Телефон:</font></form:label></td>
            <td><form:input path="phone" pattern="^[8][0-9]{10}$"/></td>
        </tr>

        <tr>
            <td><form:label path="date_of_birth"><font face="Times New Roman" color="#20269E" size="5">Дата рождения:</font></form:label></td>
            <td><form:input path="date_of_birth"  pattern="^[0-3][1-9]\.[0-1][0-9]\.[1-2][0-9][0-9][0-9]$"/></td>
        </tr>

        <tr>
            <td><form:label path="start_date"><font face="Times New Roman" color="#20269E" size="5">Дата начала работы:</font></form:label></td>
            <td><form:input path="start_date"  pattern="^[0-3][1-9]\.[0-1][0-9]\.[1-2][0-9][0-9][0-9]$"/></td>
        </tr>

        <tr>
            <td><form:label path="specialty"><font face="Times New Roman" color="#20269E" size="5">Специальность:</font></form:label></td>
            <td><form:input path="specialty" pattern="^[А-Яа-яЁё\s]+$"/></td>
        </tr>
    </table>

    <p align="center"><input type="submit" value="Сохранить" /></p>
</form:form>

</body>
</html>
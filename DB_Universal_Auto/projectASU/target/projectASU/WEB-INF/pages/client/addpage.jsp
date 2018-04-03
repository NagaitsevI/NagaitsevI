<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Клиенты</title>
</head>
<body style="background-image: linear-gradient(to bottom, #5399C2, #B8C2A9); background-size: cover; padding-bottom: 575px;  text-shadow: #ffffff 0 0 1px">

<h1 align="center"><font face="Times New Roman" color="#20269E" size="7">Добавление нового клиента</font></h1>

<c:url var="saveUrl" value="/client/add" />
<form:form modelAttribute="clientAttribute" method="POST" action="${saveUrl}">
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
            <td><form:label path="brand"><font face="Times New Roman" color="#20269E" size="5">Марка автомобиля:</font></form:label></td>
            <td><form:input path="brand" pattern="^[A-Za-zА-Яа-яЁё\s]+$"/></td>
        </tr>

        <tr>
            <td><form:label path="model"><font face="Times New Roman" color="#20269E" size="5">Модель автомобиля:</font></form:label></td>
            <td><form:input path="model" pattern="^[A-Za-zА-Яа-яЁё0-9\s]+$"/></td>
        </tr>

        <tr>
            <td><form:label path="registration_plate"><font face="Times New Roman" color="#20269E" size="5">Регистрационный знак:</font></form:label></td>
            <td><form:input path="registration_plate" pattern="^[А-Яа-я0-9]+$"/></td>
        </tr>
    </table>

    <p align="center"><input type="submit" value="Сохранить" /></p>
</form:form>

</body>
</html>
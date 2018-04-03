<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Мастера</title>
</head>
<body style="background-image: linear-gradient(to bottom, #5399C2, #B8C2A9); background-size: cover; padding-bottom: 690px;">
<h1 align="center"><font face="Times New Roman" color="#20269E" size="7">Мастера</font></h1>

<c:url var="addUrl" value="/master/add" />

<table style="border: 1px solid; width: 500px; text-align:center" align="center">
    <thead style="background:#20269E">
    <tr>
        <th><font face="Times New Roman" color="#f5f5dc">Фамилия</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Имя</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Телефон</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Дата рождения</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Дата начала работы</font></th>
        <th><font face="Times New Roman" color="#f5f5dc">Специальность</font></th>
        <th colspan="3"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${masters}" var="master">

           <c:url var="editUrl" value="/master/edit?id=${master.id}" />
           <c:url var="deleteUrl" value="/master/delete?id=${master.id}" />

           <tr>
               <td><c:out value="${master.surname}" /></td>
               <td><c:out value="${master.name}" /></td>
               <td><c:out value="${master.phone}" /></td>
               <td><c:out value="${master.date_of_birth}" /></td>
               <td><c:out value="${master.start_date}" /></td>
               <td><c:out value="${master.specialty}" /></td>

               <td><a href="${editUrl}">Изменить</a></td>
               <td><a href="${deleteUrl}">Удалить</a></td>
           </tr>

    </c:forEach>
    </tbody>
</table>



<c:if test="${empty masters}">
    <p align="center"><font face="Times New Roman" color="#20269E" size="4">Еще не добавлено мастеров.</font></p>
</c:if>
<p align="center"><font face="Times New Roman" color="#20269E" size="4"><a href="/">Главное меню</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${addUrl}">Добавить мастера</a></font></p>


</body>
</html>

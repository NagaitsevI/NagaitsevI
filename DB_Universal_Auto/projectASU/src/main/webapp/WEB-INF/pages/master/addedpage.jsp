<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Мастера</title>
</head>
<body style="background-image: linear-gradient(to bottom, #5399C2, #B8C2A9); background-size: cover; padding-bottom: 790px;  text-shadow: #ffffff 0 0 1px">

<h1 align="center"><font face="Times New Roman" color="#20269E" size="7">Вы добавили нового мастера</font></h1>


<c:url var="mainUrl" value="/master/" />
<p align="center"><font face="Times New Roman" color="#20269E" size="5">Вернуться к  <a href="${mainUrl}">списку мастеров</a></font></p>

</body>
</html>
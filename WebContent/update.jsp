<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Store Application</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div align="center">
    <form action="update" method="post">
   		<table border="1" cellpadding="5">
   		<tr>
                <th>UID:</th>
                <td>
                    <input type="text" name="uid" value="<c:out value='${user.uid}'/>" readonly="readonly"/>
                </td>
            </tr>
            <tr>
                <th>Name:</th>
                <td>
                    <input type="text" name="name" value="<c:out value='${user.name}'/>"/>
                </td>
            </tr>
            <tr>
                <th>Email:</th>  
                <td>
                    <input type="text" name="email" value="<c:out value='${user.email}' />"/>
                </td>
            </tr>
            <tr>
                <th>Password:</th>
                <td>
                    <input type="text" name="password" value="<c:out value='${user.password}' />"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Update" />
                </td>
            </tr>
        </table>
        </form>
    </div>   
</body>
</html>
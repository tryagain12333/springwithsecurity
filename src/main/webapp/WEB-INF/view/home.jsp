<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="row">
    <div class="container col-md-10">
        <h2>luv2code Company Home Page</h2>
        <hr>
        <p>Welcome to the luv2code company home page!</p>

        <!-- Display User and Role... -->
        <!-- Thẻ xác thực Khi chúng tôi muốn truy cập vào đối tượng Xác thực hiện tại được lưu trữ trong Bối cảnh bảo mật mùa xuân,
         chúng tôi có thể sử dụng thẻ xác thực.
          Sau đó, chúng ta có thể sử dụng nó để hiển thị các thuộc tính của đối tượng trực tiếp trong trang JSP của chúng ta.
           Ví dụ: nếu chúng ta muốn hiển thị thuộc tính chính của đối tượng Xác thực trong trang của mình, chúng ta có thể thực hiện như sau: -->
        <p>
            User:
            <sec:authentication property="principal.username" />
            <br> <br>
            Role(s):
            <sec:authentication property="principal.authorities" />
        </p>
        <security:authorize access="hasRole('USER')">
            <!-- Add a link to point to /leaders ... this is for the managers -->
            <p>
                <a href="${pageContext.request.contextPath}/users">Leadership
                    Meeting</a> (Only for Manager peeps)
            </p>
        </security:authorize>
        <security:authorize access="hasRole('ADMIN')">
            <!-- Add a link to point to /systems ... this is for the admins -->
            <p>
                <a href="${pageContext.request.contextPath}/value/list">IT Systems
                    Meeting</a> (Only for Admin peeps)
            </p>
        </security:authorize>
        <!-- Add logout button -->
        <form:form action="${pageContext.request.contextPath}/logout"
                   method="POST">
            <input type="submit" value="Logout" />
        </form:form>
    </div>
</div>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: Hung Nguyen
  Date: 10/18/2022
  Time: 4:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<div id="wrapper">
  <div id="header" >
    <h2 class="text-center">Add Information</h2>
  </div>
  <div id="container">
    <h3>Add a Value</h3>
    <form:form action="saveValue" modelAttribute="value"
               method="post">
      <!-- Need to assiocated this data with customer id -->
      <form:hidden path="id" />
      <table class="table table-hover">
        <tbody>
        <tr>
          <td><lable>Value1:</lable></td>
          <td><form:input path="value1" class="form-control" /></td>
        </tr>
        <tr>
          <td><lable>Value2:</lable></td>
          <td><form:input path="value2" class="form-control" /></td>
        </tr>
        <tr>
          <td><lable>Value3:</lable></td>
          <td><form:input path="value3" class="form-control"/></td>
        </tr>
        <tr>
          <td><lable>Value4:</lable></td>
          <td><form:input path="value4" class="form-control"/></td>
        </tr>
        <tr>
          <td><lable></lable></td>
          <td><input type="submit" value="Save" class="btn btn-primary" /></td>
        </tr>
        </tbody>
      </table>
    </form:form>
    <div class="text-center">
      <p>
        <a href="${pageContext.request.contextPath}/value/list" class="btn btn-warning">Back to list</a>
      </p>
    </div>
  </div>
</div>
</body>
</html>

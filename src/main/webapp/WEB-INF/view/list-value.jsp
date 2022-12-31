<%--
  Created by IntelliJ IDEA.
  User: Giang Manh
  Date: 12/07/2022
  Time: 4:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <div id="header">
        <h2 style="
    display: flex;
    justify-content: center;
">Manage Infomation</h2>
    </div>
    <form th:action="@{/}">
        <input type="text" name="keyword" id="keyword" size="50" th:value="${keyword}" required
               style="
                          height: 38px;
                          border-radius: 8px;
                          border: 1px solid #9CC396;
                          outline: none;
                          padding-left: 16px;
                   "
        />
        &nbsp;
        <input type="submit" value="Search" style="
    width: 78px;
    height: 38px;
    border-radius: 8px;
    border: none;
    background-color: #7EACD0;
    color: #fff;
    font-weight: 500;
"/>
        &nbsp;
    </form>
    <div id="container">
        <div id="content">
            <!-- Add new button - Add New Customer -->
            <input type="button" value="Add Book" class="btn btn-success"
                   onclick="window.location.href='showFormForAdd';return false;" />
            <!-- Add your html table here -->
            <table class="table">
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Value1</th>
                    <th scope="col">Value2</th>
                    <th scope="col">Value3</th>
                    <th scope="col">Value4</th>
                    <th scope="col">Value5</th>
                </tr>
                </tr>
                <c:forEach var="tempValue" items="${values}">
                    <!-- Construct an update link -->
                    <c:url var="updateLink" value="/value/showFormForUpdate">
                        <c:param name="valueId" value="${tempValue.id}" />
                    </c:url>
                    <!-- Construct an delete link -->
                    <c:url var="deleteLink" value="/value/delete">
                        <c:param name="valueId" value="${tempValue.id}" />
                    </c:url>
                    <tr>
                        <td>${tempValue.id}</td>
                        <td>${tempValue.value1}</td>
                        <td>${tempValue.value2}</td>
                        <td>${tempValue.value3}</td>
                        <td>${tempValue.value4}</td>
                        <td><c:choose>
                           <c:when test="${tempValue.value4>=1000}"><%-- condition--%>
                                result <%-- result1--%>
                                <br />
                            </c:when>
                            <c:otherwise>
                                result <%-- result2--%>
                                <br/>
                            </c:otherwise>
                        </c:choose></td>
                        <!-- display update link -->
                        <td><a href="${updateLink}">Update</a> | <a
                                href="${deleteLink}"
                                onclick="if(!(confirm('Ban chac chan muon xoa khong?'))) return false">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF9 3hXpG5KkN"
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
<div class="row"
     style="display: flex; justify-content: center;"
>
    <div id="loginbox"
         style="margin-top: 50px;"
         class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-smoffset-2"
    >
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title"
                     style="font-size: 38px; font-weight: 500;">
                    Sign In
                </div>
            </div>
            <div style="padding-top: 30px"
                 class="panel-body"
            >
                <!-- Login Form -->
                <form:form
                        action="${pageContext.request.contextPath}/"
                        method="POST"
                        class="form-horizontal"
                >
                <!-- Place for messages: error, alert etc ... -->
                <div class="form-group">
                    <div class="col-xs-15">
                        <div>
                            <!-- Check for login error -->
                            <c:if test="${param.error!=null }">
                                <div class="alert alert-danger col-xs-offset-1 col-xs-10">
                                    Invalid username and password.</div>
                            </c:if>
                            <!-- Check for logout error -->
                            <c:if test="${param.logout!=null }">
                                <div class="alert alert-success col-xs-offset-1 col-xs-10">
                                    You have been logged out.</div>
                            </c:if>
                        </div>
                    </div>
                </div>
                <!-- User name -->
                <div style="margin-bottom: 25px" class="input-group">
              <span class="input-group-addon">
                <i class="glyphicon glyphiconuser"></i>
              </span>
                    <input type="text"
                           name="username"
                           placeholder="username"
                           class="form-control"
                    >
                </div>
                    <!-- Password -->
                    <div style="margin-bottom: 25px"
                         class="input-group"
                    >
              <span class="input-group-addon">
                <i class="glyphicon glyphiconlock"></i>
              </span>
                        <input type="password"
                               name="password"
                               placeholder="password"
                               class="form-control"
                        >
                    </div>
                    <!-- Login/Submit Button -->
                    <div style="margin-top: 10px"
                         class="formgroup"
                    >
                        <div class="col-sm-6 controls"
                             style="padding: 0;"
                        >
                            <button type="submit"
                                    class="btn btn-success">
                                Login
                            </button>
                        </div>
                    </div>
                    <!-- I'm manually adding token... -->
                    <input type="hidden"
                           name="${_csrf.parameterName }"
                           value="${_csrf.token }"
                    />
                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
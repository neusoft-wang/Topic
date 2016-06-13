<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
    <div class="main-bar">
        <jsp:include page="../nav.jsp"/>
        <%-- 帖子主要内容 --%>
        <div class="panel panel-default">
            <div class="panel-heading">
                <span>${post.title}</span>
                <span class="navbar-right">
                    创建时间：<spring:eval expression="post.createTime"/>
                    来自: <a href="/u/${user.username}">${user.username}</a>
                </span>
            </div>
            <div class="panel-body">
                <pre>${post.content}</pre>
            </div>
        </div>
        <%-- 帖子评论列表 --%>
        <ul class="list-group">
            <c:forEach items="${comments}" varStatus="status" var="comment">
                <li class="list-group-item">
                    ${status.count}#
                    <a href="/u/${comment.userUsername}">${comment.userUsername}</a>:
                    发表时间：<spring:eval expression="comment.createTime"/>
                    <pre>${comment.content}</pre>
                </li>
            </c:forEach>
        </ul>
        <div class="panel panel-default">
            <div class="panel-heading">
                回复
            </div>
            <div class="panel-body">
                <form id="ajaxForm">
                    <input name="post_id" value="${post.id}" type="hidden">
                    <textarea name="content" class="form-control" rows="5"></textarea>
                    <div id="formAlert" class="alert hidden" role="alert"></div>
                    <button type="button" onclick="ajaxForm('/c')">回复</button>
                </form>
            </div>
        </div>
    </div>
    <%--<jsp:include page="../sidebar.jsp"/>--%>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>

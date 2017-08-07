<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="cmsApp">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <title>后台管理系统</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/util/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/angular-1.2.9/ng-pagination.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/jqwidgets/css/jqx.base.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">
</head>
<body>
    <!-- 顶部导航栏 -->
    <div ui-view="header"></div>
    <!-- 左侧导航栏 -->
    <div ui-view="nav"></div>
    <!-- 右侧内容 -->
    <div ui-view="content" class="content"></div>

    <script src="<%=request.getContextPath()%>/js/util/jquery.1.11.3.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/echarts-2.2.7/echarts.js"></script>
    <script src="<%=request.getContextPath()%>/js/echarts-2.2.7/option-xc.js"></script>
    <script src="<%=request.getContextPath()%>/js/echarts-2.2.7/option-sh.js"></script>

    <!-- angularJS -->
    <script src="<%=request.getContextPath()%>/js/angular-1.2.9/angular.js"></script>
    <script src="<%=request.getContextPath()%>/js/angular-1.2.9/angular-ui-router.js"></script>
    <script src="<%=request.getContextPath()%>/js/angular-1.2.9/angular-cookies.js"></script>
    <script src="<%=request.getContextPath()%>/js/angular-1.2.9/ng-pagination.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/angular-1.2.9/ng-scrollbar.js"></script>
    <script src="<%=request.getContextPath()%>/js/app.js"></script>
    <script src="<%=request.getContextPath()%>/js/controllers.js"></script>
    <!--<script src="js/filters.js"></script> -->
    <script src="<%=request.getContextPath()%>/js/services.js"></script>
    <!--<script src="js/directives.js"></script> -->

    <!-- jqwidgets -->
    <script src="<%=request.getContextPath()%>/js/jqwidgets/jqxcore.js"></script>
    <script src="<%=request.getContextPath()%>/js/jqwidgets/jqxdata.js"></script>
    <script src="<%=request.getContextPath()%>/js/jqwidgets/jqxcalendar.js"></script>
    <script src="<%=request.getContextPath()%>/js/jqwidgets/jqxdatetimeinput.js"></script>
    <script src="<%=request.getContextPath()%>/js/jqwidgets/jqxangular.js"></script>
</body>
</html>
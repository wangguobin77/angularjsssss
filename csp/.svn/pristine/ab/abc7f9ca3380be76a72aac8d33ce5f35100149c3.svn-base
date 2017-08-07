<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限</title>
</head>
<body>
	<div class="content-left">
		<h1>权限组</h1>
		<ul class="operation-list">
			<li><button>新增权限组</button></li>
			<li><img src="<%=request.getContextPath() %>/images/icon/icon_edit.png"><span>编辑</span></li>
		</ul>
		<div class="list" ng-scrollbar scrollbar-x="true" scrollbar-y="false">
			<table class="table-header">
				<tr>
					<th width="25"></th>
					<th width="124">角色权限组名称</th>
					<th width="134">状态</th>
					<th width="134">创建时间</th>
					<th width="134">操作</th>
				</tr>
			</table>
			<div class="table-content" ng-scrollbar scrollbar-x="false"
				scrollbar-y="true">
				<table>
					<tr ng-repeat="qx in qxList">
						<td width="124" ng-bind="qx.name"></td>
						<td width="134" ng-if="qx.status == 1">启用</td>
						<td width="134" ng-if="qx.status == 0">未启用</td>
						<td width="134" ng-bind="qx.createTime | date:'yyyy-MM-dd HH:mm:ss'"></td>
						<td width="134">修改</td>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<img src="<%=request.getContextPath() %>/images/bg/bg-page-line.png" class="page-line">
		<div class="pager">
			<pager page-count="pageCount" current-page="groupQueryParam.page"
				on-page-change="onPageChange(groupQueryParam.page)" first-text="首页"
				next-text="下一页" prev-text="上一页" last-text="尾页"></pager>
		</div>
	</div>
</body>
</html>

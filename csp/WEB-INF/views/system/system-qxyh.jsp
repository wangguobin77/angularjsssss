<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限用户</title>
</head>
<body>
	<div class="content-left">
		<h1>权限用户</h1>
		<ul class="operation-list">
			<li><button>添加用户</button></li>
			<li><img src="<%=request.getContextPath() %>/images/icon/icon_edit.png"><span>编辑</span></li>
			<li><img src="<%=request.getContextPath() %>/images/icon/icon_enable.png"><span>启用</span></li>
			<li><img src="<%=request.getContextPath() %>/images/icon/icon_disable.png"><span>失效</span></li>
		</ul>
		<div class="list" ng-scrollbar scrollbar-x="true" scrollbar-y="false">
			<table class="table-header">
				<tr>
					<th width="25"></th>
					<th width="124">用户名</th>
					<th width="134">姓名</th>
					<th width="134">角色权限组</th>
					<th width="134">备注</th>
					<th width="124">状态</th>
				</tr>
			</table>
			<div class="table-content" ng-scrollbar scrollbar-x="false"
				scrollbar-y="true">
				<table>
					<tr ng-repeat="qxyh in qxyhList" ng-dblclick="showExtra(qxyh.id)">
						<td width="25">
							<input type="checkbox" name="user" id="{{$index}}">
							<label for="{{$index}}"
								ng-class="{true: 'userStatus'}[qxyh.userStatus]"
								ng-click="changeActive(qxyh)">
							</label>
						</td>
						<td width="124" ng-bind="qxyh.userName"></td>
						<td width="134" ng-bind="qxyh.realName"></td>
						<td width="134" ng-bind="qxyh.authGroupName"></td>
						<td width="134" ng-bind="qxyh.remark"></td>
						<td width="124" ng-if="qxyh.userStatus == 0">未启用</td>
						<td width="124" ng-if="qxyh.userStatus == 1">启用</td>
					</tr>
				</table>
			</div>
		</div>
		<img src="<%=request.getContextPath() %>/images/bg/bg-page-line.png" class="page-line">
		<div class="pager">
			<pager page-count="pageCount" current-page="userQueryParam.page"
				on-page-change="onPageChange(userQueryParam.page)" first-text=""
				next-text="" prev-text="" last-text=""></pager>
		</div>
	</div>
	<div class="content-right search-list">
		<h2>搜索</h2>
		<div class="search-div" ng-scrollbar scrollbar-x="false"
			scrollbar-y="true">
			<form name="search_form" novalidate ng-submit="searchAccountUser()">
				<ul>
					<li>
						<input name="userName" ng-model="userQueryParam.name" class="search-i" type="text" placeholder="请输入用户名或姓名">
					</li>
					<li>
						<h5>所属权限组</h5>
						<select ng-model="userQueryParam.authGroupId">
							<option value="">全部</option>
							<option ng-repeat="group in groupList" value="{{group.id}}">{{group.name}}</option>
						</select>
					</li>
				</ul>
				<button type="submit" class="search_btn"
					ng-disabled="search_form.$invalid"></button>
			</form>
		</div>
	</div>
	<div class="content-extra" ng-class="{true: 'extra-show',false: 'extra-hide'}[isExtra]">
		<div class="extra-header">
			<img src="<%=request.getContextPath() %>/images/btn/btn_back.png" ng-click="hideExtra()">
			<h5>权限人员管理</h5>
			<botton class="edit" ng-click="edit()" ng-show="!isEdit">修改</botton>
			<botton class="edit" ng-click="srue()" ng-show="isEdit">确定</botton>
		</div>
		<div class="extra" ng-scrollbar scrollbar-x="false" scrollbar-y="true">
			<div class="extra-content">
				<div class="m-b-20">
					<p class="w-280 m-50">员工代码</p>
					<p class="w-150">权限状态</p>
					<input type="text" class="w-280 m-50 h-50"
						ng-class="{true: 'readonly-border'}[!isEdit]"
						ng-model="userName"
						ng-bind="userName"
						ng-disabled="!isEdit">
					<select class="w-150 h-50"
						ng-class="{true: 'readonly-border'}[!isEdit]"
						ng-model="userStatus"
						ng-disabled="!isEdit">
						<option ng-class="{true: userStatus == 0}">启用中</option>
						<option ng-if="userStatus == 1">失效中</option>
					</select>
				</div>
				<div class="m-b-20">
					<p class="w-150 m-50">姓名</p>
					<p class="w-200"></p>
					<input type="text" class="w-150 m-50 h-50"
						ng-class="{true: 'readonly-border'}[!isEdit]"
						ng-model="realName"
						ng-bind="realName"
						ng-disabled="!isEdit">
				</div>
				<div class="m-b-20">
					<p class="w-150 m-50">权限组</p>
					<p class="w-280">地区</p>
					<select ng-model="authGroupId">
						<option ng-repeat="group in groupList"  value="group.id" ng-selected="group.id == authGroupId">{{group.name}}</option>
					</select>
					<select class="w-280 h-50"
						ng-class="{true: 'readonly-border'}[!isEdit]"
						ng-disabled="!isEdit">
						<option>启用中</option>
						<option>失效中</option>
					</select>
				</div>
				<div class="m-b-20">
					<p class="w-150 m-50">负责商户</p>
					<p class="w-280"></p>
					<div class="w-480 h-50 p-l-22 b-e9e">
						<span>已负责</span> <span>13家</span>
					</div>
					<botton class="view" ng-click="viewList()">查看商户列表</bottom>
				</div>
			</div>
		</div>
	</div>
	<div class="mark" ng-if="isView"> 
    <div class="content-left">
        <h1><img src="<%=request.getContextPath() %>/images/btn/btn_back_mark.png" ng-click="closeView()"> 商户列表</h1>
        <div class="list" ng-scrollbar scrollbar-x="true" scrollbar-y="false">
            <table class="table-header">
                <tr>
                    <th width="25"></th>
                    <th width="124">人员名</th>
                    <th width="134">手机号</th>
                    <th width="134">权限组</th>
                    <th width="134">创建人</th>
                    <th width="124">创建时间</th>
                    <th width="124">最后登录时间</th>
                </tr>
            </table>
            <div class="table-content" ng-scrollbar scrollbar-x="false" scrollbar-y="true">
                <table>
                    <tr ng-repeat="qxyh in qxyhList">
                        <td width="25">
                            <input type="checkbox" name="user" id="{{$index}}">
                            <label for="{{$index}}" ng-class="{true: 'active'}[qxyh.isActive]" ng-click="changeActive(qxyh)"></label>
                        </td>
                        <td width="124" ng-bind="qxyh.name"></td>
                        <td width="134" ng-bind="qxyh.tel"></td>
                        <td width="134" ng-bind="qxyh.group"></td>
                        <td width="134" ng-bind="qxyh.creater"></td>
                        <td width="124" ng-bind="qxyh.createTime"></td>
                        <td width="124" ng-bind="qxyh.lastTime"></td>
                    </tr>
                </table>
            </div>
        </div>
        <img src="<%=request.getContextPath() %>/images/bg/bg-page-line.png" class="page-line">
        <div class="pager">
            <pager page-count="pageCount" current-page="currentPage" on-page-change="onPageChange(currentPage)" first-text="" next-text="" prev-text="" last-text=""></pager>
        </div> 
    </div>
 </div> 
</body>
</html>
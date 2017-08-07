<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务设置</title>
</head>
<body>
	<div class="content-left">
    <h1>服务设置</h1>
    <div class="set-list">
        <h4>服务大类</h4>
        <div ng-scrollbar scrollbar-x="false" scrollbar-y="true">
            <ul>
                <li ng-repeat="sc in serveClass" ng-bind="sc.serviceTypeName" ng-class="{true: 'active'}[$index == scIndex]" ng-click="changeSCActive(this)"></li>
            </ul>
        </div>
        <input class="grouping" type="text" placeholder="请输入服务大类名称" ng-model="typename" ng-keyup="addType($event,typename)">
    </div>
    <div class="set-list-big">
         <h4>服务项目</h4>
         <div ng-scrollbar scrollbar-x="false" scrollbar-y="true">
            <ul>
                 <li ng-repeat="item in items" ng-class="{true: 'active'}[$index == itemIndex]" ng-click="changeItemActive(this)">
                    <img ng-src="<%=request.getContextPath() %>/images/icon/{{item.src}}">
                    <span ng-bind="item.serviceItemName"></span>
                </li> 
            </ul>
        </div>
        <img class="btn_addItem" src="<%=request.getContextPath() %>/images/btn/btn_addItem.png" ng-click="addItem()">
    </div>
</div>
<div class="content-right right-shadow">
    <botton class="edit" ng-click="edit()" ng-show="!isEdit">修改</botton>
    <input class="right-title" ng-class="{true: 'readonly'}[!isEdit]" type="text" ng-model="itemname"  ng-disabled="!isEdit">
    <div class="list" ng-scrollbar scrollbar-x="false" scrollbar-y="true">
        <div class="list-model" ng-repeat="fwsz in fwszList">
            <h5 ng-bind="fwsz.serviceName"></h5>
            <img class="btn_switch" ng-if="fwsz.isType" ng-src="<%=request.getContextPath() %>/images/btn/switch_on.png" ng-click="btnSwith(this)">
            <img class="btn_switch" ng-if="!fwsz.isType" ng-src="<%=request.getContextPath() %>/images/btn/switch_off.png" ng-click="btnSwith(this)"> 
            <span ng-if="fwsz.isType">启用中</span>
            <span ng-if="!fwsz.isType">关闭中</span>
            <input class="option" ng-class="{true: 'read'}[!fwsz.isType] " type="text" ng-model="fwsz.note" ng-disabled="!fwsz.isType || !isEdit">
            <input type="number" ng-model="fwsz.count" min="0" ng-class="{true: 'read'}[!fwsz.isType]" ng-disabled="!fwsz.isType || !isEdit"> rmb / 次
        </div>
    </div>
    <img class="btn_addItem" src="<%=request.getContextPath() %>/images/btn/btn_addPrice.png" ng-click="addPrice()" ng-if="!isEdit">
    <bottom class="sure" ng-click="sureEdit()" ng-if="isEdit">确定修改</bottom>
</div>

</body>
</html>


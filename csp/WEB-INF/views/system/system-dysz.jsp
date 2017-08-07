<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>地域设置</title>
</head>
<body>
	<div class="content-left">
    <h1>地域设置</h1>
    <div class="set-list">
        <h4>地域</h4>
        <div ng-scrollbar scrollbar-x="false" scrollbar-y="true">
            <ul>
                <li ng-repeat="loca in locals" ng-bind="loca.proName" ng-class="{true: 'active'}[$index == locaIndex]" ng-click="changeSCActive(this)"></li>
            </ul>
        </div>
    </div>
    <div class="set-list-big">
         <h4>城市</h4>
         <div ng-scrollbar scrollbar-x="false" scrollbar-y="true">
            <ul>
                 <li ng-repeat="item in items" ng-class="{true: 'active'}[$index == itemIndex]" ng-click="changeItemActive(this)">
                    <img ng-src="images/icon/icon_map.png">
                    <span ng-bind="item.cityName"></span>
                </li> 
            </ul>
        </div>
        <div ng-if="!isAddItem" class="btn_addItem" ng-click="addItem()">
            <h4>添加城市</h4>
        </div>
        <div ng-if="isAddItem" class="btn_addItem">
            <input type="text" placeholder="请输入城市名"><label ng-click="srueItem()">确定</label>
        </div> 
    </div>
</div>
<div class="content-right right-shadow">
    <botton class="edit" ng-click="edit()" ng-show="!isEdit">修改</botton>
    <div class="edit-header">
        <input type="checkbox" id="all" ng-model="check" ng-true-value="true" ng-false-value="false" name="area" id="{{$index}}" ng-change="changeArea()" ng-disabled="!isEdit">
        <label for="all">上海</label>
    </div>
    <div class="list" ng-scrollbar scrollbar-x="false" scrollbar-y="true">
        <ul class="area-list">
            <li ng-repeat="area in areas">
                <input type="checkbox" ng-model="ac" ng-true-value="true" ng-false-value="false" name="area" id="{{$index}}" ng-disabled="!isEdit">
                <label for="{{$index}}" ng-bind="area.text"></label>
                <span></span>
            </li>
        </ul>
    </div>
    <div ng-if="!isAddArea" ng-show="!isEdit" class="btn_addItem_long" ng-click="addArea()">
        <h4>添加区</h4>
    </div>
    <div ng-if="isAddArea" ng-show="!isEdit" class="btn_addItem_long">
        <input type="text" placeholder="请输入区名"><label ng-click="srueArea()">确定</label>
    </div> 
     <bottom class="sure" ng-click="sureEdit()" ng-if="isEdit">确定修改</bottom> 
</div>

</body>
</html>

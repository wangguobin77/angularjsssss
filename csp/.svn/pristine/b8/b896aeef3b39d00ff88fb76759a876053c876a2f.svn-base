var cmsCtrls=angular.module('cmsCtrls',['ngCookies']);
/*登录页*/
cmsCtrls.controller('loginCtrl',function($cookies,$cookieStore,$scope,$http,$state,$rootScope){
    $scope.t1='用户名不能为空';
    $scope.t2='密码不能为空';
    $scope.t3='请输入验证码';


    // $scope.src="http://localhost:8080/csp-web-manager/userLogi
    // n/getCode?type=random&now=' + new Date() + '";

    // //点击刷新验证码
    // $scope.updateCode=function(){
    //     $scope.src='http://localhost:8080/csp-web-manager/userLogin/getCode?now=' + new Date();
    // }

    /*自动加载账号和密码*/
    $scope.loginOnload=function(){
        var n=$cookieStore.get('userName');
        var p=$cookieStore.get('password');
        if(n==undefined || p==undefined){
            $scope.user = '';
            $scope.pwd = '';
        }else {
            $scope.user=n;
            $scope.pwd=p;
        }
    }

     //验证登陆
     $scope.$watch('user',function(newValue,oldValue){
         if( newValue == undefined || newValue!=oldValue){
            $scope.flag1=false;
         }
     });
     $scope.$watch('pwd',function(newValue,oldValue){
         if( newValue == undefined || newValue!=oldValue ){
            $scope.flag2=false;
         }
     });
     $scope.$watch('yzm',function(newValue,oldValue){
         if( newValue == undefined || newValue!=oldValue ){
            $scope.flag3=false;
         }
     });


     $scope.testLogin=function(){

        $http({
             method: 'POST',
             url: 'http://localhost:8080/csp-web-manager/userLogin/login',
             data: {'userName':$scope.user,'password':$scope.pwd,'vCode':$scope.yzm},
             dataType: 'json',
             contentType: 'application/json'
        }).success(function(response) {
             // 请求成功执行代码
             if(response.resultCode!='SUCCESS'){
                 if(response.resultCode=='10020006'){
                     $scope.flag1=true;
                     $scope.flag2=false;
                     $scope.txt1='账户不存在';
                     document.getElementById('spn1').className='';
                 }else if(response.resultCode=='10020005'){
                     $scope.flag2=true;
                     $scope.flag1=false;
                     $scope.txt2='用户名或密码不正确';
                     document.getElementById('spn2').className='';
                 }else if(response.resultCode=='10020007'){
                     $scope.flag3=true;
                     $scope.txt3='验证码错误';
                     document.getElementById('spn3').className='';
                 }
             }else {
            	 var username=$scope.user;
                 var password=$scope.pwd;
                if($scope.addCookie){
                	alert(username)
                        $cookieStore.put('userName', username);
                        $cookieStore.put('password', password);
                }
            	 window.location.href = 'http://localhost:8080/csp-web-manager/userLogin/requestApp';
                    }


        })

 };

});


//顶部导航栏
cmsCtrls.controller('headerCtrl',function($scope){
    $scope.keyword='';
    $scope.searchForm=function(){
        alert('开始查询');
    }
});
//左侧导航栏
/*cmsCtrls.controller('navCtrl',function($scope,publicService){
	publicService.getSession().then(function(response){
		$scope.topData = response.data;
		//console.log($scope.topData);
		//alert($scope.topData+"值");
		$scope.navs=$scope.topData;
		//$scope.serveClass = '';
		//$scope.serveClass = $scope.topData.serviceTypeVos;

	});
});*/
cmsCtrls.controller('navCtrl',function($scope,publicService){
    $scope.navs=publicService.navs;
});
//首页
cmsCtrls.controller('indexCtrl',function($scope){
    //实时统计-月趋势-洗车新增
    var xc=echarts.init(document.getElementById('xc'));
    xc.setOption(optionHistogramByXC);
    //实时统计-月趋势-商户新增
        var sh = echarts.init(document.getElementById('sh'));
            sh.setOption(optionHistogramBySH);
            $scope.download=function(){
                alert('下载趋势图pdf');
            }
});
//机构
cmsCtrls.controller('institutionCtrl',function($scope){

});
//商户
cmsCtrls.controller('customerCtrl',function($scope,$http,customerService){

        $scope.changeActive = function(t){
            t.isActive = !t.isActive;
        }
        $scope.shList = customerService.shList;
        $scope.shInfoList = customerService.shInfoList;
        //时间选择器
        var dateTimeInput = null;
        $scope.settings = {
            width: 210, height: 30, selectionMode: 'range',
            change: function (event) {
                var selection = dateTimeInput.getRange();
                if (selection.from != null) {
                    $scope.log = 'From: ' + selection.from.toLocaleDateString() + ', To: ' + selection.to.toLocaleDateString();
                }
            }
        };
        //搜索
        $scope.searchForm = function(){
            alert('确定搜索');
        }

        //获取上传的文件名
         $scope.getFileName=function(){
                var fileName=$scope.contractName1;
                $scope.contractName=fileName.substring(fileName.lastIndexOf('\\')+1);
            }
        //点击每一个tr
        var index;
       $scope.getInfo=function(i){
            // alert(i);
            index=i;
            $scope.expression1=true;
            $scope.expression2=true;
            $scope.bg=true;
            //把index给后台，从后台那该商户的记录
            $http({
                method: 'POST',
                url: '',
                data:{Index:index},
                dataType: 'json',
                contentType: 'application/json'
            }).success(function(){
                $scope.shInfoList = customerService.shInfoList;
            })
       }

       /*点击确定按钮获取修改内容传给后台*/
       $scope.beSure=function(){
         var updateCustomerList={
        "gsName":$scope.shTnfoList.gsName,
        "states":$scope.shTnfoList.states,
        "custName":$scope.shTnfoList.custName,
        "account":$scope.shTnfoList.account,
        "password":$scope.shTnfoList.password,
        "openTime":$scope.shTnfoList.openTime,
        "closeTime":$scope.shTnfoList.closeTime,
        "bankAccount":$scope.shTnfoList.bankAccount,
        "bankName":$scope.shTnfoList.bankName,
        "handlers":[{"handler.name":$scope.handler.name,"handler.sex":$scope.handler.sex,"handler.tel":$scope.handler.tel}],
        "shAddress":$scope.shTnfoList.shAddress,
        "addressCoord":$scope.shTnfoList.addressCoord,
        "expanders":[{"expander.name":$scope.expander.name,"expander.tel":$scope.expander.tel}],
       " contactNum":$scope.shTnfoList.contactNum,
       "bargainNum":$scope.shTnfoList.bargainNum,
       "bargainName":$scope.shTnfoList.bargainName,
       "contractStartTime":$scope.shTnfoList.contractStartTime,
       "contractEndTime":$scope.shTnfoList.contractEndTime,
       "contractEffectTime":$scope.shTnfoList.contractEffectTime,
       "contractName3":$scope.shTnfoList.contractName3,
       "servicesNum1":$scope.shTnfoList.servicesNum1,
       "servicesNum2":$scope.shTnfoList.servicesNum2
       }
         /* $http({
                method: 'POST',
                url: '',
                data:updateCustomerList;
                dataType: 'json',
                contentType: 'application/json'
               }).success(function(response){
                alert('修改成功');
               })*/
               alert('修改成功');
       }
       $scope.forbidden=true;
       $scope.contantTxt='查看已关联机构';
       $scope.servicesTxt='查看服务项目详情';
       $scope.contractTxt='合同修改记录';
       $scope.contact=true;
       $scope.delDisabled=function(){
               $scope.forbidden=false;
               $scope.contantTxt='修改已关联机构';
               $scope.servicesTxt='修改服务项目详情';
               $scope.contractTxt='查看合同详情';
               $scope.contact=false;
            }
        // 分页查询
       $scope.onPageChange = function(currentPage) {
        console.log(currentPage);
        };
        //总页数
        $scope.pageCount = 100;

});

/*添加商户*/
cmsCtrls.controller('tjshCtrl',function($scope,$http,$compile,customerService){
     $scope.getFileName=function(){
        var fileName=$scope.contractName1;
        $scope.contractName=fileName.substring(fileName.lastIndexOf('\\')+1);
    }
    /*验证新增用户输入的账号是否存在*/
    $scope.flag4=false;
    $scope.testAccount=function(){
        //账号不存在
        $scope.flag4=true;
    }

    /*根据银行卡号获取所属银行*/
    $scope.getBankName=function(){
      /*$http({
                method: 'POST',
                url: '',
                data:{bankAccount:$scop.bankAccount}
               }).success(function(response){
               console.log(response);
               $scope.bankName=response;
               })*/

    }

    /*添加商户负责人*/
    $scope.addHandler=function(){
      var html='<div>'+
                     '<input type="text" ng-'+'model="handlerName" '+'placeholder="姓名">'+
                     '<input type="text" '+'ng-model="handlerSex"'+' placeholder="性别">'+
                     '<input type="text" '+'ng-model="handlerTel" '+'placeholder="电话">'+
                '</div>';
                var template = angular.element(html);
                var div = $compile(template)($scope);
        angular.element(document.getElementById('li')).append(div);
    }

    /*获取地址坐标*/
    $scope.addressCoord='获取坐标';
    $scope.getCoords=function(){
        $http({
            url:'http://api.map.baidu.com/geocoder/v2/?callback=JSON_CALLBACK',
                method:'jsonp',
                params:{
                    address:$scope.shAddress,
                    output:'json',
                    ak:'0A5bc3c4fb543c8f9bc54b77bc155724',
                    //ak:'aOz2aHzaxYWAyuXNoP3m6CYz5XkueLpq',
                }

        }).success(function(response){
          var x=Math.floor(response.result.location.lat);
          var y=Math.floor(response.result.location.lng);
          console.log(x,y);
          $scope.addressCoord=x+","+y;
        })
    }

    /*获取服务项目类型*/
     /*$http({
                method: 'POST',
                url: ''
               }).success(function(response){
               console.log(response);
               $scope.serviceItems=response;
               })*/

    /*获取服务项目中车的类型*/
     /*$http({
                method: 'POST',
                url: '',
               }).success(function(response){
               console.log(response);
               $scope.carTypes=response;
               })*/

     /*获取选择的车类型*/
        var carType='';
         $scope.getFlag5=function(){
            $scope.flag5=true;
            carType=$scope.carType;
        }


    $scope.addCustomer=function(){
        var addCustomerList={
          "gsName," :$scope.gsName,
          "custName" :$scope.custName,
          "chains" :$scope.chains,
          "account" :$scope.account,
          "password" :$scope.password,
          "openTime" :$scope.openTime,
          "closeTime" :$scope.closeTime,
          "bankAccount" :$scope.bankAccount,
          "bankName" :$scope.bankName,
          "handlerName" :$scope.handlerName,
          "handlerSex" :$scope.handlerSex,
          "handlerTel" :$scope.handlerTel,
          "shAddress" :$scope.shAddress,
          "addressCoord" :$scope.addressCoord,
          "bargainNum" :$scope.bargainNum,
          "bargainName" :$scope.bargainName,
          "contractStartTime" :$scope.contractStartTime,
          "contractEndTime" :$scope.contractEndTime,
          "contractEffectTime" :$scope.contractEffectTime,
          "contractName2" :$scope.contractName2,
          "serviceItem" :$scope.serviceItem,
          "carType" :carType
    }
    /* $http({
                method: 'POST',
                url: '',
                data:addCustomerList;
                dataType: 'json',
                contentType: 'application/json'
               }).success(function(response){
                alert('新增成功');
               })*/
               alert('新增成功');
    }

    var src1='../images/btn/btn_qh_yes.png';
    var src2='../images/btn/btn_qh_no.png';
    $scope.glSrc=src1;
    $scope.lsSrc=src1;
    $scope.txt1="已自动关联机构";
    $scope.switchSrc1=function(){
        if($scope.glSrc==src1){
            $scope.glSrc=src2;
            $scope.txt1="未自动关联机构";
        }else {
            $scope.glSrc=src1;
            $scope.txt1="已自动关联机构";
        }
    }
    $scope.switchSrc2=function(){
        if($scope.lsSrc==src1){
            $scope.lsSrc=src2;
            $scope.chain=true;
        }else {
            $scope.lsSrc=src1;
            $scope.chain=false;
        }
        //获取可选的连锁机构
        /*$http({
                method: 'POST',
                url: '',
               }).success(function(response){
               console.log(response);
               $scope.chainMs=response;
               })*/
    }


});


//统计
cmsCtrls.controller('statisticsCtrl',function($scope){

});
//订单
cmsCtrls.controller('orderCtrl',function($scope){

});
//结算
cmsCtrls.controller('settlementCtrl',function($scope){

});
//审批
cmsCtrls.controller('examineCtrl',function($scope){

});
//中行
cmsCtrls.controller('BOCCtrl',function($scope){

});
//拓展
cmsCtrls.controller('expandCtrl',function($scope){

});
//系统
cmsCtrls.controller('systemCtrl',function($scope){

});
//添加权限
cmsCtrls.controller('tjqxCtrl',function($scope){

});
//系统 - 角色权限组
cmsCtrls.controller('qxCtrl',function($http,$scope,systemService){
	// 声明角色权限组查询请求参数
	$scope.groupQueryParam = {
			page: '',// 当前页
			pageSize: ''// 每页显示的记录数
	}
	// 查询角色权限组列表
	function getAuthGroupList(groupQueryParam){
		console.log('groupQueryParam: '+groupQueryParam.page);
		systemService.findAuthGroupList(groupQueryParam).then(function(response){
			$scope.topData = response.data;
			$scope.qxList = '';
			$scope.qxList = $scope.topData.authGroupVOs;// 权限组列表
			$scope.pageCount = '';
			$scope.pageCount = $scope.topData.totalPage;// 总页数
			//console.info($scope.qxList);
			console.log('总页数：'+$scope.pageCount);
		});
	}
	getAuthGroupList($scope.groupQueryParam);

	// 分页查询
	$scope.onPageChange = function(currentPage) {
        console.log('当前页：'+currentPage);
        getAuthGroupList($scope.groupQueryParam);
    };
    //总页数
	//$scope.pageCount = 100;

    // 新增权限组请求参数
    $scope.groupAddParam = {
    		authGroupName : '',

    }

	//时间选择器
	var dateTimeInput = null;
    $scope.settings = {
        width: 210, height: 30, selectionMode: 'range',
        change: function (event) {
            var selection = dateTimeInput.getRange();
            if (selection.from != null) {
                $scope.log = 'From: ' + selection.from.toLocaleDateString() + ', To: ' + selection.to.toLocaleDateString();
            }
        }
    };
	//搜索
	$scope.searchForm = function(){
		alert('确定搜索');
	}
});
//系统 - 权限用户
cmsCtrls.controller('qxyhCtrl',function($http,$scope,systemService){
	// 声明用户查询的条件参数对象
	$scope.userQueryParam={
    	name:'',
    	userStatus:'',
    	authGroupId:'',
    	page:'',
    	pageSize:''
	}
	// 查询权限用户列表
	function getAccountUserList(userQueryParam){
		systemService.findAccountUserList(userQueryParam).then(function(response){
			$scope.topData = response.data;
			$scope.qxyhList = '';
			$scope.qxyhList = $scope.topData.accountUserVOs;// 用户列表信息
			$scope.pageCount = '';
			$scope.pageCount = $scope.topData.totalPage;//总页数
			console.log('总页数：'+$scope.pageCount);
		});
	}
	getAccountUserList($scope.userQueryParam);

	// 查询权限组名称列表
	function getAuthGroupNameList(){
		systemService.findAuthGroupNameList().then(function(response){
			$scope.topData = response.data;
			$scope.groupList = '';
			$scope.groupList = $scope.topData.authGroupVOs;// 权限组列表信息
//			$scope.pageCount = '';
//			$scope.pageCount = $scope.topData.totalPage;//总页数
		});
	}
	getAuthGroupNameList();

	//console.info($scope.qxyhList);
	// 分页查询
	$scope.onPageChange = function(page) {
        console.log('当前页：'+page);
        getAccountUserList($scope.userQueryParam);
    };
    //总页数
	//$scope.pageCount = 5;

	//时间选择器
	var dateTimeInput = null;
    $scope.settings = {
        width: 210, height: 30, selectionMode: 'range',
        change: function (event) {
            var selection = dateTimeInput.getRange();
            if (selection.from != null) {
                $scope.log = 'From: ' + selection.from.toLocaleDateString() + ', To: ' + selection.to.toLocaleDateString();
            }
        }
    };
	//条件搜索权限用户
	$scope.searchAccountUser = function(){
		//alert('搜索条件是：'+$scope.userQueryParam.authGroupId);
		console.info($scope.userQueryParam);
		//alert('搜索条件是：userName: '+$scope.userName+',realName: '+$scope.realName)
		getAccountUserList($scope.userQueryParam);
	}
	// 添加权限用户的请求参数
	$scope.userAddParam = {
			userName:'',
			realName:'',
			password:'',
			telephone:'',
			remark:'',
			userType:'',
			accountType:'',
			authGroupId:'',
			areaType:'',
			areaCode:'',
			relateSourceType:'',
			sourceIds:'',
			bankIds:''
	};
	// 添加权限用户
	$scope.addAccountUser = function(){
		systemService.addAccountUser().then(function(response){

		});
	}
	// 修改权限用户的状态
	$scope.changeActive = function(t){
		t.isActive = !t.isActive;
	}
	// 重置密码请求参数
	$scope.pwdResetParam = {
			userName:'',
			realName:'',
			newPassword:''
	};
	// 重置用户密码
	$scope.resetPwd = function(){
		systemService.resetPassword($scope.pwdResetParam).then(function(response){
			$scope.topData = response.data;
		});
	}
});
//系统 - 服务设置
cmsCtrls.controller('fwszCtrl',function($scope,$window,systemService){

	var typeCode = '';
	var itemCode = '';
	var itemName = '';

	$scope.scIndex = 0;
	$scope.changeSCActive = function(t){
		$scope.scIndex = t.$index;
		typeCode = t.sc.serviceTypeCode;
		console.log(t.sc.serviceTypeCode);
		getItemList(t.sc.serviceTypeCode);
	}
	//$scope.serveClass = systemService.serveClass;

	getTypeList();

	//服务大类列表
	function getTypeList(){
		systemService.findServiceTypeList().then(function(response){
			$scope.topData = response.data;
			$scope.serveClass = '';
			$scope.serveClass = $scope.topData.serviceTypeVos;

		});
	};

	getItemList('');

	//服务项目列表
	function getItemList(req){
		//console.log(req);
		//alert(req);
		//服务项目列表
		systemService.findServiceItemList(req).then(function(response){
			$scope.topData = response.data;
			//console.log($scope.topData.serviceItemVos.length);
			//alert(($scope.topData.serviceItemVos.length));
			$scope.items = $scope.topData.serviceItemVos;
		});
	}

	$scope.addType = function(e,keyword){
		if( keyword != undefined ){
	        var keycode = $window.event ? e.keyCode : e.which;
	        if(keycode == 13){
	    		alert($scope.typename);
	    		addType($scope.typename);
	    		getTypeList();
	        }
    	}
	};

	//增加服务大类
	function addType(req){
		console.log(req);
		systemService.addServiceTypes(req).then(function(response){
			$scope.topData = response.data;
		});
	}

	$scope.itemIndex = 0;
	$scope.changeItemActive = function(t){
		$scope.itemIndex = t.$index;
		console.log(t);
		itemCode = t.item.serviceItemCode;
		itemName = t.item.serviceItemName;
		$scope.itemname = t.item.serviceItemName;
		getMinList(t.item.serviceItemCode);
	}

	getMinList('');

	//查询服务列表
	function getMinList(req){
		//服务列表
		systemService.findServiceList(req).then(function(response){
			$scope.topData = response.data;
			console.log(response.data);
			$scope.fwszList = $scope.topData.serviceVos;
		});
	}
	//$scope.items = systemService.items;

	$scope.addItem = function(){
		alert('添加项目');
		addItem(typeCode,$scope.serviceItemName);
	};

	//增加服务项目（二级）
	function addItem(req){
		console.log(req);
		systemService.addServiceItems(req).then(function(response){
			$scope.topData = response.data;
		});
	}
	//$scope.fwszList = systemService.fwszList;

	$scope.open = '启用中';
	$scope.close = '关闭中';

	$scope.isEdit = false;
	$scope.edit = function(){
		$scope.isEdit = true;
	};
	//启用关闭图标初始化
	angular.forEach($scope.fwszList,function(data){
		console.log(111);
		data.text = data.isType ? $scope.open : $scope.close;
		console.log(data.text);
	});
	//启用关闭按钮切换
	$scope.btnSwith = function(t){

		if( $scope.isEdit ){
			angular.forEach($scope.fwszList,function(data,index){
				console.log(data)
				if( index == t.$index ){
					data.isType = !data.isType;
					data.text = data.isType ? $scope.open : $scope.close;
				}
			});
		}
	};
	$scope.addPrice = function(){
		alert('添加车型价格');
	}

	$scope.sureEdit = function(){
		$scope.isEdit = false;
		console.log($scope.fwszList);
		console.log($scope.itemname);
		console.log(itemCode);
		editMin($scope.fwszList,$scope.itemname,itemCode);
	}

	$scope.numer = 11;
	function editMin(req,itemName,itemCode){
		systemService.updateService(req,itemName,itemCode).then(function(response){
			$scope.topData = response.data;
		});
	}

});
//系统 - 地域设置
cmsCtrls.controller('dyszCtrl',function($scope,systemService){
	$scope.locaIndex = 0;
	$scope.changeSCActive = function(t){
		$scope.locaIndex = t.$index;
	}
	$scope.locals = systemService.locals;

	$scope.itemIndex = 0;
	$scope.changeItemActive = function(t){
		$scope.itemIndex = t.$index;
	}
	$scope.items = systemService.items;

	$scope.addItem = function(){
		alert('添加城市');
	};

	$scope.areas = systemService.areas;
	$scope.on = 'switch_on.png';
	$scope.off = 'switch_off.png';
	$scope.open = '启用中';
	$scope.close = '关闭中';

	$scope.isEdit = false;
	$scope.edit = function(){
		$scope.isEdit = true;
	};
	//启用关闭图标初始化
	angular.forEach($scope.fwszList,function(data){
		data.text = data.isType ? $scope.open : $scope.close;
		data.src = data.isType ? $scope.on : $scope.off;
	});
	//启用关闭按钮切换
	$scope.btnSwith = function(t){
		if( $scope.isEdit ){
			angular.forEach($scope.fwszList,function(data,index){
				if( index == t.$index ){
					data.isType = !data.isType;
					data.src = data.isType ? $scope.on : $scope.off;
				}
			});
		}
	};
	$scope.addPrice = function(){
		alert('添加区');
	}

	$scope.sureEdit = function(){
		$scope.isEdit = false;
	}

});

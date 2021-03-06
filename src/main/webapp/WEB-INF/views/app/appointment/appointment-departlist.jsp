<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="format-detection" content="telephone=no"/>
    <meta name="description" content="">
    <title>选择科室</title>

    <link rel="stylesheet" href="${ctx}/static/lib/jquery-weui-app2/lib/weui.css">
    <link rel="stylesheet" href="${ctx}/static/lib/jquery-weui-app2/css/jquery-weui.css">
    <link rel="stylesheet" href="${ctx}/static/lib/font-awesome-4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/app/appointment-departlist.css">
    <style type="text/css">
    	/** 微信样式 **/
    	.weui_toast {
		  position: fixed;
		  z-index: 50000;
		  width: 15.8em;
		  min-height: 15.8em;
		  top: 180px;
		  left: 50%;
		  margin-left: -3.8em;
		  background: rgba(40, 40, 40, 0.75);
		  text-align: center;
		  border-radius: 15px;
		  color: #FFFFFF;
		}
    	.weui_loading_toast .weui_toast_content {
		  margin-top: 70%;
		  font-size: 31px;
		}
		.weui_loading {
		  position: absolute;
		  width: 0px;
		  z-index: 1;
		  left: 50%;
		  top: 38%;
		}
		.weui_loading_leaf:before {
		  content: " ";
		  position: absolute;
		  width: 24.42px;
		  height: 9.24px;
		  background: #d1d1d5;
		  box-shadow: rgba(0, 0, 0, 0.0980392) 0px 0px 1px;
		  border-radius: 1px;
		  -webkit-transform-origin: left 50% 0px;
		          transform-origin: left 50% 0px;
		}
		.weui_loading_leaf_0:before {
		  -webkit-transform: rotate(0deg) translate(23.76px, 0px);
		          transform: rotate(0deg) translate(23.76px, 0px);
		}
		.weui_loading_leaf_1:before {
		  -webkit-transform: rotate(30deg) translate(23.76px, 0px);
		          transform: rotate(30deg) translate(23.76px, 0px);
		}
		.weui_loading_leaf_2:before {
		  -webkit-transform: rotate(60deg) translate(23.76px, 0px);
		          transform: rotate(60deg) translate(23.76px, 0px);
		}
		.weui_loading_leaf_3:before {
		  -webkit-transform: rotate(90deg) translate(23.76px, 0px);
		          transform: rotate(90deg) translate(23.76px, 0px);
		}
		.weui_loading_leaf_4:before {
		  -webkit-transform: rotate(120deg) translate(23.76px, 0px);
		          transform: rotate(120deg) translate(23.76px, 0px);
		}
		.weui_loading_leaf_5:before {
		  -webkit-transform: rotate(150deg) translate(23.76px, 0px);
		          transform: rotate(150deg) translate(23.76px, 0px);
		}
		.weui_loading_leaf_6:before {
		  -webkit-transform: rotate(180deg) translate(23.76px, 0px);
		          transform: rotate(180deg) translate(23.76px, 0px);
		}
		.weui_loading_leaf_7:before {
		  -webkit-transform: rotate(210deg) translate(23.76px, 0px);
		          transform: rotate(210deg) translate(23.76px, 0px);
		}
		.weui_loading_leaf_8:before {
		  -webkit-transform: rotate(240deg) translate(23.76px, 0px);
		          transform: rotate(240deg) translate(23.76px, 0px);
		}
		.weui_loading_leaf_9:before {
		  -webkit-transform: rotate(270deg) translate(23.76px, 0px);
		          transform: rotate(270deg) translate(23.76px, 0px);
		}
		.weui_loading_leaf_10:before {
		  -webkit-transform: rotate(300deg) translate(23.76px, 0px);
		          transform: rotate(300deg) translate(23.76px, 0px);
		}
		.weui_loading_leaf_11:before {
		  -webkit-transform: rotate(330deg) translate(23.76px, 0px);
		          transform: rotate(330deg) translate(23.76px, 0px);
		}
		.weui_toast {
		  left: 42%;
		  top: 35%;
		  margin-left: -3.8em;
		}
		.weui_dialog_title {
		    font-weight: 400;
		    font-size: 48px;
		}
		.weui_dialog_bd {
		    padding: 5px 20px;
		    font-size: 40px;
		    color: #888;
		    word-wrap: break-word;
		    word-break: break-all;
		}
		.weui_dialog_ft {
		    position: relative;
		    line-height: 102px;
		    margin-top: 49px;
		    font-size: 45px;
		    display: flex;
		}
		.weui_dialog {
		    position: fixed;
		    width: 85%;
		    background-color: #FAFAFC;
		    text-align: center;
		    border-radius: 12px;
		}
    </style>
</head>
<body>

<div class="header">
    <div class="back" id="backBt">
        <i class="fa fa-angle-left" style="font-size: 60px;"></i>
    </div>
    <div class="area">
        <span>选择科室</span>
    </div>
    <div class="search">
        <a id="searchDoctorBt">快速搜医生</a>
    </div>
</div>

<div class="main" id="main">
    <div class="line-bar area-hospital" data-show-id="hospitalDetail">
        <div class="title-bar">
            <span class="title" id="hospitalName"></span>
            <span class="level" id="hospitalLevel"></span>
        </div>
        <div class="right-angle">
            <i class="fa fa-angle-down" style="font-size:54px;margin-top:36px;"></i>
        </div>
    </div>
    <div class="container" id="hospitalDetail" style="display: none;">
        <div class="hospital-detail">
            <div class="header-img">
                <img src="${ctx}/static/images/hospital.png" alt="头像" id="logoImg">
            </div>
            <div class="center-content">
                <div class="level">
                    <span>地址：</span>
                    <span id="address"></span>
                </div>
                <div class="address">
                    <span>电话：</span>
                    <span id="tel"></span>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/static/lib/jquery-weui-app2/lib/jquery-2.1.4.js"></script>
<script src="${ctx}/static/lib/jquery-weui-app2/js/jquery-weui.js"></script>
<script src="${ctx}/static/js/app/ajaxRequest.js"></script>
<%-- <script src="${ctx}/static/js/appointment.js"></script> --%>
<script>
    var _cssText = document.querySelector("html").style.cssText;
    document.querySelector("html").style.cssText = _cssText + "font-size:" + 100 * ($(window).width()) / 750 + "px !important";

	var _obj = ${list};
    console.log(_obj);
    $("#hospitalName").html(_obj.hospitalName);
    $("#hospitalName").attr("data-hospital-id", _obj.hospitalId);
    $("#hospitalLevel").html(_obj.level);
    $("#address").html(_obj.address);
    $("#tel").html(_obj.phone);
    $("#logoImg").attr("src", "${ctx}/"+_obj.logoImg);
    
    console.log(_obj.hospitalId);
    //中心医院隐藏快速搜医生
    if(_obj.hospitalId == 000001) {
    	$("#searchDoctorBt").attr("style","display: none;");
    }
    
    //科室列表
    var _deptList = _obj.list;
    var deptRegInfoDiv = '';
    var _deptObj,_subDeptObj;
	for(var i = 0; i < _deptList.length; i++) {
		_deptObj = _deptList[i];
		if(_deptObj.subDeptInfoBeanList.length > 0) {
		console.log(_deptObj.deptName,_deptObj.subDeptInfoBeanList);
			deptRegInfoDiv = deptRegInfoDiv + 
			'<div class="depart-list">															' +
			'	<div class="line-bar" data-show-id="'+ _deptObj.deptId +'" data-type="havesend">' +
			'		<div class="title-bar">														' +
			'			<span class="title">' + _deptObj.deptName + '</span>					' +
			'		</div>																		' +
			'		<div class="right-angle">													' +
			'			<i class="fa fa-angle-down" style="font-size: 0.4rem;"></i>				' +
			'		</div>																		' +
			'	</div>																			' +
			'	<div class="depart-second" id="' + _deptObj.deptId + '" style="display:none;">	';
			_subDeptObj = _deptList[i].subDeptInfoBeanList;
			for(var j = 0; j < _subDeptObj.length; j++) {
				deptRegInfoDiv = deptRegInfoDiv +
				'	<div class="depart-item" data-show-id="' + _subDeptObj[j].deptId + '">		' +
				'		<div>' + _subDeptObj[j].deptName + '</div>								' +
				'	</div>																		';
			}
			deptRegInfoDiv = deptRegInfoDiv + '</div></div>';
		} else {
			deptRegInfoDiv = deptRegInfoDiv + 
			'<div class="depart-list">															' +
			'	<div class="line-bar" data-show-id="'+ _deptObj.deptId +'" data-type="nosend">' +
			'		<div class="title-bar">														' +
			'			<span class="title">' + _deptObj.deptName + '</span>					' +
			'		</div>																		' +
			'		<div class="right-angle">													' +
			'			<i class="fa fa-angle-down" style="font-size: 0.4rem;"></i>			' +
			'		</div>																		' +
			'	</div>																			' +
			'</div>';
		}
		deptRegInfoDiv = deptRegInfoDiv + '</div></div>';
	}    
	$(document.body).append(deptRegInfoDiv);

    //返回
    $(".back").click(function () {
//        window.history.go(-1);//回退
        window.location.href="${ctx}/appointApp/initHospList";
    });

    $(".line-bar").click(function () {
    	var type = $(this).data("type");
    	if(type == 'nosend') {
    		var _deptId = $(this).data("show-id");
			var _deptName = $(this).find(".title").text();
			
			submit(_deptId, _deptName);
    	} else {
    		var showId = $(this).data("show-id");
        	$("#" + showId).fadeToggle();
	        var rightAngle = $(this).children(".right-angle")[0];
	        var angle = $(rightAngle).children("i");
	        var angleClass = angle.attr("class");
	        if (angleClass == "fa fa-angle-up") {
	            angle.attr("class", "fa fa-angle-down");
	            if (showId == 'hospitalDetail') {
	                $(this).css("box-shadow", "0 2px 10px #e0dfdf");
	                $(this).css("margin-bottom", "0.2rem");
	                $(this).children(".title-bar").css("border-bottom", "0px solid #dfdfdf");
	            }
	        } else if(angleClass == "fa fa-angle-down") {
	            angle.attr("class", "fa fa-angle-up");
	            $(this).css("box-shadow", "");
	            $(this).css("margin-bottom", "");
	            $(".depart-item").css("background-color", "#FFFFFF");
	            $(this).children(".title-bar").css("border-bottom", "1px solid #dfdfdf");
	        }
    	}
    });

    $(".depart-item").click(function () {
        console.log("....depart-item.....");
        $(".depart-item").css("background-color", "#FFFFFF");
        $(this).css("background-color", "#f2f2f2");

      	var _deptId = $(this).data("show-id");
		var _deptName = $(this).children("div").text();
		
		submit(_deptId, _deptName);
    });

	function submit(_deptId, _deptName) {
		$.showLoading();
		var _hospitalId = $("#hospitalName").data("hospital-id");
		var _hospitalName = $("#hospitalName").text();
		
		// 创建Form
        var form = $('<form></form>');
        // 设置属性
        form.attr('action', "/core/appointApp/getDrRegScheduleInfo");
        form.attr('method', 'post');
        // form的target属性决定form在哪个页面提交
        // _self -> 当前页面 _blank -> 新页面
        form.attr('target', '_self');
        // 创建Input
        var hospitalIdInput = $("<input type='text' name='hospitalId'>");
        var hospitalNameInput = $("<input type='text' name='hospitalName'>");
        var deptIdInput = $("<input type='text' name='deptId'>");
        var deptNameInput = $("<input type='text' name='deptName'>");
        hospitalIdInput.attr('value', _hospitalId);
        hospitalNameInput.attr('value', _hospitalName);
        deptIdInput.attr('value', _deptId);
        deptNameInput.attr('value', _deptName);
        // 附加到Form
        form.append(hospitalIdInput);
        form.append(hospitalNameInput);
        form.append(deptIdInput);
        form.append(deptNameInput);
        // 提交表单
		form.appendTo("body").submit();
		form.remove();
	}

    // 快速搜医生
    $("#searchDoctorBt").click(function () {
        console.log("searchDoctorBt....");
        //检查是否登录
		ajaxRequest.checkLogin().then(function (resp) {
			if(resp == '0') {
				var _hospitalId = $("#hospitalName").data("hospital-id");
				var _hospitalName = $("#hospitalName").text();
				window.location.href = "/core/appointApp/getSearchHistory?hospitalId="+_hospitalId+"&hospitalName="+_hospitalName;
			} else {
				$.confirm("未登录，请先登录！", function() {
			  		//点击确认后的回调函数
			  		console.log("登录-确认");
			  		window.jsobj.Login();
				}, function() {
			  		//点击取消后的回调函数
			  		console.log("登录-取消");
				});
			}
		});
    });
</script>
</body>
</html>

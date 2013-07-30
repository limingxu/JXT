<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>管理中心 - </title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.methods.js"></script>
<script type="text/javascript" src="${base}/template/common/js/message_cn.js" charset="UTF-8" ></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>

<style type="text/css">
#loginForm label.error
{
color:Red;
font-size:13px;
margin-left:5px;
padding-left:16px;
}
</style> 
<script type="text/javascript">
$().ready( function() {
	var $validateErrorContainer = $("#validateErrorContainer");
	var $validateErrorLabelContainer = $("#validateErrorContainer ul");
	
	var $validateForm = $("#loginForm");
	var $captchaImage = $("#captchaImage");
	// 刷新验证码
	$captchaImage.click( function() {
		var timestamp = (new Date()).valueOf();
		var imageSrc = $captchaImage.attr("src");
		if(imageSrc.indexOf("?") >= 0) {
			imageSrc = imageSrc.substring(0, imageSrc.indexOf("?"));
		}
		imageSrc = imageSrc + "?timestamp=" + timestamp;
		$captchaImage.attr("src", imageSrc);
	});
	
	
	// 表单验证
	$validateForm.validate({
		rules: {
			"admin.username": {
				required: true,
		    	username: true,
				minlength: 2,
				maxlength: 20,
				remote: {
	                url: "admin!checkUsername.action", 
	                type: "post",  
	                dataType: "json"            
                } 
			},
			"shop.name": {
			    required: true,
			    maxlength: 50,
			    remote: {
	                url: "shop!checkShopName.action", 
	                type: "post",  
	                dataType: "json"            
                }
			},
			"admin.password": {
				required: true,
				minlength: 6,
			    maxlength: 16
			},
			"repassword": {
				required: true,
			    equalTo:"#password"
			},
			"admin.email": {
				required: true,
			    email:true
			},
			"shop.qq": {
				required: true,
			    maxlength: 20,
			    digits:true
			},
			"j_captcha": {
			    required: true
			}
		},
		messages:{
			"admin.username": {
				remote: "用户名已存在！"
			},
			"shop.name": {
				remote: "店铺名已存在！"
			}
		},
		errorPlacement: function(error, element) { 
		    if ( element.is("#captcha") ) 
		        error.appendTo ( element.parent() ); 
		    else 
		        error.insertAfter(element); 
		}
	});
});
</script>
</head>
<body class="login">
	<script type="text/javascript">

		// 登录页面若在框架内，则跳出框架
		if (self != top) {
			top.location = self.location;
		};

	</script>
	<div class="body">
		<div id="validateErrorContainer" class="validateErrorContainer">
			<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
			<ul></ul>
		</div>
		<form id="loginForm" action="${base}/admin/admin!saveshoper.action" method="post">
            <table class="loginTable" style="width:650px;">
            	<tr>
            		<td rowspan="8">
            			<img src="${base}/template/admin/images/login_logo.gif"/>
            		</td>
                    <th>
                    	用 户 名:
                    </th>
					<td>
                    	<input type="text" name="admin.username" class="formText" />
                    </td>
                </tr>
                <tr>
                    <th>
                    	店 铺 名:
                    </th>
					<td>
                    	<input type="text" name="shop.name" class="formText" />
                    </td>
                </tr>
                <tr>
					<th>
						密&nbsp;&nbsp;&nbsp;&nbsp;码:
					</th>
                    <td>
                    	<input type="password" id="password" name="admin.password" class="formText" />
                    </td>
                </tr>
                <tr>
                  <th> 重复密码: </th>
                  <td><input type="password" name="repassword" class="formText" /></td>
                </tr>
                <tr>
                  <th> 电子邮件: </th>
                  <td><input type="text" name="admin.email" class="formText" /></td>
                </tr>
                <tr>
                  <th> QQ号码: </th>
                  <td><input type="text" name="shop.qq" class="formText" /></td>
                </tr>
                <tr>
                  <th> 验 证 码: </th>
                  <td><input type="text" id="captcha" name="j_captcha" class="formText captcha" />
                    <img id="captchaImage" class="captchaImage" src="${base}/captcha.jpeg" alt="换一张" /></td>
                </tr>
                <tr>
                  <th>&nbsp;</th>
                  <td><input type="submit" value="同意服务条款并注册" hidefocus /><a>《服务条款》</a></td>
                </tr>
            </table>
        </form>
	</div>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加/编辑学校 - Powered By </title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.methods.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
<script type="text/javascript">
$().ready( function() {

	var $validateErrorContainer = $("#validateErrorContainer");
	var $validateErrorLabelContainer = $("#validateErrorContainer ul");
	var $validateForm = $("#validateForm");
	
	var $tab = $("#tab");

	// Tab效果
	$tab.tabs(".tabContent", {
		tabs: "input"
	});
	
	// 表单验证
	$validateForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		ignoreTitle: true,
		rules: {
			"school.name": {
					required: true,
					username: true,
					minlength: 2,
					maxlength: 	 20,
					remote: "admin!checkUsername.action"
				},
			"admin.password": {
				required: true,
				minlength: 4,
				maxlength: 	 20
			},
		
			"admin.email": {
				required: true,
				email: true
			},
			"roleList.id": "required"
		},
		submitHandler: function(form) {
			$(form).find(":submit").attr("disabled", true);
			form.submit();
		}
	});

});
</script>
</head>
<#assign cityList = "${settingUtil.getSetting().getCityList()}" />
<body class="input admin">
	<div class="bar">
		<#if isAddAction>添加学校<#else>编辑学校</#if>
	</div>
	<div id="validateErrorContainer" class="validateErrorContainer">
		<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" action="<#if isAddAction>school!save.action<#else>school!update.action</#if>" method="post">
			<input type="hidden" name="id" value="${id}" />
			<ul id="tab" class="tab">
				<li>
					<input type="button" value="基本信息" hidefocus />
				</li>
			</ul>
			<table class="inputTable tabContent">
				<tr>
					<th>
						学校名称：
					</th>
					<td>
							<input type="text" name="school.name" value="${(school.name)!}" class="formText" title="学校名称" />
							<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						所在城市
					</th>
					<td>	
							<select name="pager.searchBy" class="selectText" width="180px">
								<#list cityList as city>
									<option value="${(city.id)!}">
										${(city.name)!}
									</option>
								</#list>
							</select> 
							<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						所在区县: 
					</th>
					<td>
						<select name="pager.searchBy" class="selectText">
							<#list districtList as district>
									<option value="${(district.id)!}">
										${(district.name)}
									</option>
							</#list>
						</select>	
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						代理商: 
					</th>
					<td>
						<input type="agent.shortName" name="agent.shortName" value="${(admin.username)!}" class="formText" color="red" <#if isAddAction>disabled</#if>  />
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						学校联系方式: 
					</th>
					<td>
						<textarea name="role.description" class="formTextarea">${(role.description)!}</textarea>
					</td>
				</tr>
			</table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="确  定" hidefocus />&nbsp;&nbsp;
				<input type="submit" class="formButton" value="重置" hidefocus />&nbsp;&nbsp;
				<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus />
			</div>
		</form>
	</div>
</body>
</html>
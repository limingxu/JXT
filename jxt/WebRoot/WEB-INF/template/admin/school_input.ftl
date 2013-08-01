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
<script type="text/javascript" src="${base}/template/common/js/message_cn.js"></script>
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
	
	var $citySel = $("#citySel");
	var $districtSel = $("#districtSel");
	
	 function loadDistirct(cityid,districtid){
	 	$districtSel.html('<option value="">请选择...</option>');
		$.ajax({
			url: "resource!ajaxGetDistrictByCityId.action",
			data: {cityId: cityid},
			type: "POST",
			dataType: "json",
			cache: false,
			success: function(data) {
				if(data && data!=null){
					var option = "";
					$.each(data, function(i) {
						<@compress single_line = false>
							if(districtid==data[i].id){
								option += '<option value="'+data[i].id+'" selected>'+data[i].name+'</option>';
							}else{
								option += '<option value="'+data[i].id+'">'+data[i].name+'</option>';
							}	     
							
						</@compress>
					});
					$districtSel.append(option);
				}
			}
		});
	}
	
	//级联地区
	$citySel.change( function() {
		$districtSel.html('<option value="">请选择...</option>');
		$.ajax({
			url: "resource!ajaxGetDistrictByCityId.action",
			data: {cityId: $citySel.val()},
			type: "POST",
			dataType: "json",
			cache: false,
			success: function(data) {
				if (data != null) {
					var option = "";
					$.each(data, function(i) {
						<@compress single_line = false>
							option += '<option value="'+data[i].id+'">'+data[i].name+'</option>';
						</@compress>
					});
					$districtSel.append(option);
				}
			}
		 });
	 });	 
	 	 
	 var $reset = $("#reset");
	 $reset.click( function(){
	 	<#if isAddAction>
	 		 window.location.href="school!add.action";
	 	<#else> 
	 		window.location.href="school!edit.action?id=${(school.id)!}";
	 	</#if>
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
					maxlength: 	 20
				},
			"school.city.id": {
				required: true
			},
		
			"school.district.id": {
				required: true
			},
			"school.agent.shortName": {
				required: true
			}
		},
		submitHandler: function(form) {
			$(form).find(":submit").attr("disabled", true);
			form.submit();
		}
	});
	
	loadDistirct('${(school.city.id)!}','${(school.district.id)!}');
});
</script>
</head>
<body class="input admin">
	<div class="bar">
		<#if isAddAction>添加学校<#else>编辑学校</#if>
	</div> 
	<div id="validateErrorContainer" class="validateErrorContainer">
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" action="<#if isAddAction>school!save.action<#else>school!update.action</#if>" method="post">
			<input type="hidden" name="school.id" value="${(school.id)!}" />
			<ul id="tab" class="tab">
				<li>
					<input type="button" value="学校信息" hidefocus />
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
							<select id="citySel" name="school.city.id" class="selectText" width="180px" title="所在城市">
								<option value="">请选择...</option>
								<#list cityList as city>
									<option value="${(city.id)!}"  <#if (school.city.id)! == city.id>selected</#if>>
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
					
						<select id="districtSel" name="school.district.id" class="selectText" title="所在区县">
						</select>	
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						代理商: 
					</th>
					<td>
						<input type="hidden" name="school.agent.id" value="${(school.agent.id)!}">
						<input type="text" title="代理商" name="school.agent.name" value="${(school.agent.name)!}"  class="formText" color="red"  disabled  />
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						学校联系方式: 
					</th>
					<td>
						<textarea name="school.description" class="formTextarea">${(school.description)!}</textarea>
					</td>
				</tr>
			</table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="提交" hidefocus />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="reset" class="formButton"  value="重置" hidefocus />&nbsp;&nbsp;
			</div>
		</form>
	</div>
</body>
</html>

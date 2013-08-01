<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
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
	var $schoolSel = $("#schoolSel");
	
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
	 
	 //级联学校
	 $districtSel.change( function() {
		$schoolSel.html('<option value="">请选择...</option>');
		$.ajax({
			url: "resource!ajaxSchools.action",
			data: {cityId: $citySel.val(),districtId:$districtSel.val()},
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
					$schoolSel.append(option);
				}
			}
		 });
	 });
	 	 
	 var $reset = $("#reset");
	 $reset.click( function(){
	 	<#if isAddAction>
	 		 window.location.href="class!add.action";
	 	<#else> 
	 		window.location.href="class!edit.action?id=${(class.school.id)!}";
	 	</#if>
	 });
	
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
	
	loadDistirct('${(classes.school.city.id)!}','${(classes.school.district.id)!}');
	
		// 表单验证
	$validateForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		ignoreTitle: true,
		rules: {
			"classes.school.city.id": {
				required: true
			},
			"classes.school.district.id": {
				required: true
			},
			"classes.school.id": {
				required: true
			},
			"classes.grade.id": {
				required: true
			},
			"classes.name": {
				required: true
			}
		},
		submitHandler: function(form) {
			$(form).find(":submit").attr("disabled", true);
			form.submit();
		}
	});
});
</script>
</head>
<body class="input admin">
	<div class="bar">
		<#if isAddAction>添加班级<#else>编辑班级</#if>
	</div> 
	<div id="validateErrorContainer" class="validateErrorContainer">
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" action="<#if isAddAction>class!save.action<#else>school!update.action</#if>" method="post">
			<input type="hidden" name="classes.id" value="${(classes.id)!}" />
			<ul id="tab" class="tab">
				<li>
					<input type="button" value="班级信息" hidefocus />
				</li>
			</ul>
			<table class="inputTable tabContent">
				<tr>
					<th>
						行政区域：
					</th>
					<td>	
							<select id="citySel" name="classes.school.city.id">
									<option value="">请选择...</option>
									<#list cityList as city>
										<option value="${(city.id)!}"  <#if (classes.school.city.id)! == city.id>selected</#if>>
												${(city.name)!}
										</option>			
									</#list>
							</select>&nbsp;&nbsp;
							<select id="districtSel" name="classes.school.district.id" class="selectText" title="所在区县">
								<option value="">请选择...</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						学校名称：
					</th>
					<td>
						  <select id="schoolSel" name="classes.school.id" title="学校名称">
									<option value="">请选择...</option>
									<#list schoolList as school>
										<option value="${(school.id)!}"  <#if (classes.school.city.id)! == school.id>selected</#if>>
												${(school.name)!}
										</option>			
									</#list>
							</select>&nbsp;&nbsp;
							<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						班级所在年级: 
					</th>
					<td>
						 <#-- 
						  <select id="classSel" name="classes.grade.id" title="班级所在年级">
									<option value="">请选择...</option>
									<#list gradeList as gradeas>
										<option value="${(gradeas)!}"  <#if (classes.grade.id)! == gradeas.id>selected</#if>>
												${(gradeas)!}
										</option>			
									</#list>
						</select>&nbsp;&nbsp;
						 -->
						<select id="classSel" name="classes.grade.id" title="班级所在年级">
							<option value="">请选择...</option>
							<option value="10">初一</option>
						</select>
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						班级名称: 
					</th>
					<td>
						<input type="text" title="班级名称" name="classes.name" value=""  class="formText"/>
						<label class="requireField">*</label>
					</td>
				</tr>
			</table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="提交" hidefocus />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="reset" class="formButton"  value="重置" hidefocus />&nbsp;&nbsp;
			</div>
		</form>
	</div>
</body>
</html>

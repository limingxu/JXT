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
	
	var $citySel = $("#citySel");
	var $districtSel = $("#districtSel");
	
	
	//级联地区
	$citySel.change( function() {
		var city_id =$citySel.val();
	    var city_id_request=  '${(classes.school.city.id)!}' ;
	    $districtSel.html('<option value="">请选择...</option>');
	    
	    if(city_id == ''){
	    	if(city_id_request == ''){
	    		$districtSel.attr("disabled", true);
	    		return;
	    	}else{
	    		city_id = city_id_request;
	    	}
	    }else{
	    	$districtSel.attr("disabled", false);
	    }
	    
		$.ajax({
			url: "resource!ajaxGetDistrictByCityId.action",
			data: {cityId: city_id},
			type: "POST",
			dataType: "json",
			cache: false,
			success: function(data) {
				if (data != null) {
					var option = "";
					var district_id = '${(classes.school.district.id)!}' ;
					$.each(data, function(i) {
						<@compress single_line = false>
							if(district_id==data[i].id)
								option += '<option value="'+data[i].id+'" selected>'+data[i].name+'</option>';
							else
								option += '<option value="'+data[i].id+'">'+data[i].name+'</option>';
						</@compress>
					});
					$districtSel.append(option);
				}
			}
		 });
	 });
	 
	 $citySel.change();
	 
	 var $schoolSel = $("#schoolSel");
	 //级联学校
	$districtSel.change( function() {
		var district_id =$districtSel.val();
	    var district_id_request=  '${(classes.school.district.id)!}' ;
	    $schoolSel.html('<option value="">请选择...</option>');
	    
	    if(district_id == ''){
	    	if(district_id_request == ''){
	    		$schoolSel.attr("disabled", true);
	    		return;
	    	}else{
	    		district_id = district_id_request;
	    	}
	    }else{
	    	$schoolSel.attr("disabled", false);
	    }
	    
		$.ajax({
			url: "resource!ajaxSchools.action",
			data: {cityId: $citySel.val(),districtId:district_id},
			type: "POST",
			dataType: "json",
			cache: false,
			success: function(data) {
				if (data != null) {
					var option = "";
					var school_id = '${(classes.school.id)!}' ;
					$.each(data, function(i) {
						<@compress single_line = false>
							if(school_id==data[i].id)
								option += '<option value="'+data[i].id+'" selected>'+data[i].name+'</option>';
							else
								option += '<option value="'+data[i].id+'">'+data[i].name+'</option>';
						</@compress>
					});
					$schoolSel.append(option);
				}
			}
		 });
		 
	 });
	 $districtSel.change();
	 
	 var $reset = $("#reset");
	 $reset.click( function(){
	 	<#if isAddAction>
	 		 window.location.href="class!add.action";
	 	<#else> 
	 		window.location.href="class!edit.action?id=${(class.school.id)!}";
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
		<form id="validateForm" action="<#if isAddAction>class!save.action<#else>class!update.action</#if>" method="post">
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
						  <select id="classSel" name="classes.grade.id" title="班级所在年级">
									<option value="">请选择...</option>
									<#list gradeList as grade>
										<option value="${(grade.id)!}"  <#if (classes.grade.id)! == grade.id>selected</#if>>
												${(grade.name)!}
										</option>			
							</#list>
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						班级名称: 
					</th>
					<td>
						<input type="text" title="班级名称" name="classes.name" value="${(classes.name)!}"  class="formText"/>
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

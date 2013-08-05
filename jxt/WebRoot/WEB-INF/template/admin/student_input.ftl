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
<script type="text/javascript" src="${base}/template/common/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready( function() {
	var $schoolSel =$("#schoolSel");
	var $phaseSel = $("#phaseSel");
	var $gradeSel = $("#gradeSel");
	var $classSel = $("#classSel");
	
	$schoolSel.change( function() {
		var school_id =$schoolSel.val();
	    var school_id_request=  '${(student.classes.school.id)!}' ;
	    $phaseSel.html('');
	    
	    if(school_id == ''){
	    	if(school_id_request == ''){
	    		$phaseSel.attr("disabled", true);
	    		return;
	    	}else{
	    		school_id = school_id_request;
	    	}
	    }else{
	    	$phaseSel.attr("disabled", false);
	    }
	    
		$.ajax({
			url: "resource!ajaxClasses.action",
			data: {schoolId: school_id},
			type: "POST",
			dataType: "json",
			cache: false,
			success: function(data) {
				if (data != null) {
					var option = "";
					$.each(data, function(i) {
						<@compress single_line = false>
							if(school_id_request==data[i].id)
								option += '<option value="'+data[i].grade_id+'" selected>'+data[i].grade_phase+'</option>';
							else
								option += '<option value="'+data[i].grade_id+'">'+data[i].grade_phase+'</option>';
						</@compress>
					});
					$phaseSel.append(option);
				}
			}
		 });
	 });
	$schoolSel.change();
	
	$phaseSel.change( function() {
		var v_id =$schoolSel.val();
	    var v_id_request=  '${(student.classes.school.id)!}' ;
	    $phaseSel.html('');
	    
	    if(v_id == ''){
	    	if(v_id_request == ''){
	    		$phaseSel.attr("disabled", true);
	    		return;
	    	}else{
	    		v_id = v_id_request;
	    	}
	    }else{
	    	$phaseSel.attr("disabled", false);
	    }
	    
		$.ajax({
			url: "resource!ajaxClasses.action",
			data: {schoolId: school_id},
			type: "POST",
			dataType: "json",
			cache: false,
			success: function(data) {
				if (data != null) {
					var option = "";
					$.each(data, function(i) {
						<@compress single_line = false>
							if(school_id_request==data[i].id)
								option += '<option value="'+data[i].grade_id+'" selected>'+data[i].grade_phase+'</option>';
							else
								option += '<option value="'+data[i].grade_id+'">'+data[i].grade_phase+'</option>';
						</@compress>
					});
					$phaseSel.append(option);
				}
			}
		 });
	 });
	$phaseSel.change();
	
	 var $reset = $("#reset");
	 $reset.click( function(){
	 	<#if isAddAction>
	 		 window.location.href="school!add.action";
	 	<#else> 
	 		window.location.href="school!edit.action?id=${(school.id)!}";
	 	</#if>
	 });
	 
	 
		var $validateErrorContainer = $("#validateErrorContainer");
		var $validateErrorLabelContainer = $("#validateErrorContainer ul");
		var $validateForm = $("#validateForm");
		
		// 表单验证
		$validateForm.validate({
			errorContainer: $validateErrorContainer,
			errorLabelContainer: $validateErrorLabelContainer,
			wrapper: "li",
			errorClass: "validateError",
			ignoreTitle: true,
			debug:true,
			rules: {
				"student.classes.school.id":{
					requiredOne:"#schoolSel",
					required:true
				},
				"student.classes.grade.phase" :{
					requiredOne:"#phaseSel",
					required:true
				},
				"student.classes.grade.name" :{
					requiredOne:"#gradeSel",
					required:true
				},
				"student.classes.name" :{
					requiredOne:"#classSel",
					required:true
				},
				"student.stdNum": {
						required: true,
						minlength: 2,
						maxlength: 20
				},
				"student.name": {
					required: true
				},
			
				"student.parent.name": {
					required: true
				},
				"school.parent.phoneNum": {
					isMobile: true,
					required: true
				},
				"school.parent.chargePhoneNum": {
					isMobile: true,
					required: true
				},
				"busiOrder.startDate": {
					required :true,
					date :true
				},
				"busiOrder.endDate": {
					required : true,
					date :true
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
		<#if isAddAction>添加学生家长<#else>编辑学生家长</#if>
	</div> 
	<div id="validateErrorContainer" class="validateErrorContainer">
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" action="<#if isAddAction>school!save.action<#else>school!update.action</#if>" method="post">
			<input type="hidden" name="student.id" value="${(student.id)!}" />
			<div class="listBar">
						选择班级:&nbsp;&nbsp;&nbsp;
						<select id="schoolSel"  name="student.classes.school.id"  size="8" style="width:200px" title="学校">
							<#list admin.adminSchools as adminschool>
								<option value="${(adminschool.school.id)!}" <#if (student.classes.school.id)! == adminschool.school.id>selected</#if>>
										${(adminschool.school.name)!}
								</option>			
							</#list>
						</select> &nbsp;&nbsp;
										
						<select id="phaseSel" name="student.classes.grade.phase"  size="8" style="width:200px" title="学段">
							<option>小学</option>
							<option>中学</option>
						</select> &nbsp;&nbsp;
						<select id="gradeSel" name="student.classes.grade.name"  size="8" style="width:200px" title="年级">
							<option>一年级</option>
							<option>二年级</option>
						</select> &nbsp;&nbsp;
						<select id="classSel" name="student.classes.name"  size="8" style="width:200px" title="班级">
							<option>1班</option>
							<option>2班</option>
						</select>
					</div>
			<table class="inputTable tabContent">
				<tr>
					<th>
						学生学号：
					</th>
					<td>
							<input type="text" name="student.stdNum" value="${(student.stdNum)!}" class="formText" title="学生学号" />
							<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						学生姓名：
					</th>
					<td>	
							<input type="text" name="student.name" value="${(student.name)!}" class="formText" title="学生姓名" />
							<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						家长姓名: 
					</th>
					<td>
							<input type="text" name="student.parent.name" value="${(student.parent.name)!}" class="formText" title="家长姓名" />
							<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						家长手机号: 
					</th>
					<td>
						<input type="text" title="家长手机号" name="school.parent.phoneNum" value="${(school.parent.phoneNum)!}"  class="formText" />
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						家长计费手机号: 
					</th>
					<td>
						<input type="text" title="家长计费手机号" name="school.parent.chargePhoneNum" value="${(school.parent.chargePhoneNum)!}"  class="formText" />
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						服务开始时间: 
					</th>
					<td>
						<input type="text" title="服务开始时间"  name="busiOrder.startDate" value="${(busiOrder.startDate?string("yyyy-MM-dd HH:mm:ss"))!}"  
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"  class="formText" />
						<label class="requireField">*</label>
					</td>
				</tr>
					<tr>
					<th>
						服务结束时间: 
					</th>
					<td>
						<input type="text" title="服务结束时间"  name="busiOrder.endDate"  class="formText"
							value="${(busiOrder.endDate?string("yyyy-MM-dd HH:mm:ss"))!}"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"/>
						<label class="requireField">*</label>
					</td>
				</tr>
			</table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="提交" hidefocus />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="reset" class="formButton"  value="重置" hidefocus />&nbsp;&nbsp;
			</div>
		</form>
	</div>
</body>
</html>

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
		var v_id =$(this).children('option:selected').val();
	    var v_id_request=  '${(student.classes.school.id)!}';
	    var v_element='${(student.classes.grade.phase)!}';
	    var $elmentSel=$phaseSel;
	    
	    $elmentSel.html('');
	    
	    if(v_id == ''){
	    	if(v_id_request == ''){
	    		$elmentSel.attr("disabled", true);
	    		return;
	    	}else{
	    		v_id = v_id_request;
	    	}
	    }else{
	    	$elmentSel.attr("disabled", false);
	    }
	    
		$.ajax({
			url: "resource!ajaxClasses.action",
			data: {schoolId: v_id},
			type: "POST",
			dataType: "json",
			cache: false,
			success: function(data) {
				if (data != null) {
					var option = "";
					var arrObj = new Array()
					$.each(data, function(i) {
						<@compress single_line = false>
							var _exist=$.inArray(data[i].grade_phase,arrObj); 
							if(_exist>=0){
								return true;
							}else{
								arrObj.push(data[i].grade_phase);
							}
						
							if(v_element==data[i].grade_phase)
								option += '<option value="'+data[i].grade_phase+'" selected>'+data[i].grade_phase+'</option>';
							else
								option += '<option value="'+data[i].grade_phase+'">'+data[i].grade_phase+'</option>';
						</@compress>
					});
					$elmentSel.append(option);
				}
			}
		 });
		 refresh();
	 });
	$schoolSel.change();
	
	$phaseSel.change( function() {
		var v_id =$(this).children('option:selected').val();
	    var v_id_request=  '${(student.classes.grade.phase)!}' ;
	    var v_element='${(student.classes.grade.id)!}';
	    var $elmentSel=$gradeSel;
	    $elmentSel.html('');
	    
	    if(v_id == ''){
	    	if(v_id_request == ''){
	    		$elmentSel.attr("disabled", true);
	    		return;
	    	}else{
	    		v_id = v_id_request;
	    	}
	    }else{
	    	$elmentSel.attr("disabled", false);
	    }
	    
		$.ajax({
			url: "resource!ajaxClasses.action",
			data: {schoolId: $schoolSel.val(),gradePhase:v_id},
			type: "POST",
			dataType: "json",
			cache: false,
			success: function(data) {
				if (data != null) {
					var option = "";
					$.each(data, function(i) {
						<@compress single_line = false>
							if(v_element==data[i].grade_id)
								option += '<option value="'+data[i].grade_id+'" selected>'+data[i].grade_name+'</option>';
							else
								option += '<option value="'+data[i].grade_id+'">'+data[i].grade_name+'</option>';
						</@compress>
					});
					$elmentSel.append(option);
				}
			}
		 });
		 refresh();
	 });
	$phaseSel.change();
	
	$gradeSel.change( function() {
		var v_id =$(this).children('option:selected').val();
	    var v_id_request= '${(student.classes.grade.id)!}' ;
	    var v_element='${(student.classes.id)!}';
	    var $elmentSel = $classSel;
	    $elmentSel.html('');
	    
	    if(v_id == ''){
	    	if(v_id_request == ''){
	    		$elmentSel.attr("disabled", true);
	    		return;
	    	}else{
	    		v_id = v_id_request;
	    	}
	    }else{
	    	$elmentSel.attr("disabled", false);
	    }
	    
		$.ajax({
			url: "resource!ajaxClasses.action",
			data: {schoolId: $schoolSel.val(),gradePhase:$phaseSel.val(),gradeId:v_id},
			type: "POST",
			dataType: "json",
			cache: false,
			success: function(data) {
				if (data != null) {
					var option = "";
					$.each(data, function(i) {
						<@compress single_line = false>
							if(v_element==data[i].class_id)
								option += '<option value="'+data[i].class_id+'" selected>'+data[i].class_name+'</option>';
							else
								option += '<option value="'+data[i].class_id+'">'+data[i].class_name+'</option>';
						</@compress>
					});
					$elmentSel.append(option);
				}
			}
		 });
	 });
	$gradeSel.change();
	
    function refresh(){
		if($schoolSel.val()=='' || $schoolSel.val()==null){
			$phaseSel.html('');
			$gradeSel.html('');
			$classSel.html('');
		}
		
		if($phaseSel.val()=='' || $phaseSel.val()==null){
			$gradeSel.html('');
			$classSel.html('');
		}
		if($gradeSel.val()=='' || $gradeSel.val()==null){
			$classSel.html('');
		}
				
	};
	
	
	 var $reset = $("#reset");
	 $reset.click( function(){
	 	<#if isAddAction>
	 		 window.location.href="student!add.action";
	 	<#else> 
	 		window.location.href="student!edit.action?id=${(student.id)!}";
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
				"student.stdName": {
					required: true
				},
				"student.parentPhoneNum": {
					isMobile: true,
					required: true
				},
				"student.parentChargePhoneNum": {
					isMobile: true,
				},
				"busiOrder.startDate": {
					required :true
				},
				"busiOrder.endDate": {
					required : true
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
		<form id="validateForm" action="<#if isAddAction>student!save.action<#else>school!update.action</#if>" method="post">
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
						</select> &nbsp;&nbsp;
						<select id="gradeSel" name="student.classes.grade.id"  size="8" style="width:200px" title="年级">
						</select> &nbsp;&nbsp;
						<select id="classSel" name="student.classes.name"  size="8" style="width:200px" title="班级">
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
							<input type="text" name="student.stdName" value="${(student.stdName)!}" class="formText" title="学生姓名" />
							<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						家长姓名: 
					</th>
					<td>
							<input type="text" name="student.parentName" value="${(student.parentName)!}" class="formText" title="家长姓名" />
					</td>
				</tr>
				<tr>
					<th>
						家长手机号: 
					</th>
					<td>
						<input type="text" title="家长手机号" name="student.parentPhoneNum" value="${(student.parentPhoneNum)!}"  class="formText" />
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						家长计费手机号: 
					</th>
					<td>
						<input type="text" title="家长计费手机号" name="student.parentChargePhoneNum" value="${(student.parentChargePhoneNum)!}"  class="formText" />
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

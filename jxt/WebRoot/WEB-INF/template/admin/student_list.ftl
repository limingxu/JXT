<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>安徽联通家校通</title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.pager.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>

<script type="text/javascript">
$().ready( function() {
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
	 
});
</script>

</head>

<body class="list">
	<div class="bar">
		学生家长管理
	</div>
	<div class="body">
		<form id="listForm" action="class!list.action" method="post">
			<div class="listBar">
				选择班级:&nbsp;&nbsp;&nbsp;
				<select id="schoolSel" name="classes.school.city.id" MULTIPLE size="8" style="width:200px">
					<#list admin.adminSchools as adminschool>
						<option value="${(adminschool.school.id)!}" >
								${(adminschool.school.name)!}
						</option>			
					</#list>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;
								
				<select id="schoolSel" name="classes.school.city.id" MULTIPLE size="8" style="width:200px">
					<option>小学</option>
					<option>中学</option>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;
				<select id="schoolSel" name="classes.school.city.id" MULTIPLE size="8" style="width:200px">
					<option>一年级</option>
					<option>二年级</option>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;
				<select id="schoolSel" name="classes.school.city.id" MULTIPLE size="8" style="width:200px">
					<option>1班</option>
					<option>2班</option>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;
				
				<input type="button" id="searchButton" class="formButton" value="查询" hidefocus />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="searchButton" onclick="location.href='student!add.action'" class="formButton" value="添加" hidefocus />
			</div>
			<table id="listTable" class="listTable">
				<tr>
					<th class="check">
						<input type="checkbox" class="allCheck" />
					</th>
					<th>
						<p name="username" hidefocus>学校名称</p>
					</th>
					
					<th>
						<p name="name" hidefocus>行政区域</p>
					</th>
					<th>
						<p name="email" hidefocus>学段</p>
					</th>
					<th>
						<p name="loginDate" hidefocus>年级</p>
					</th>
					<th>
						<p name="loginDate" hidefocus>班级名称</p>
					</th>
					<th>
						<span>操作</span>
					</th>
				</tr>
					<tr> 
						<td>
							<input type="checkbox" name="ids" value="${admin.id}" />
						</td>
						<td>
							${(classes.school.name)!}
						</td>
						<td>
							${(classes.school.city.name)!}-${(classes.school.district.name)!}
						</td>
						<td>
							${(classes.grade.phase)!}
						</td>
						<td>
							${(classes.grade.name)!}
						</td>
						<td>
							${(classes.name)!}
						</td>
						<td>
							<a href="class!edit.action?id=${(classes.id)!}" title="修改">[修改]</a>
							<a href="class!cancel.action?id=${(classes.id)!}" title="取消">[取消]</a>
						</td>
					</tr>
			</table>
			<#if (pager.result?size > 0)>
				<div class="pagerBar">
					<div class="delete">
						<input type="button" id="deleteButton" class="formButton" url="admin!delete.action" value="批量修改" disabled hidefocus />
					</div>
					<div class="pager">
						<#include "/WEB-INF/template/admin/pager.ftl" />
					</div>
				<div>
			<#else>
				<div class="noRecord">没有找到任何记录!</div>
			</#if>
		</form>
	</div>
</body>
</html>
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
	loadDistirct('${(class.school.city.id)!}','${(class.school.district.id)!}');
	 
});
</script>

</head>

<body class="list">
	<div class="bar">
		班级管理
	</div>
	<div class="body">
		<form id="listForm" action="admin!list.action" method="post">
			<div class="listBar">
				行政区域：&nbsp;&nbsp;
				<select id="citySel" name="class.school.city.id">
					<option value="">请选择...</option>
					<#list cityList as city>
						<option value="${(city.id)!}"  <#if (class.school.city.id)! == city.id>selected</#if>>
								${(city.name)!}
						</option>			
					</#list>
				</select>&nbsp;&nbsp;
				<select id="districtSel" name="class.school.district.id" class="selectText" title="所在区县">
					<option value="">请选择...</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;
				学校名称：&nbsp;&nbsp;
				<input type="text"  name="pager.keyword" value="${(pager.keyword)!}" />
				<input type="button" id="searchButton" class="formButton" value="查询" hidefocus />
				<input type="button" class="formButton" style="text-align:right;" onclick="location.href='class!add.action'" value="添加班级" hidefocus />
				<input type="button" class="formButton" style="text-align:right;" onclick="location.href='class!batchAdd.action'" value="批量导入" hidefocus />
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
					<#list pager.result as school>
					<tr> 
						<td>
							<input type="checkbox" name="ids" value="1" />
						</td>
						<td>
							${(class.school.name)!}
						</td>
						<td>
							${(school.city.name)!}-${(school.district.name)!}
						</td>
						<td>
							${(class.grade.phase)!}
						</td>
						<td>
							${(class.grade.name)!}
						</td>
						<td>
							${(class.name)!}
						</td>
						<td>
							<a href="school!edit.action?id=${(school.id)!}" title="修改">[修改]</a>
							<a href="school!cancel.action?id=${(school.id)!}" title="取消">[取消]</a>
						</td>
					</tr>
			    </#list> 
			</table>
			<#if (pager.result?size > 0)>
				<div class="pagerBar">
					<div class="delete">
						<input type="button" id="deleteButton" class="formButton" url="admin!delete.action" value="取消" disabled hidefocus />
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
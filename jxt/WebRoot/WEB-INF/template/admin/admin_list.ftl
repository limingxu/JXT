<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>管理员列表 - </title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.pager.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
<script type="text/javascript">
$().ready( function() {
	function enableAdmin(id,enableStatusEid){
		$.ajax({
			url: "admin!enable.action",
			data: {id: id},
			type: "GET",
			dataType: "json",
			async: false,
			cache: false,
			success: function(data) {
				if(data && data!=null){
					if(data.status){
						var $status = $("#"+enableStatusEid);
						if($status.attr("class"=="green")){
							$status.removeClass("green");
							$status.addClass("red");
						}else{
							$status.removeClass("red");
							$status.addClass("green");
						}
					}else{
						alert("操作失败!");
					}
				}
			}
		});
	}
}
</script>
</head>
<body class="list">
	<div class="bar">
		管理员列表&nbsp;总记录数: ${pager.totalCount} (共${pager.pageCount}页)
	</div>
	<div class="body">
		<form id="listForm" action="admin!list.action" method="post">
			<div class="listBar">
				<input type="button" class="formButton" onclick="location.href='admin!add.action'" value="添加管理员" hidefocus />
				&nbsp;&nbsp;
				<select name="pager.searchBy">
					<option value="username"<#if pager.searchBy == "username"> selected</#if>>
						用户名
					</option>
					<option value="name"<#if pager.searchBy == "name"> selected</#if>>
						姓名
					</option> 
				</select>
				<input type="text" name="pager.keyword" value="${pager.keyword!}" />
				<input type="button" id="searchButton" class="formButton" value="搜 索" hidefocus />
			</div>
			<table id="listTable" class="listTable">
				<tr>
					<th>
						<a href="#" class="sort" name="username" hidefocus>用户名</a>
					</th>
					<th>
						<a href="#" class="sort" name="email" hidefocus>E-mail</a>
					</th>
					<th>
						<a href="#" class="sort" name="name" hidefocus>姓名</a>
					</th>
					<th>
						<a href="#" class="sort" name="roleType" hidefocus>管理员类型</a>
					</th>
					<th>
						<a href="#" class="sort" name="phoneNum" hidefocus>电话</a>
					</th>
					<th>
						<a href="#" class="sort" name="loginDate" hidefocus>最后登录时间</a>
					</th>
					<th>
						<a href="#" class="sort" name="loginIp" hidefocus>最后登录IP</a>
					</th>
					<th>
						<span>状态</span>
					</th>
					<th>
						<a href="#" class="sort" name="createDate" hidefocus>创建日期</a>
					</th>
					<th>
						<span>操作</span>
					</th>
				</tr>
				<#list pager.result as admin>
					<tr>
						<td>
							${admin.username}
						</td>
						<td>
							${admin.email}
						</td>
						<td>
							${(admin.name)!}
						</td>
						<td>
							${adminTypes.getNameText(admin.roleType)}
						</td>
						<td>
							${(admin.phoneNum)!}
						</td>
						<td>
							<#if admin.loginDate??>
								<span title="${admin.loginDate?string("yyyy-MM-dd HH:mm:ss")}">${admin.loginDate}</span>
							<#else>
								&nbsp;
							</#if>
						</td>
						<td>
							${(admin.loginIp)!}
						</td>
						<td>
							<#if admin.isEnable>
								<span id="status_${admin_index}" class="green">正常</span>
							<#else>
								<span id="status_${admin_index}" class="red"> 未启用 </span>
							</#if>
						</td>
						<td>
							<span title="${admin.createDate?string("yyyy-MM-dd HH:mm:ss")}">${admin.createDate}</span>
						</td>
						<td><#if admin.id!=1>
							<a href="javascript:enableAdmin('${admin.id}','status_${admin_index}')"><#if admin.isEnable>禁用<#else>启用</#if></a>
							</#if>
						</td>
					</tr>
				</#list>
			</table>
			<#if (pager.result?size > 0)>
				<div class="pagerBar">
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

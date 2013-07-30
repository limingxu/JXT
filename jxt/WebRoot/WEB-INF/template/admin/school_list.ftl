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
</head>

<body class="list">
	<div class="bar">
		学校管理&nbsp;总记录数: ${pager.totalCount} (共${pager.pageCount}页)
	</div>
	<div class="body">
		<form id="listForm" action="admin!list.action" method="post">
			<div class="listBar">
				<input type="button" class="formButton" onclick="location.href='school!save.action'" value="添加学校" hidefocus />
				&nbsp;&nbsp;
				<!--
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
				&nbsp;&nbsp;
				<label>每页显示: </label>
				<select name="pager.pageSize" id="pageSize">
					<option value="10"<#if pager.pageSize == 10> selected</#if>>
						10
					</option>
					<option value="20"<#if pager.pageSize == 20> selected</#if>>
						20
					</option>
					<option value="50"<#if pager.pageSize == 50> selected</#if>>
						50
					</option>
					<option value="100"<#if pager.pageSize == 100> selected</#if>>
						100
					</option>
				</select>-->
			</div>
			<table id="listTable" class="listTable">
				<tr>
					<th class="check">
						<input type="checkbox" class="allCheck" />
					</th>
					<th>
						<a href="#" class="sort" name="username" hidefocus>学校名称</a>
					</th>
					<th>
						<a href="#" class="sort" name="email" hidefocus>所属代理商</a>
					</th>
					<th>
						<a href="#" class="sort" name="name" hidefocus>行政区域</a>
					</th>
					
					<th>
						<a href="#" class="sort" name="loginDate" hidefocus>联系方式</a>
					</th>
					<th>
						<span>操作</span>
					</th>
				</tr>
				
					<tr> 
						<td>
							<input type="checkbox" name="ids" value="1" />
						</td>
						<td>
							南门小学
						</td>
						<td>
							锦佳科技
						</td>
						<td>
							合肥 - 庐阳区
						</td>
						<td>
							XXXXXXX
						</td>
						<td>
							<a href="school!edit.action?id=" title="修改">[修改]</a>
							<a href="school!edit.action?id=" title="取消">[取消]</a>
						</td>
					</tr>
			    <!-- <#list pager.result as admin> -->
				<!-- </#list> -->
			</table>
			<#if (pager.result?size > 0)>
				<div class="pagerBar">
					<div class="delete">
						<input type="button" id="deleteButton" class="formButton" url="admin!delete.action" value="删 除" disabled hidefocus />
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
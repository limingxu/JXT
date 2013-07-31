<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加/编辑商铺 - Powered By </title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.methods.js"></script>
<script type="text/javascript" src="${base}/template/common/js/message_cn.js" charset="UTF-8" ></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.translate.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
<script type="text/javascript">
$().ready( function() {

	var $validateErrorContainer = $("#validateErrorContainer");
	var $validateErrorLabelContainer = $("#validateErrorContainer ul");
	
	var $validateForm = $("#validateForm");
	
	// 表单验证
	$validateForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		rules: {
			"shop.name": {
			    required: true,
			    maxlength: 50
			},
			"shop.position": {
			    required: true,
			    maxlength: 10
			},
			"shop.busiArea.id": "required",
			"shop.category.id": "required",
			"shop.major": {
			    maxlength: 50
			},
			"shop.addr": {
			    maxlength: 50
			},
			"shop.contact": {
			    maxlength: 20
			},
			"shop.officePhone": {
			    maxlength: 20
			},
			"shop.mobilePhone": {
			    maxlength: 20
			},
			"shop.qq": {
			    maxlength: 20,
			    digits:true
			},
			"shop.des": {
			    maxlength: 2000
			}
		}
	});
});
</script>
</head>
<body class="input">
	<div class="bar">
		<#if isAddAction>添加商铺<#else>编辑商铺</#if>
	</div>
	<div id="validateErrorContainer" class="validateErrorContainer">
		<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" action="<#if isAddAction>shop!save.action<#else>shop!update.action</#if>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${id}" />
			<table class="inputTable">
				<tr>
					<th>
						商铺LOGO: 
					</th>
					<td>
						<img src="${base}${(shop.ico)!}" style="width: 226px; height: 113px;" />
					</td>
				</tr>
				<tr>
					<th>
						商铺名称: 
					</th>
					<td>
						<input title="商铺名称" type="text" id="busiAreaName" name="shop.name" class="formText" value="${(shop.name)!}" />
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						上传LOGO: 
					</th>
					<td>
						<input type="file" name="img" class="goodsImageFileList" />
					</td>
				</tr>
				<tr>
					<th>
						所属商区: 
					</th>
					<td>
						<select title="所属商区" name="shop.busiArea.id">
							<#list subBusiAreas as busiArea>
								<option value="${busiArea.id}" <#if (busiArea.id == shop.busiArea.id)!> selected</#if>>
									${(busiArea.parent.name)!}-${busiArea.name}
								</option>
							</#list>
						</select>
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						所属分类: 
					</th>
					<td>
						<select title="所属分类" name="shop.category.id">
							<#list categorysTree as category>
								<option value="${category.id}" <#if (category.id == shop.category.id)!> selected</#if> >
									<#if root.grade != 0>
										<#list 1..category.grade as i>
											&nbsp;&nbsp;
										</#list>
									</#if>
									${category.name}
								</option>
							</#list>
						</select>
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						诚信认证: 
					</th>
					<td>
						<@checkbox name="shop.isAuth" value="${(shop.isAuth)!false}" />
					</td>
				</tr>
				<tr>
					<th>
						推荐到首页: 
					</th>
					<td>
						<@checkbox name="shop.isRecommend" value="${(shop.isRecommend)!false}" />
					</td>
				</tr>
				<tr>
					<th>
						商位: 
					</th>
					<td>
						<input  title="商位" type="text" name="shop.position" class="formText" value="${(shop.position)!}" />
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						主营: 
					</th>
					<td>
						<input title="主营" type="text" name="shop.major" class="formText" value="${(shop.major)!}" />
					</td>
				</tr>
				<tr>
					<th>
						地址: 
					</th>
					<td>
						<input title="地址" type="text" name="shop.addr" class="formText" value="${(shop.addr)!}" />
					</td>
				</tr>
				<tr>
					<th>
						联系人: 
					</th>
					<td>
						<input title="联系人" type="text" name="shop.contact" class="formText" value="${(shop.contact)!}" />
					</td>
				</tr>
				<tr>
					<th>
						电话: 
					</th>
					<td>
						<input title="电话" type="text" name="shop.officePhone" class="formText" value="${(shop.officePhone)!}" />
					</td>
				</tr>
				<tr>
					<th>
						手机: 
					</th>
					<td>
						<input  title="手机" type="text" name="shop.mobilePhone" class="formText" value="${(shop.mobilePhone)!}" />
					</td>
				</tr>
				<tr>
					<th>
						QQ: 
					</th>
					<td>
						<input title="QQ" type="text" name="shop.qq" class="formText" value="${(shop.qq)!}" />
					</td>
				</tr>
				<tr>
					<th>
						简介: 
					</th>
					<td>
						<textarea title="简介" name="shop.des" class="formTextarea"> ${(shop.des)!} </textarea>
					</td>
				</tr>
			</table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="确  定" hidefocus />&nbsp;&nbsp;
				<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus />
			</div>
		</form>
	</div>
</body>
</html>
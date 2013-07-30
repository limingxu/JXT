<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加/编辑商区 - Powered By </title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.methods.js"></script>
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
		ignoreTitle: true,
		rules: {
			"busiArea.name":{
			    required: true,
			    maxlength: 50
			},
			"busiArea.sort": {
			    digits: true
			},
			"busiArea.major": {
			    maxlength: 50
			},
			"busiArea.addr": {
			    maxlength: 50
			},
			"parentId": {
			    maxlength: 32
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
<body class="input">
	<div class="bar">
		<#if isAddAction>添加商区<#else>编辑商区</#if>
	</div>
	<div id="validateErrorContainer" class="validateErrorContainer">
		<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" action="<#if isAddAction>busi_area!save.action<#else>busi_area!update.action</#if>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${id}" />
			<table class="inputTable">
				<tr>
					<th>
						商区LOGO: 
					</th>
					<td>
						<img src="${base}${(busiArea.ico)!}" style="width: 136px; height: 83px;" />
					</td>
				</tr>
				<tr>
					<th>
						商区名称: 
					</th>
					<td>
						<input title="商区名称" type="text" id="busiAreaName" name="busiArea.name" class="formText" value="${(busiArea.name)!}" />
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
						上级商区: 
					</th>
					<td>
						<#if isAddAction>
							<select title="上级商区" name="parentId">
								<option value="">顶级分类</option>
								<#list roots as root>
									<option value="${root.id}">
										<#if root.grade != 0>
											<#list 1..root.grade as i>
												&nbsp;&nbsp;
											</#list>
										</#if>
										${root.name}
									</option>
								</#list>
							</select>
						<#else>
							${(busiArea.parent.name)!'顶级分类'}
						</#if>
					</td>
				</tr>
				<tr>
					<th>
						排序/楼层: 
					</th>
					<td>
						<input title="排序/楼层" type="text" name="busiArea.sort" class="formText" value="${(busiArea.sort)!}" title="只允许输入零或正整数" />
					</td>
				</tr>
				<tr>
					<th>
						主营: 
					</th>
					<td>
						<input title="主营" type="text" name="busiArea.major" class="formText" value="${(busiArea.major)!}" />
					</td>
				</tr>
				<tr>
					<th>
						地址: 
					</th>
					<td>
						<input title="地址" type="text" name="busiArea.addr" class="formText" value="${(busiArea.addr)!}" />
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="${base}/template/admin/css/skin.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/table_css.css" rel="stylesheet" type="text/css" />
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
	
	// 表单验证
	$validateForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		ignoreTitle: true,
		rules: {
			"school.name": {
					required: true,
					username: true,
					minlength: 2,
					maxlength: 	 20
				},
			"school.city.id": {
				required: true
			},
		
			"school.district.id": {
				required: true
			},
			"school.agent.shortName": {
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

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #EEF2FB;
}
-->
</style>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="${base}/template/admin/images/mail_leftbg.gif"><img src="${base}/template/admin/images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="${base}/template/admin/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt"><#if isAddAction>添加学校<#else>编辑学校</#if></div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="${base}/template/admin/images/mail_rightbg.gif"><img src="${base}/template/admin/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  
<form id="validateForm" action="<#if isAddAction>school!save.action<#else>school!update.action</#if>" method="post">
	<input type="hidden" name="isAddAction" value="${(isAddAction)!}" />
	<input type="hidden" name="id" value="${(school.id)!}" />
  <tr>
    <td valign="middle" background="${base}/template/admin/images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2" valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
      </tr>

  	<div id="validateErrorContainer" class="validateErrorContainer">
		<!--<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>-->
		<ul></ul>
	</div>
	
      <tr>
        <td colspan="2" valign="top">
		    <table width="80%" align="center">
		    	<tr>
					<td valign="middle" align="right" class="left_txt">学校名称:&nbsp;&nbsp;</td>
					<td class="left_txt">
						<input type="text" name="school.name" value="${(school.name)!}" class="formText" title="学校名称" />&nbsp;
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<td width="40%" valign="middle" align="right" class="left_txt">所在城市：&nbsp;&nbsp;
					</td>
					<td width="60%">
						<select id="citySel" name="school.city.id" class="left_txt" width="180px" title="所在城市">
							<option value="">请选择...</option>
							<#list cityList as city>
								<option value="${(city.id)!}"  <#if (school.city.id)! == city.id>selected</#if>>
									${(city.name)!}
								</option>
							</#list>
						</select> 
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<td width="40%" valign="middle" align="right" class="left_txt">所在区县：&nbsp;&nbsp;
					</td>
					<td width="60%">
						<select id="districtSel" name="school.district.id" class="left_txt" title="所在区县">
							<option value="">请选择...</option>
							<#list districtList as district>
									<option value="${(district.id)!}"  <#if (school.district.id)! == district.id>selected</#if>>
										${(district.name)!}
									</option>
								</#list>
						</select>
						<label class="requireField">*</label>
					</td>
				</tr>
				
				<tr>
					<td width="40%" valign="middle" align="right" class="left_txt">代理商：&nbsp;&nbsp;
					</td>
					<td width="60%">
						<input type="hidden" name="school.agent.id" value="${(agent.id)!}">
						<input type="text" title="代理商" name="school.agent.shortName" value="${(agent.shortName)!}" class="left_txt" color="red" <#if isAddAction>disabled</#if>  />
						<label class="requireField">*</label>
					</td>
				</tr>
				
				<tr>
					<td width="40%" valign="middle" align="right" class="left_txt">学校联系方式：&nbsp;&nbsp;
					</td>
					<td width="60%">
						<textarea name="school.description" class="left_txt">${(school.description)!}</textarea>
						<label class="requireField">*</label>
					</td>
				</tr>

				<tr>
					<td align="center" class="left_txt" colspan="2">
						<input type="submit" class="formButton" value="提交" hidefocus />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" id="reset" class="formButton"  value="重置" hidefocus />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返 回" hidefocus />
					</td>
				</tr>
			</table>
		</td>
      </tr>
</form>
      <tr>
        <td colspan="2">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      
      
    </table></td>
    <td background="${base}/template/admin/images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="${base}/template/admin/images/mail_leftbg.gif"><img src="${base}/template/admin/images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="${base}/template/admin/images/buttom_bgs.gif"><img src="${base}/template/admin/images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="${base}/template/admin/images/mail_rightbg.gif"><img src="${base}/template/admin/images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</body>
</html>
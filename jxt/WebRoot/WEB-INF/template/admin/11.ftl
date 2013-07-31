<#include "/WEB-INF/template/shop/includes/layout_shoper.ftl" encoding="UTF-8"/>
<#macro head>
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
			    maxlength: 50,
			    remote: "shoper!ajaxCheckShopName.action?id=${shop.id}"
			},
			"shop.position": {
			    required: true,
			    maxlength: 10
			},
			"shop.busiArea.id": "required",
			"shop.category.id": "required",
			"shop.major": {
				required: true,
			    maxlength: 50
			},
			"shop.addr": {
			    maxlength: 50
			},
			"shop.contact": {
			    maxlength: 20
			},
			"shop.officePhone": {
				minlength: 7,
			    maxlength: 17
			},
			"shop.mobilePhone": {
				required: true,
				minlength: 7,
			    maxlength: 17
			},
			"shop.qq": {
			    maxlength: 20,
			    digits:true
			},
			"shop.des": {
			    maxlength: 2000
			}
		},
		messages: {
			"shop.name": {
				remote: "商铺名称已存在,请重新输入!"
			}
		}
	});
	
	var $busiAreaSel = $("#busiAreaSel");
	var $categorySel = $("#categorySel");
	
	$busiAreaSel.change(function(){
		if($busiAreaSel.val()=="")
			return false;
		$categorySel.html('<option value="">请选择...</option>');
		$.ajax({
			url: "mem!ajaxGetBusiAreaCategorys.action",
			data: {id: $busiAreaSel.val()},
			type: "POST",
			dataType: "json",
			cache: false,
			success: function(data) {
				if (data != null) {
					var option = "";
					$.each(data, function(i) {
						<@compress single_line = true>
							option += '<option value="'+data[i].id+'">'+data[i].name+'</option>';
						</@compress>
					});
					$categorySel.append(option);
				}
			}
		 });
	});
});
</script>
</#macro>
<#escape x as x?html>  
<#macro content>

<div class="container">
 <div class="containerIn">
 <br>
 <div class="mainL" style="width:222px;">
    <@ftags.shoperLeft/>
 </div> <!-- mainL -->
 <div class="mainR" style="width:770px">
   <div class="box">
      <div class="title">商铺资料修改</div>
      <div class="content">
         <div style="background:#DDD; margin-top:10PX;">
         <div id="validateErrorContainer" class="validateErrorContainer">
			<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
			<ul></ul>
		</div>
         <form id="validateForm" action="shoper!updateProfile.action" method="post" enctype="multipart/form-data">
         	<input type="hidden" name="shop.id" value="${shop.id}" />
         	<input type="hidden" name="id" value="${shop.id}" />
			<div style="background:#DDD; margin-top:10PX;">
         <table width="100%" border="0" cellspacing="1" cellpadding="5">
           <tr>
             <td width="100" bgcolor="#f8f8f8">用户名</td>
             <td bgcolor="#FFFFFF">${member.username}</td>
           </tr>
           <#if shop.ico!"" != "">
           <tr>
				<td bgcolor="#f8f8f8">
					LOGO: 
				</td>
				<td bgcolor="#FFFFFF">
					<img src="${base}${(shop.ico)!}" style="width: 226px; height: 113px;" />
				</td>
			</tr>
		   </#if>
           <tr>
             <td bgcolor="#f8f8f8">商铺LOGO</td>
             <td bgcolor="#FFFFFF"><input title="商铺LOGO" type="file" name="logoImg" class=" inputBorder"><label class="requireField">请上传照片</label></td>
           </tr>
           <tr>
             <td bgcolor="#f8f8f8">商铺名称</td>
             <td bgcolor="#FFFFFF"><input  title="商铺名称" type="text" name="shop.name" value="${(shop.name)!}" class=" inputBorder"><label class="requireField">*</label></td>
           </tr>
           <tr>
             <td bgcolor="#f8f8f8">所属商区</td>
             <td bgcolor="#FFFFFF">
             <select id="busiAreaSel" title="所属商区" name="shop.busiArea.id">
                <option value="">请选择...</option>
				<#list subBusiAreas as busiArea>
					<option value="${busiArea.id}" <#if (shop.busiArea.id)! == busiArea.id>selected</#if>>
						${(busiArea.parent.name)!}-${busiArea.name}
					</option>
				</#list>
			 </select>
			 <label class="requireField">*</label>
             </td>
           </tr>
           <tr>
             <td bgcolor="#f8f8f8">所属分类</td>
             <td bgcolor="#FFFFFF">
             <select id="categorySel" title="所属分类" name="shop.category.id">
				 <option value="">请选择...</option>
				 <#list categorys as category>
					<option value="${category.id}" <#if (shop.category.id)! == category.id>selected</#if>>
						${category.name}
					</option>
				</#list>
			 </select>
			 <label class="requireField">*</label>
             </td>
           </tr>
           <tr>
             <td bgcolor="#f8f8f8">商位</td>
             <td bgcolor="#FFFFFF"><input title="商位" type="text" name="shop.position" value="${(shop.position)!}" class=" inputBorder"><label class="requireField">*</label></td>
           </tr>
           <tr>
             <td bgcolor="#f8f8f8">主营</td>
             <td bgcolor="#FFFFFF"><input  title="主营" type="text" name="shop.major" value="${(shop.major)!}" class=" inputBorder"><label class="requireField">*</label></td>
           </tr>
           <tr>
				<td bgcolor="#f8f8f8">
					地址: 
				</td>
				<td bgcolor="#FFFFFF">
					<input title="地址" type="text" name="shop.addr" value="${(shop.addr)!}" class="inputBorder" " />
				</td>
			</tr>
			<tr>
				<td bgcolor="#f8f8f8">
					联系人: 
				</td>
				<td bgcolor="#FFFFFF">
					<input title="联系人" type="text" name="shop.contact" value="${(shop.contact)!}" class="inputBorder" />
				</td>
			</tr>
			<tr>
				<td bgcolor="#f8f8f8">
					电话: 
				</td>
				<td bgcolor="#FFFFFF">
					<input title="电话" type="text" name="shop.officePhone" class="inputBorder" value="${(shop.officePhone)!}" />
				</td>
			</tr>
           <tr>
             <td bgcolor="#f8f8f8">手机</td>
             <td bgcolor="#FFFFFF"><input  title="手机" type="text" name="shop.mobilePhone" value="${(shop.mobilePhone)!}" class=" inputBorder"><label class="requireField">*</label></td>
           </tr>
           <tr>
				<td bgcolor="#f8f8f8">
					QQ: 
				</td>
				<td bgcolor="#FFFFFF">
					<input title="QQ" type="text" name="shop.qq" class="inputBorder" value="${(shop.qq)!}" />
				</td>
			</tr>
		   <tr>
             <td bgcolor="#f8f8f8">简介</td>
             <td bgcolor="#FFFFFF">
             <textarea class="formTextarea" title="简介" name="shop.des" style="width: 345px; height: 119px;">${(shop.des)!}</textarea>
             </td>
            </tr>
           <tr>
             <td colspan="2" bgcolor="#f8f8f8" align="center">
               <input id="submitButton" type="submit" class="button red" value="确定" hidefocus />
             </td>
           </tr>
         </table>
         </div>
		</form>
         </div>
      </div> <!-- content -->
   </div> <!-- box -->
 </div> <!-- mainR -->
 </div> <!-- containerIn -->
</div> <!-- container -->
<div class="clear"></div>
</#macro> 
</#escape>

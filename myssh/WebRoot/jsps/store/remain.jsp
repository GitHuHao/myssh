<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>货物统计</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/maple.css'/>"></link>
<style type="text/css">
	.tx td{
		padding:3px;
	}
	.store{
		width:100%;
		border:1px solid gray;
		border-collapse:collapse;
	}
	.store td{
		border:1px solid gray;
		padding:3px;
	}
	.store a{
		text-decoration:underline;
		color:blue;
	}
</style>
<!-- 引入jquery , jquery版本使用1.4+ -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	// 页面加载后 执行
	$(function(){
		// 发起ajax请求，获取仓库列表
		$.post("${pageContext.request.contextPath}/store_ajaxlist.action",function(data){
			// 使用火狐firebug插件，将信息输出到浏览器控制台
			console.info(data);
			// 将data数据 ，显示select下拉列表中 
			// 针对id为storeSelect的select元素，添加 <option>
			for(var i=0 ; i< data.stores.length; i++){
				var store = data.stores[i];// 每个仓库
				var $option = $("<option value='"+store.id+"'>"+store.name+"</option>");
				// 加入select
				$("#storeSelect").append($option);
			}
		});
	});
</script>
</head>
<body>
	<table border="0" class="tx" width="100%">
		<tr>
			<td>当前位置&gt;&gt;首页&gt;&gt;货物库存</td>
		</tr>
	</table>
	<br>
	<table border="0" width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td rowspan="1">
				<s:form action="goods_list" namespace="/" method="post" theme="simple" name="select">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tx" align="center">
						<colgroup>
							<col width="20%" align="right">
							<col width="*%" align="left">
						</colgroup>
						<tr>
							<td bgcolor="a0c0c0" style="padding-left:10px;" colspan="2" align="left">
								<b>查询条件：</b>
							</td>
						</tr>
						<tr>
							<td>
								简记码：
							</td>
							<td>
								<s:textfield cssClass="tx" name="nm"></s:textfield>
							</td>
						</tr>
						<tr>
							<td>
								货物名称：
							</td>
							<td>
								<s:textfield cssClass="tx" name="name"></s:textfield>
							</td>
						</tr>
						<tr>
							<td>
								选择仓库：
							</td>
							<td>
								<select class="tx" style="width: 120px;" name="store.id" id="storeSelect">
									<option value="">请选择仓库</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right" style="padding-top:10px;">
								<input class="tx" style="width:120px;margin-right:30px;" type="button" onclick="document.forms[0].submit();" value="查询">
							</td>
						</tr>
					</table>
				</s:form>
			</td>
			<td valign="top" width="20%">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td background="<c:url value='/picture/loginpage.gif'/>" align="center"><br>
						<font color="red">操作步骤</font>
						</td>
					</tr>
					<tr>
						<td background="<c:url value='/picture/bg1.jpg'/>" style="padding-left:10px;">
							1.显示所有货物的库存情况
							<br/>
							2.根据条件查询某种货的库存情况
							<br/>
							3.出入库完成后显示某种货物的库存情况
						</td>
					</tr>
					<tr>
						<td><img src="<c:url value='/picture/bottom.jpg'/>"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr valign="top">
			<td rowspan="2">
				<form action="" method="post" name="select">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tx" align="center">
						<colgroup>
							<col width="20%" align="right">
							<col width="*%" align="left">
						</colgroup>
						<tr>
							<td bgcolor="a0c0c0" style="padding-left:10px;" colspan="1" align="left">
								<b>货物库存：</b>
							</td>
						</tr>
						<tr>
							<td>
								<table class="store">
									<tr style="background:#D2E9FF;text-align: center;">
										<td>简记码</td>
										<td>名称</td>
										<td>计量单位</td>
										<td>库存数量</td>
										<td>所在仓库</td>
										<td>操作</td>		
									</tr>
									<s:iterator value="goodsList" var="goods">
									<tr>
										<td><s:property value="#goods.nm"/></td>
										<td><s:property value="#goods.name"/></td>
										<td><s:property value="#goods.unit"/></td>
										<td><s:property value="#goods.amount"/></td>
										<td><s:property value="#goods.store.name"/></td>	
										<td>
											<a href="<c:url value='/jsps/save/save.jsp'/>">入库</a>
											<a href="<c:url value='/jsps/out/out.jsp'/>">出库</a>
											<a href="<c:url value='/jsps/his/his.jsp'/>">历史记录</a>
										</td>		
									</tr>
									</s:iterator>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>


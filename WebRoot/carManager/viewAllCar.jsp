<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'viewCar.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}

.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}

.STYLE6 {
	color: #000000;
	font-size: 12;
}

.STYLE10 {
	color: #000000;
	font-size: 12px;
}

.STYLE19 {
	color: #344b50;
	font-size: 12px;
}

.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}

.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
</style>
		<script type="text/javascript">
	function checkDel(carNumber)
	{
		if(confirm("您确定要删除吗？"))
		{
			document.getElementById("carNumber2").value=carNumber;
			document.forms[0].action="deleteCar.do";
			document.forms[0].submit();
		}
	}
	function checkShow(carNumber)
	{
			document.getElementById("carNumber2").value=carNumber;
			document.forms[0].action="findCar.do";
			document.forms[0].submit();
	}
		function subForm(pageIndex){
			document.getElementById('pageIndex').value=pageIndex;
			document.forms[0].submit();
		}
		function subZForm(){
			var pageIndex=document.getElementById('textfield').value;
			document.getElementById('pageIndex').value=pageIndex;
			document.forms[0].submit();
		}
		function selectCar(obj){
			var cars = document.getElementsByName("carid");
			if(obj==0){
				for(var i=0;i<cars.length;i++){
					cars[i].checked=true;
				}
			}
			if(obj==1){
				for(var i=0;i<cars.length;i++){
					cars[i].checked=!cars[i].checked;
				}
			}
			if(obj==2){
				for(var i=0;i<cars.length;i++){
					cars[i].checked=false;
				}
			}
		}
		function qxSelect(obj){
			document.getElementById(obj).checked=false;
		}
		function qxAll(obj){
			var flag=document.getElementById(obj).checked;
			if(!flag){
				var cars = document.getElementsByName("carid");
				for(var i=0;i<cars.length;i++){
					cars[i].checked=false;
				}
			}else{
				var cars = document.getElementsByName("carid");
				for(var i=0;i<cars.length;i++){
					cars[i].checked=true;
				}
			}
		}
		function testOver(obj){
			obj.style.color="red";
		}
		function testOut(obj){
			obj.style.color="";
		}
		function deleteAll(){
			var flag=false;
			var cars = document.getElementsByName("carid");
			for(var i=0;i<cars.length;i++){
				if(cars[i].checked){
					flag=true;
					break;
				}				
			}
			if(flag){
				if(confirm("删除后不能恢复，确认删除？")){
					document.forms[0].action="DeleteAllCarServlet.do";
					document.forms[0].submit();
				}
			}else{
				alert("至少选择一辆汽车");
			}
		}
		 function subTiaoForm(totalPage){
			var pageIndex=document.getElementById('textfield').value;
			if(pageIndex<1||pageIndex>totalPage){
				alert("请输入正确页码");
			}else{
			document.getElementById('pageIndex').value=pageIndex;
			document.forms[0].submit();
			}
		}
		
	
</script>

	</head>

	<body>
		<form action="findAllCar.do" method="post">
			<input type="hidden" name="carNumber2" id="carNumber2" />
			<input type="hidden" name="carNumber" id="carNumber"
				value="${ requestScope.car.carNumber }" />
			<input type="hidden" name="carType"
				value="${ requestScope.car.carType }" />
			<input type="hidden" name="color" value="${ requestScope.car.color }" />
			<input type="hidden" name="price" value="${ requestScope.car.price }" />
			<input type="hidden" name="rentPrice"
				value="${ requestScope.car.rentPrice }" />
			<input type="hidden" name="deposit"
				value="${ requestScope.car.deposit }" />
			<input type="hidden" name="isRenting"
				value="${ requestScope.car.isRenting }" />
			<input type="hidden" name="pageIndex" value="" id="pageIndex" />
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="30">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="24" bgcolor="#353c44">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="2%" height="19" valign="middle">
															<div align="center"
																style="margin-top: 4px; margin-left: 3px;">
																<img src="images/tb.gif" width="14" height="14" />
															</div>
														</td>
														<td width="94%" valign="middle">
															<span class="STYLE1" style="color: white;">&nbsp;&nbsp;汽车基本信息列表</span>
														</td>
													</tr>
												</table>
											</td>
											<td>
												<div align="right">
													<span class="STYLE1"> <input type="radio"
															name="radio1" id="radio1" onclick="selectCar(0)"
															onblur="qxSelect(this.id)" /> 全选 &nbsp; <input
															type="radio" name="radio2" id="radio2"
															onclick="selectCar(1)" onblur="qxSelect(this.id)" /> 反选
														&nbsp; <input type="radio" name="radio3" id="radio3"
															onclick="selectCar(2)" onblur="qxSelect(this.id)" /> 取消
														&nbsp; <img src="images/del.gif" width="10" height="10" /><a
														onclick="deleteAll()" style="cursor: hand;">删除</a>
														&nbsp;&nbsp;</span><span class="STYLE1"> &nbsp;</span>
												</div>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="0" cellpadding="0" cellspacing="1"
							bgcolor="#a8c7ce">
							<tr>
								<td width="4%" height="20" bgcolor="d3eaef" class="STYLE10">
									<div align="center">
										<input type="checkbox" name="checkbox" id="checkbox"
											onclick="qxAll(this.id)" />
									</div>
								</td>
								<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">车号</span>
									</div>
								</td>
								<td width="15%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">型号</span>
									</div>
								</td>
								<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">颜色</span>
									</div>
								</td>
								<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">价格</span>
									</div>
								</td>
								<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">租金</span>
									</div>
								</td>
								<td width="14%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">押金</span>
									</div>
								</td>
								<td width="14%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">租用情况</span>
									</div>
								</td>
								<td width="14%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">操作</span>
									</div>
								</td>
							</tr>
							<c:forEach var="c" items="${requestScope.page.result }">
								<tr>
									<td height="20" bgcolor="#FFFFFF">
										<div align="center">
											<input type="checkbox" name="carid" id="carid"
												value="${ c.carNumber}" />
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE6">
										<div align="center">
											<span class="STYLE19">${ c.carNumber}</span>
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${c.carType}
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${c.color}
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${c.price}
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${c.rentPrice}
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${c.deposit}
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${c.isRenting==0?'未出租':'已出租'}
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF">
										<div align="center" class="STYLE21">
											<a href="javascript:void(0)"
												onclick="checkDel('${c.carNumber }')">删除</a> |
											<a href="javascript:void(0)"
												onclick="checkShow('${c.carNumber }')">查看</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<td height="30">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="33%">
									<div align="left">
										<span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong>
												${page.countRow }</strong> 条记录，当前第<strong>${page.currPage }</strong>
											页，共 <strong>${page.totalPage }</strong> 页</span>
									</div>
								</td>
								<td width="67%">
									<table width="370" border="0" align="right" cellpadding="0"
										cellspacing="0">
										<tr>
											<td width="49">
												<div align="center">
													<c:if test="${requestScope.pageIndex > 1}">
														<img src="images/main_54.gif" width="40" height="15"
															onclick="subForm('1')" />
													</c:if>
												</div>
											</td>
											<td width="49">
												<div align="center">
													<c:if test="${requestScope.pageIndex > 1}">
														<img src="images/main_56.gif" width="45" height="15"
															onclick="subForm('${requestScope.pageIndex - 1 }')" />
													</c:if>

												</div>
											</td>
											<td>
												<div align="center" style="margin-top: -2px;">
													<c:forEach begin="1" end="${requestScope.page.totalPage}"
														varStatus="c">
														<c:choose>
															<c:when test="${requestScope.pageIndex eq c.count}">
																<a style="text-decoration: none; cursor: hand;"
																	onclick="subForm('${c.count }')"><font color="red">${c.count
																		}</font> </a>
															</c:when>
															<c:otherwise>
																<a style="text-decoration: none; cursor: hand;"
																	onclick="subForm('${c.count }')">${c.count }</a>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</div>
											</td>
											<td width="49">
												<div align="center">
													<c:if
														test="${requestScope.pageIndex < requestScope.page.totalPage}">
														<img src="images/main_58.gif" width="45" height="15"
															onclick="subForm('${requestScope.pageIndex + 1 }')" />
													</c:if>
												</div>
											</td>
											<td width="49">
												<div align="center">
													<c:if
														test="${requestScope.pageIndex < requestScope.page.totalPage}">
														<img src="images/main_60.gif" width="40" height="15"
															onclick="subForm('${page.totalPage }')" />
													</c:if>
												</div>
											</td>
											<td width="37" class="STYLE22">
												<div align="center">
													转到
												</div>
											</td>
											<td width="22">
												<div align="center" style="margin-top: -2px;">
													<input type="text" name="textfield" id="textfield"
														style="width: 30px; height: 15px; font-size: 12px; border: solid 1px #7aaebd;" />
												</div>
											</td>
											<td width="22" class="STYLE22">
												<div align="center">
													页
												</div>
											</td>
											<td width="35">
												<img src="images/main_62.gif" width="26" height="15"
													onclick="subTiaoForm(${page.totalPage })" />
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<font color="red">${requestScope.msg }</font>
		</form>
	</body>
</html>

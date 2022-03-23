<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false" %> 

<%String path = request.getContextPath();%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<style rel="stylesheet" type="text/css">
		.c1-bline{border-bottom:#999 1px dashed;border-top:1px;} 
		.f-right{float:right}
		.f-left{float:left}
		.clear{clear:both}
	</style>
	
	<script type="text/javascript">
			function cx()
            {
                
                    if(document.form2.neirong.value=="")
	                {
	                    alert("请输入信息内容");
	                    return false;
	                }
	                document.form2.submit();
               
            }
			
      </script>
    
    
</head>
  

<body>


<jsp:include flush="true" page="/qiantai/top.jsp"></jsp:include>





<div class="con_sy">
	<table border="0">
	    <tr>
	        <td align="left" valign="top">
	            <div style="width:900px;margin-top: 1px;">
				      <%-- <div style="height:24px;background:url(<%=path %>/images/left111.jpg);">
				         <span style="float:left;font-family: 微软雅黑;font-size: 12px;margin-top: 3px;margin-left: 10px;">111</span>
				      </div> --%>
				      <div style="height: 100%;border:1px solid #CCCCCC;">
				          <div style="padding-top: 10px;padding-left: 10px;padding-right: 10px;">
				                <form action="<%=path %>/liuyan?type=liuyanAdd" name="form2" method="post">
					              <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1">
										<tr align='center' height="40">
											<td style="width: 100px;" align="right">
												信息内容：										    
											</td>
											<td align="left">
												<input name="neirong" type="text" style="width: 480px;"/>
											</td>
										</tr>
										<tr align='center' height="40">
											<td style="width: 100px;" align="right">
												留言时间：										    
											</td>
											<td align="left">
												<input name="liuyanshi" type="text" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date())%>" style="width: 200px;"/>
											    
											</td>
										</tr>
										<tr align='center' height="40">
										   <td style="width: 100px;" align="left"></td>
										   <td align="left">
										      <input type="hidden" name="yisheng_id" value="<%=request.getParameter("yisheng_id") %>">
										      <input type="button" value="确定" onclick="cx()" style="width: 70px;"/>&nbsp; 
										      <input type="reset" value="重置" style="width: 70px;"/>&nbsp;	
										   </td>
										</tr>
								  </table>
					              </form> 
				          </div>
				      </div>
				 </div>
				 
	        </td>
	        <td align="left" valign="top">
		        <jsp:include flush="true" page="/qiantai/right.jsp"></jsp:include>
	        </td>
	    </tr>
	</table>
</div>












<jsp:include flush="true" page="/qiantai/down.jsp"></jsp:include>




</body>
</html>

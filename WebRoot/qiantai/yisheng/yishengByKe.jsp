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
            
    </script>
    
    
</head>
  

<body>


<jsp:include flush="true" page="/qiantai/top.jsp"></jsp:include>





<div class="con_sy">
	<table border="0">
	    <tr>
	        <td align="left" valign="top">
	            <div style="width:900px;margin-top: 1px;">
				      <div style="height: 100%;border:0px solid #CCCCCC;">
				          <div style="padding-top: 5px;padding-left: 5px;padding-right: 5px;">
				                <TABLE border=0 >
									              <TR>
									                  <c:forEach items="${requestScope.yishengList}" var="yisheng" varStatus="sta">
									                    <c:if test="${sta.index%4==0}">
									                       </tr><tr>
									                    </c:if>
										                <TD>
										                  <TABLE>
										                    <TR>
										                      <TD style="border:1px solid  #CCCCCC;">
										                           <center>
										                              <A href="<%=path %>/yisheng?type=yishengDetailQian&id=${yisheng.id}">
										                              <IMG border=0 src="<%=path %>/${yisheng.fujian}" width=190 height=220 style="margin: 15px;"></A>
										                           </center>
										                           <center style="margin-top: -13px;">
										                              <A href="<%=path %>/yisheng?type=yishengDetailQian&id=${yisheng.id}">${yisheng.xingming}</A>
										                           <center>
										                      </TD>
										                    </TR>
										                  </TABLE>
										                </TD>
									                </c:forEach>
									              </TR>
								</TABLE><br/>
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

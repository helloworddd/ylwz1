<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
	<script src="<%=path %>/js/global.js" type="text/javascript"></script>
    <script src="<%=path %>/js/head.js" type="text/javascript"></script>
    
    <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>

<!--  -->
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/main.css"/>
	<link rel="stylesheet" href="<%=path %>/css/qiantai.css" />
	<link rel="stylesheet" href="<%=path %>/css/head.css" />
	<link rel="stylesheet" href="<%=path %>/css/nav.css" />
	
	<script type="text/javascript" src="<%=path %>/js/jq.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		    $(".hdpic dd a").hover(function() {
		        $(this).find(".picshine").stop();
		        $(this).find(".picshine").css("background-position", "-235px 0");
		        $(this).find(".picshine").animate({
		            backgroundPosition: '235px 0'
		        },
		        500);
		        $(this).find(".pictitle").stop().animate({
		            left: '0px'
		        },
		        {
		            queue: false,
		            duration: 450
		        });
		    },
		    function() {
		        $(this).find(".pictitle").stop().animate({
		            left: '-1135px'
		        },
		        {
		            queue: false,
		            duration: 200
		        });
		    });
		});
	</script>

    <script type="text/javascript">
        function userLogout()
		{                                                                                         
			 document.getElementById("indicator").style.display="block";
			 loginService.userLogout(callback_logout);
		}
		
		function callback_logout(data)
		{
		    document.getElementById("indicator").style.display="none";
		    if(data=="no")
		    {
		        alert("账号或密码错误");
		    }
		    if(data=="yes")
		    {
		        alert("成功退出系统");
		        window.location.href="<%=path %>/qiantai/default.jsp";
		    }
		}
		
        
        function guanlizhongxin()
		{
		    var targetWinUrl="<%=path %>/auser/index.jsp";
			window.location.href=targetWinUrl;
		}
    </script>
</head>
  

<body>


<div class="top">
	<div class="top1">
		<div class="top1_main">
		    <span class="dl" style="margin-left: 80px;">您好，欢迎光临！
		        <c:if test="${sessionScope.userType !=1}">
			        <a href="<%=path %>/qiantai/user/userLogin.jsp"> [用户登录]</a>  
			        <a href="<%=path %>/qiantai/user/userReg.jsp">[在线注册]</a>
		        </c:if>
		        
		        <c:if test="${sessionScope.userType ==1}">
		            <a href="#" style="margin-left: 8px;">欢迎你：${sessionScope.user.loginname}</a>  
		            <a href="#" style="margin-left: 8px;" onclick="userLogout()">退出系统</a>  
		            <a href="#" style="margin-left: 8px;" onclick="guanlizhongxin()">用户中心</a>
		            <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/> 
		        </c:if>
		    </span>
		    <span class="yh_zx" style="margin-right: 100px;">
		    </span>
		</div>
	</div>
	<div class="top_logo">
	    <div class="logo">
					<%--<img src="/zxwz/images/logo.png" width="1200" height="150" style="margin-right:0px;"/> --%>
	      <div style="font-size: 22px;margin-top: 40px;margin-left: 0px;">捷医——您的便捷就医指南！</div>
	    </div>
	    
    </div>
</div>



<!--导航开始-->
<style>
/* 下拉按钮样式 */
.dropbtn {
    background-color: #104E8B;
    color: white;
    padding: 9px 35px;
    font-size: 14px;
    border: none;
    cursor: pointer;
    font-family: Tahoma;
    text-align: center;
}

/* 容器 <div> - 需要定位下拉内容 */
.dropdown {
    position: relative;
    display: inline-block;
}

/* 下拉内容 (默认隐藏) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

/* 下拉菜单的链接 */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/* 鼠标移上去后修改下拉菜单链接颜色 */
.dropdown-content a:hover {background-color: #104E8B}

/* 在鼠标移上去后显示下拉菜单 */
.dropdown:hover .dropdown-content {
    display: block;
}

/* 当下拉内容显示后修改下拉按钮的背景颜色 */
.dropdown:hover .dropbtn {
    background-color: #104E8B;
    color:#b2d235;
}
</style>
<header>
 	<nav>
      <ul>
      	<li><a href="<%=path %>/qiantai/default.jsp">首页</a></li>       
        <li><a href="<%=path %>/qiantai/yisheng/yishengSea.jsp">医生查询</a></li>
        <li><a href="<%=path %>/gonggao?type=gonggaoAll">系统公告</a></li>
		
		<!-- <div class="dropdown">
	  				<button class="dropbtn">科室介绍</button>
		  				<div class="dropdown-content">
		    				<a href="#">菜鸟教程 1</a>
		    				<a href="#">菜鸟教程 2</a>
		    				<a href="#">菜鸟教程 3</a>
		 				</div>
		 </div> -->
			
      </ul>
	</nav>
</header>
<!--导航结束-->


</body>
</html>

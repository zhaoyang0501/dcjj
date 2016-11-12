<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的生活</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
	<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
	<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
	<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/??sm.min.css,sm-extend.min.css">
	<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/??sm.min.js,sm-extend.min.js' charset='utf-8'></script>
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
  </head>
  <body>
<script type="text/javascript">
function fun_goto(gotourl){
	 location.href = gotourl;
}
</script>
  <div class="page-group">
      <div class="page">
       <%@include file="./header.jsp" %>
       <div class="content">
        <div class="card facebook-card" style="margin: 0px;">
		    <div class="row">
		      <div class="col-50"><img src="/dcjj/img/userhead.png" height="150px"></div>
		      <div class="col-50" style="margin-top: 50px">您好：${sessionScope.user.username }</div>
		    </div>
		    
		    <div class="card-footer no-border">
		      <a href="#" class="link">坚持天数 ：10</a>|
		      <a href="#" class="link">累计单词书：12</a>
		    </div>
  </div>
       
		  <div class="list-block">
			    <ul>
			      
			      
			      
			       <li class="item-content item-link">
			        <div class="item-media"><i class="icon icon-f7"></i></div>
			        <div class="item-inner">
			          <div class="item-title">${sessionScope.user.username }</div>
			          <div class="item-after"><a href="#"> 修改</a></div>
			        </div>
			      </li>
			      <li class="item-content item-link">
			        <div class="item-media"><i class="icon icon-f7"></i></div>
			        <div class="item-inner">
			          <div class="item-title">${sessionScope.user.tel }</div>
			          <div class="item-after"><a href="#"> 修改</a></div>
			        </div>
			      </li>
			      
			       <li class="item-content item-link">
			        <div class="item-media"><i class="icon icon-f7"></i></div>
			        <div class="item-inner">
			          <div class="item-title">登录密码</div>
			          <div class="item-after"><a href="#"> 设置</a></div>
			        </div>
			      </li>
			    </ul>
			     <div class="content-block">
			      <p><a href="javascript:void(0)" onclick="fun_submit()" class="button button-fill button-danger">退出当前账户</a></p>
			    </div>
			  </div>
		</div>
      </div>
  </div>

   
  </body>
</html>

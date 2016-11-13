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

  <div class="page-group">
      <div class="page">
       <%@include file="./header.jsp" %>
        <div class="content">
    <div class="list-block">
    <form action="${pageContext.request.contextPath}/phone/doresetinfo" method="post">
      <ul>
        <!-- Text inputs -->
         <li>
          <div class="item-content">
            <div class="item-media"><i class="icon "></i></div>
            <div class="item-inner">
              <div class="item-title label">手机号码</div>
              <div class="item-input">
                <input name='tel' type="text" value="${sessionScope.user.tel}" placeholder="手机号码" readonly="readonly">
              </div>
            </div>
          </div>
        </li>
        
        
         <li>
          <div class="item-content">
            <div class="item-media"><i class="icon icon-form-name"></i></div>
            <div class="item-inner">
              <div class="item-title label">姓名</div>
              <div class="item-input">
                <input value="${sessionScope.user.username}" name='username' type="text" placeholder="您的姓名">
              </div>
            </div>
          </div>
        </li>
        
     
       
        <li class="align-top">
          <div class="item-content">
            <div class="item-media"><i class="icon icon-form-comment"></i></div>
            <div class="item-inner">
              <div class="item-title label">自我1介绍</div>
              <div class="item-input">
                <textarea name='address'>${sessionScope.user.address}</textarea>
              </div>
            </div>
          </div>
        </li>
      </ul>
       </form> 
    </div>
    <div class="content-block">
      <div class="row">
        <div class="col-100"><a href="javascript:void(0)" onclick="fun_submit()" class="button button-big button-fill button-success">提交</a></div>
      </div>
    </div>
  </div>
      </div>
  </div>

     <script>
     
     function fun_submit(){
    	
    	 $("form").submit();
     }
    
     $(function() {
    	 <c:if test="${tip!=null }">
	 	 $.toast("${tip}");
	  </c:if>
    	  $(".swiper-container").swiper({
    		  pagination: '.swiper-pagination',
    	        paginationClickable: true,
    	        direction: 'vertical'
    	    });
    	});
    </script>
  </body>
</html>

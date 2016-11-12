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
 <form action="${pageContext.request.contextPath}/phone/saveplan" method="post">
  <div class="page-group">
      <div class="page">
       <%@include file="./header.jsp" %>
        
      <div class="content native-scroll">
    <div class="content-block-title">每天背单词个数</div>
    <div class="content-block">
      <div class="list-block">
        <ul>
          <!-- Text inputs -->
          <li>
            <div class="item-content">
              <div class="item-inner">
                <div class="item-title label">个数</div>
                <div class="item-input">
                  <input type="text" placeholder="选择"  name='num' value="${sessionScope.user.num}" >
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <div class="content-block-title">计划完成天数</div>
    <div class="content-block">
      <div class="list-block">
        <ul>
         <li>
            <div class="item-content">
              <div class="item-inner">
                <div class="item-title label">天数</div>
                <div class="item-input">
                  <input type="text" placeholder="天数" name='day' value="${sessionScope.user.day}" >
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <div class="content-block-title"><h3>当前计划：<fmt:formatDate pattern="yyyy年MM月dd日" value="${sessionScope.user.endDate }"/> 月完成（共${sessionScope.user.day }天 ${sessionScope.user.day *sessionScope.user.num}个单词）</h3></div>
       <div class="content-block">
      <p><a href="javascript:void(0)" onclick="fun_submit()" class="button button-fill button-success">设置完成</a></p>
    </div>
  </div>
 
      </div>
  </div>
  </form>

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

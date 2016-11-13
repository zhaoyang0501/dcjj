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
   
     <div class="content-block-title">第${index+1 }题总共10题，请选择 <span style="color: blue;"> ${question.title }</span>单词的正确翻译</div>
  <div class="list-block">
    <ul>
      <li class="item-content item-link" onclick="fun_setanswer('a')">
        <div class="item-media"><i class="icon icon-f7"></i></div>
        <div class="item-inner">
          <div class="item-title">A:${question.a }</div>
        </div>
      </li>
      
       <li class="item-content item-link" onclick="fun_setanswer('b')">
        <div class="item-media"><i class="icon icon-f7"></i></div>
        <div class="item-inner">
          <div class="item-title">B:${question.b }</div>
        </div>
      </li>
      
      
       <li class="item-content item-link" onclick="fun_setanswer('c')">
        <div class="item-media"><i class="icon icon-f7"></i></div>
        <div class="item-inner">
          <div class="item-title">C:${question.c }</div>
        </div>
      </li>
      
       <li class="item-content item-link" onclick="fun_setanswer('d')">
        <div class="item-media"><i class="icon icon-f7"></i></div>
        <div class="item-inner">
          <div class="item-title">D:${question.d }</div>
        </div>
      </li>
    </ul>
    
  </div>
   <div class="content-block">
   <form method="post" action="${pageContext.request.contextPath}/phone/test/${index+1 }">
      <p><a href="javascript:void(0)" onclick="fun_submit()" class="button button-fill button-success">继续做题</a></p>
   <input type="hidden" name="q"/>
   </form>
    </div>
</div>
         </div>
      </div>
  </div>
     <script>
     
     function fun_setanswer(q){
    	 if(q=='${question.rightq}')
    		 $.toast("恭喜，回答正确!");
    	 else
    		 $.toast("回答错误，加油哦!");
    	 $("input[name='q']").val(q);
     }
     function fun_submit(){
    	 if( $("input[name='q']").val()==''){
    		 $.toast("还没有选择答案呢!");
    	 	return ;
    	 }
    		 
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

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
    <form action="doregister" method="post">
      <ul>
        <!-- Text inputs -->
        <li>
          <div class="item-content">
            <div class="item-media"><i class="icon icon-form-name"></i></div>
            <div class="item-inner">
              <div class="item-title label">姓名</div>
              <div class="item-input">
                <input name='username' type="text" placeholder="您的姓名">
              </div>
            </div>
          </div>
        </li>
        <li>
          <div class="item-content">
            <div class="item-media"><i class="icon icon-form-email"></i></div>
            <div class="item-inner">
              <div class="item-title label">E-mail</div>
              <div class="item-input">
                <input name='email' type="email" placeholder="电子邮箱">
              </div>
            </div>
          </div>
        </li>
         <li>
          <div class="item-content">
            <div class="item-media"><i class="icon "></i></div>
            <div class="item-inner">
              <div class="item-title label">手机号码</div>
              <div class="item-input">
                <input name='tel' type="text" placeholder="手机号码">
              </div>
            </div>
          </div>
        </li>
        <li>
          <div class="item-content">
            <div class="item-media"><i class="icon icon-form-password"></i></div>
            <div class="item-inner">
              <div class="item-title label">密码</div>
              <div class="item-input">
                <input name='password' type="password" placeholder="至少8位的密码" class="">
              </div>
            </div>
          </div>
        </li>
        <li>
          <div class="item-content">
            <div class="item-media"><i class="icon icon-form-gender"></i></div>
            <div class="item-inner">
              <div class="item-title label">性别</div>
              <div class="item-input">
                <select name='grade'>
                  <option>男</option>
                  <option>女</option>
                </select>
              </div>
            </div>
          </div>
        </li>
        <!-- Date -->
        <li>
          <div class="item-content">
            <div class="item-media"><i class="icon icon-form-calendar"></i></div>
            <div class="item-inner">
              <div class="item-title label">出生日期</div>
              <div class="item-input">
                <input name='birthDate' type="date" placeholder="出生日期" value="2014-04-30">
              </div>
            </div>
          </div>
        </li>
       
        <li class="align-top">
          <div class="item-content">
            <div class="item-media"><i class="icon icon-form-comment"></i></div>
            <div class="item-inner">
              <div class="item-title label">自我介绍</div>
              <div class="item-input">
                <textarea name='address'></textarea>
              </div>
            </div>
          </div>
        </li>
      </ul>
        </form>
    </div>
    <div class="content-block">
      <div class="row">
       
        <div class="col-50"><a href="#" class="button button-big button-fill button-danger">取消</a></div>
        <div class="col-50"><a href="javascript:void(0)" onclick="fun_submit()" class="button button-big button-fill button-success">提交</a></div>
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
    	  $(".swiper-container").swiper({
    		  pagination: '.swiper-pagination',
    	        paginationClickable: true,
    	        direction: 'vertical'
    	    });
    	});
    </script>
  </body>
</html>

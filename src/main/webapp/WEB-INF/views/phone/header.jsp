<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <header class="bar bar-nav">
              <a class="button button-link button-nav pull-left" href="javascript:void(0)"  onclick="history.back()">
                  <span class="icon icon-left"></span>
               	   返回
              </a>
              <h1 class="title">英语单词记忆平台</h1>
          </header>
          <nav class="bar bar-tab">
              <a class="tab-item external " href="${pageContext.request.contextPath}/phone/plan">
                  <span class="icon icon-edit"></span>
                  <span class="tab-label">我的计划</span>
              </a>
               <a class="tab-item external" href="${pageContext.request.contextPath}/phone/remember">
                  <span class="icon icon-cart"></span>
                  <span class="tab-label">单词记忆</span>
              </a>
              <a class="tab-item external" href="${pageContext.request.contextPath}/phone/review/0">
                  <span class="icon icon-clock"></span>
                  <span class="tab-label">单词复习</span>
              </a>
              <a class="tab-item external" href="${pageContext.request.contextPath}/phone/translate">
                  <span class="icon icon-search"></span>
                  <span class="tab-label">单词查询</span>
              </a>
              <a class="tab-item external" href="${pageContext.request.contextPath}/phone/center">
                  <span class="icon icon-me"></span>
                  <span class="tab-label">个人中心</span>
              </a>
          </nav>
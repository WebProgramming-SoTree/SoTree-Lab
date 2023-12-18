<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>FAQ 1</title>
    <link rel="stylesheet" href="../Nav/Nav.css" />
    <link rel="stylesheet" href="../Footer/Footer.css" />
<style>
/* FAQ */
.faq{border-bottom:0px solid #ddd;margin:1em 0;}
.faq .faqHeader{position:relative;zoom:1}
.faq .faqHeader .showAll{position:absolute;bottom:0;right:0;border:0;padding:0;overflow:visible;background:none;cursor:pointer}
.faq .faqBody{margin:0;padding:0}
.faq .faqBody .article{list-style:none}
.faq .q{margin:20px}
.faq .q a{display:block;text-align:left; 
    background:url("faq1_icon_q.png") no-repeat 0 0;
    padding:0 0 0 35px;
    font-size:18px;
    color:#5e5e5e;
    font-weight:bold;
    line-height: 27px;
    cursor:pointer;
    margin: 10px 0; !important}
    .faq .q a:hover {
      color: orange; /* 주황색으로 변경 */
  };
.faq .q a:active, .faq .q a:focus{}
.faq .a{background:#f8f8f8 url("faq1_icon_a.png") no-repeat 40px 10px;padding: 10px 75px 10px 75px;
    font-size: 16px;
    color: #444444;
    line-height: 22px;
    border-top: 1px solid #bdbdbd;
    margin:5px 0 0 0;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>

</head>

<body>
<header>
	<%@include file="../Nav/Nav.jsp" %>
</header>
<div class="faq" style="margin-top:150px;">
    <div class="faqHeader">
        <!--button type="button" class="showAll">답변 모두 여닫기</button-->
    </div>
    <ul class="faqBody">
        <li class="article" id="a1">
            <p class="q"><a href="#a1">1. 소나무는 어떤 사람들이 들어가는 건가요?</a></p>
            <p class="a">소나무는 AI융합대학 학생이라면 누구든지 참여 가능합니다! </p>
        <hr>
          </li>
        <li class="article" id="a2">
            <p class="q"><a href="#a2">2. 소나무 회비는 얼마인가요?</a></p>
            <p class="a">한 학기에 10,000원 입니다~!</p>
            <hr>
        </li>
        <li class="article" id="a3">
            <p class="q"><a href="#a3">3. 소나무에는 몇명이 있나요? </a></p>
            <p class="a">2023년 기준 127명이 있습니다!</p>
            <hr>
          </li>
          <li class="article" id="a3">
            <p class="q"><a href="#a3">4.동방은 아무나 가도 되나요? </a></p>
            <p class="a">소나무 회원이라면 언제든 올 수 있습니다! 원흥관 1층에 있으니 편하게 와주세요😊</p>
            <hr>
          </li>
          <li class="article" id="a3">
            <p class="q"><a href="#a3">5. 소나무에 참여하고 싶어요! </a></p>
            <p class="a">상시 모집이니 언제든 연락주세요~!</p>
            <hr>
          </li>
    </ul>
</div>

<script>
jQuery(function($){
    // Frequently Asked Question
    var article = $('.faq>.faqBody>.article');
    article.addClass('hide');
    article.find('.a').hide();
    article.eq(0).removeClass('hide');
    article.eq(0).find('.a').show();
    $('.faq>.faqBody>.article>.q>a').click(function(){
        var myArticle = $(this).parents('.article:first');
        if(myArticle.hasClass('hide')){
            article.addClass('hide').removeClass('show');
            article.find('.a').slideUp(100);
            myArticle.removeClass('hide').addClass('show');
            myArticle.find('.a').slideDown(100);
        } else {
            myArticle.removeClass('show').addClass('hide');
            myArticle.find('.a').slideUp(100);
        }
        return false;
    });
    $('.faq>.faqHeader>.showAll').click(function(){
        var hidden = $('.faq>.faqBody>.article.hide').length;
        if(hidden > 0){
            article.removeClass('hide').addClass('show');
            article.find('.a').slideDown(100);
        } else {
            article.removeClass('show').addClass('hide');
            article.find('.a').slideUp(100);
        }
    });
});
</script>
    <footer>
        <%@include file="../Footer/Footer.jsp" %>
    </footer>
</body>
</html>
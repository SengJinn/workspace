<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="vo.MungMemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
    MungMemberVO member = (MungMemberVO) session.getAttribute("member");
%>


<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
	
	a{
		text-decoration-line:none;
	}
	
	a:active{
		color:#FF8000;
	}
	
	li {
		list-style:none;
		padding-left: 0;
	}	
	
	.header{
		height: 50px;
		background-color:rgb(255,246,189); 
		border-bottom: 1px lightgray solid;
		font-family: "Noto Sans KR", sans-serif;
	}
	
	/* navigation */

        .outer-menu-item{
        	text-align: left;
            float: left;
            position: relative;
            width: 150px;
            display: inline-blcok;
        }
        
        .outer-menu-item2{
            float: right;
            position: relative;
            display: inline-blcok;
        }
        
		
        .inner-menu{
            /* inner-menu 화면에 출력 안되도록 */
            display: none;
            position: absolute;
            background-color: white;
            text-align: center;
            width: 100%;
            text-align:left;
            border:1px solid gray;
            border-radius:20px
        }
       
		.inner-menu-item1 {
			margin-top: 15px;
		}
		
		.inner-menu-item2 {
			margin-bottom: 20px;
		}
		
		.inner-menu-item3 {
			margin-bottom: 20px;
		}
		
		.inner-menu-item4 {
			margin-bottom: 20px;
		}
		
		
        .outer-menu-item:hover .inner-menu{
            display: block;
            border:0px;
            
        }
	
	 /* 메뉴 타이틀 */
        .menu-title{
            /* 수평정렬 */
            line-height: 40px;
            
        }
        
        .menu-title2{
            /* 크기를 가질 수 있도록 display변경 */
            display: block;
            height: 40px;
            padding: 5px 30px 0px 30px;
            /* 수평정렬 */
            line-height: 30px;
        }
        
	 	#page-wrapper {
			text-align:center;
			background-color:rgb(255,246,189); 
			color:gray;

	
</style>

<header class="header">
	<div id="page-wrapper">
  
            <nav id="main-navigation2">
          	<div class="pull-right">
          		<ul class="outer-menu2">
          			<li class="outer-menu-item2">
						<span class="menu-title2"><a href="main.jsp">HOME</a></span>
                    <% if (member == null) { %>
                    <li class="outer-menu-item2">
                        <span class="menu-title2"><a href="login.jsp">LOGIN</a></span>
                    </li>
                    <li class="outer-menu-item2">
                        <span class="menu-title2"><a href="join.jsp">JOIN</a></span>
                    </li>
                    <% } else { %>
                    <li class="outer-menu-item2">
                        <span class="menu-title2"><%= member.getName() %>님, 반갑습니다.</span>
                    </li>
                    <li class="outer-menu-item2">
                        <span class="menu-title2"><a href="logOut.jsp">LOGOUT</a></span>
                    </li>
                    <li class="outer-menu-item2">
                        <span class="menu-title2"><a href="myInfo.jsp">MY INFO</a></span>
                    </li>
                    <% } %>
                  
	
				</ul>
          	</div>
          </nav>
        <nav id="main-navigation">
            <div class="pull-left">
                <ul class="outer-menu">
                    <li class="outer-menu-item">
                        <span class="menu-title"><a href="mungPlaceIndex.jsp">멍플레이스</a></span>
                    </li>
                    <li class="outer-menu-item">
                        <span class="menu-title"><a href="free.jsp">멍뮤니티</a></span>
                    </li>
                    <li class="outer-menu-item">
                        <span class="menu-title">멍터테인먼트</span>
                        	<ul class="inner-menu">
                           		<li class="inner-menu-item1"><a href="WorldCup.jsp">멍상형 월드컵</a></li><br/>
                           		<li class="inner-menu-item2"><a href="mungQuiz.jsp">멍멍 퀴즈존</a></li>
                           		<li class="inner-menu-item3"><a href="mungrockGame.jsp">뼈다귀 게임</a></li>
                           		<li class="inner-menu-item4"><a href="brick/start.html">멍돌깨기 게임</a></li>
                            </ul>
                    </li>
                </ul>
            </div>
          </nav>

	</div>
</header>
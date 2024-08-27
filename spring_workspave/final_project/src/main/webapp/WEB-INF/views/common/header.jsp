<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- iconbox 설정 -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

  <header class="header">
	<div id="page-wrapper">
  
            <nav id="main-navigation2">
          	<div class="pull-right">
          		<ul class="outer-menu2">
          			<li class="outer-menu-item2">
						<span class="menu-title2"><a href="#">HOME</a></span>
                    <% if (member == null) { %>
                    <li class="outer-menu-item2">
                        <span class="menu-title2"><a href="#">LOGIN</a></span>
                        <i class='bx bx-search'></i> <!-- search 아이콘 -->
                    </li>
                    <li class="outer-menu-item2">
                        <span class="menu-title2"><a href="#">JOIN</a></span>
                    </li>
                    <% } else { %>
                    <li class="outer-menu-item2">
                        <span class="menu-title2"><%= member.getName() %>님, 반갑습니다.</span>
                    </li>
                    <li class="outer-menu-item2">
                        <span class="menu-title2"><a href="#">LOGOUT</a></span>
                    </li>
                    <li class="outer-menu-item2">
                        <span class="menu-title2"><a href="#">MY INFO</a></span>
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
                           		<li class="inner-menu-item4"><a href="brick/start.html" target="_blank">멍돌깨기 게임</a></li>
                            </ul>
                    </li>
                </ul>
            </div>
          </nav>

	</div>
</header>
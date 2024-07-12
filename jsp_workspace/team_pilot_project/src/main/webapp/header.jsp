<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<style>

	hgroup{
		text-align:center;
	}
	
	h1{
		text-decoration-line:none;
		color:white;
	}
	
	a{
		text-decoration-line:none;
	}
	
	li {
		list-style:none;
		padding-left: 0;
	}
	
	/* navigation */
        nav#main-navigation{
            height: 40px;
        }
        
        nav#main-navigation2{
            height: 40px;
        }


        .outer-menu-item{
            float: left;
            position: relative;
        }
        
        .outer-menu-item2{
            float: right;
            position: relative;
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
            border-radius:40px
        }

        .outer-menu-item:hover .inner-menu{
            display: block;
            border:0px;
            
        }
	
	 /* 메뉴 타이틀 */
        .menu-title{
            /* 크기를 가질 수 있도록 display변경 */
            display: block;
            height: 30px;
            padding: 5px 20px;
            /* 수평정렬 */
            line-height: 30px;
            text-align: center;
        }
        
        .menu-title2{
            /* 크기를 가질 수 있도록 display변경 */
            display: block;
            height: 30px;
            padding: 5px 20px;
            /* 수평정렬 */
            line-height: 30px;
            text-align: center;
        }
        
	 	#page-wrapper {
			text-align:center;
			background-color:rgb(255,246,189); 
			color:gray;

	
</style>

<header>
	<div id="page-wrapper">
            <hgroup>
                <a href="main.jsp"><h1 class="master-title">개편한부산</h1></a>
                <h5 class="master-description">부산의 모든 개가 편해지는 그날까지! 개와 부산 시민들이 함께합니다.</h5>
            </hgroup>
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
                           		<li class="inner-menu-item"><a href="WorldCup/WorldCup.jsp">개상형 월드컵</a></li><br/>
                           		 <li class="inner-menu-item"><a href="MBTI.jsp">멍BTI</a></li>
                            </ul>
                    </li>
                </ul>
            </div>
          </nav>
          <nav id="main-navigation2">
          	<div class="pull-right">
          		<ul class="outer-menu2">
					<li class="outer-menu-item2">
						<span class="menu-title2"><a href="login.jsp">LOGIN</a></span>
					</li>
					<li class="outer-menu-item2">
						<span class="menu-title2"><a href="join.jsp">JOIN</a></span>
					</li>
				</ul>
          	</div>
          </nav>
	</div>
	
<hr />
</header>


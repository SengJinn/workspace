<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!--  contentType에 charset=UTF-8 이 지정되어있으면  
		pageEncoding="UTF-8" 은 필요없다.-->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<style>
	.title{
   	 padding: 0 140px ;
	}

	.mtitle{
	   text-align: right;
 	   padding: 10px 0;
	}

	.ftitle{
   	  padding: 10px 0;
	}

	.box{
  	  margin: 0 -15px;
	}

</style>
</head>
<body>
  <form action="">
    <table border="1">
        <tr>
            <th colspan="2" style="background-color:rgb(255,246,189)">
                <h1 class="title">회원가입</h1>
            </th>
        </tr>
        <tr>
            <td class="mtitle">아이디</td>
            <th>
                <input type="text" class="box" required/>
            </th>
        </tr>
        <tr>
            <td class="mtitle">비밀번호</td>
            <th>
                <input type="password" class="box" required/>
            </th>
        </tr>
        <tr>
            <td class="mtitle">비밀번호확인</td>
            <th>
                <input type="password" class="box" required/>
            </th>
        </tr>
        <tr>
            <td class="mtitle">이름</td>
            <th>
                <input type="text" class="box" required/>
            </th>
        </tr>
        <tr>
            <td class="mtitle">이메일</td>
            <th>
                <input type="email" class="box" required/>
            </th>
        </tr>
        <tr>
            <th colspan="2" class="ftitle">
            	<button>회원가입</button>
            </th>
        </tr>
    </table>
  </form>
</body>
</html>
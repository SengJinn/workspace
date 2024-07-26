<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 수정</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

    * {
        font-family: 'Noto Sans KR', sans-serif;
        box-sizing: border-box;
    }

/*     body {
        background-color: rgb(255, 246, 189);
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .wrap {
        width: 300px;
        background-color: white;
        border-radius: 5px;
        text-align: center;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .title {
        font-family: 'Jua', sans-serif;
        font-size: 24px;
        color: #3A2400;
        margin-bottom: 20px;
    }

    input[type='password'],
    button {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid lightgray;
        margin-bottom: 10px;
        font-size: 14px;
    }

    button {
        background-color: rgb(245, 212, 46);
        color: white;
        cursor: pointer;
        border: none;
        transition: background-color 0.3s ease;
        font-size: 16px;
    }

    button:hover {
        background-color: #ffdc72;
    }

    button:active {
        background-color: #ffcc00;
        transform: scale(0.95);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    } */
</style>
</head>
<body>
    <div class="wrap">
        <h1 class="title">비밀번호 수정</h1>
        <form id="updateForm" action="updateInfo.jsp" method="post">
            <label for="pass">수정할 비밀번호를 입력해 주세요</label>
            <input type="password" id="pass" class="box" name="pass" required>

            <button type="submit">수정완료</button>
        </form>
    </div>

    <script>
        document.getElementById('updateForm').onsubmit = function(event) {
            event.preventDefault();
            alert('수정이 완료되었습니다!');
            window.location.href = 'main.jsp';
        };
    </script>
</body>
</html>
<%@ include file="footer.jsp" %>
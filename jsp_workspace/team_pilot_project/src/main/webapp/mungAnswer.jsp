<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>퀴즈 결과</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>퀴즈 결과</h1>
    </header>
    <main>
        <%
            String answer1 = request.getParameter("question1");
            String answer2 = request.getParameter("question2");
            String answer3 = request.getParameter("question3");

            int score = 0;

            if ("서울".equals(answer1)) {
                score++;
            }
            if ("24시간".equals(answer2)) {
                score++;
            }
            if ("목성".equals(answer3)) {
                score++;
            }
        %>
        <h2>당신의 점수는: <%= score %> / 3</h2>
        <%
            if (score == 3) {
        %>
            <p>축하합니다! 모든 질문에 정답을 맞추셨습니다.</p>
        <%
            } else {
        %>
            <p>아쉽지만, 더 공부하셔야겠네요.</p>
        <%
            }
        %>
        <a href="mungQuiz.jsp">다시 도전하기</a>
    </main>

</body>
</html>
<%@ include file="footer.jsp" %>
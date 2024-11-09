package com.test1.test2.Servlet;

import com.test1.test2.Bean.QuestionBean;
import com.test1.test2.Bean.ScoreBean;
import com.test1.test2.Dao.QuestionDAO;
import com.test1.test2.Dao.ScoreDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ScoreServlet")
public class ScoreServlet extends HttpServlet {
    private ScoreDAO scoreDAO = new ScoreDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lesson = request.getParameter("Lesson");
        String no = request.getParameter("No");
        String name = request.getParameter("Name");
        int totalScore = 0;

        try {
            // 获取当前学生的成绩
            ScoreBean scoreBean = scoreDAO.getScoreByStudent(no, name);

            // 计算该次考试的得分
            List<QuestionBean> questions = new QuestionDAO().getQuestionsByLesson(lesson);
            for (QuestionBean question : questions) {
                String tihao = question.getTh();
                String correctAnswer = question.getJd();
                String selectedAnswer = request.getParameter("No" + tihao);

                if (selectedAnswer != null && selectedAnswer.equals(correctAnswer)) {
                    totalScore += Integer.parseInt(question.getFs());
                }
            }

            // 更新指定科目的成绩
            scoreDAO.updateScore(lesson, totalScore, no, name);

            // 更新scoreBean中的分数
            if (lesson.equals("JSP")) {
                scoreBean.setJspScore(totalScore);
            } else if (lesson.equals("XML")) {
                scoreBean.setXmlScore(totalScore);
            } else if (lesson.equals("ASP")) {
                scoreBean.setAspScore(totalScore);
            }

            // 将成绩信息传递给JSP页面
            request.setAttribute("scoreBean", scoreBean);
            request.getRequestDispatcher("score.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}

package com.test1.test2.Servlet;

import com.test1.test2.Bean.QuestionBean;
import com.test1.test2.Dao.QuestionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/QuestionServlet")
public class QuestionServlet extends HttpServlet {
    private QuestionDAO questionDAO = new QuestionDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lesson = request.getParameter("Lesson");

        try {
            List<QuestionBean> questions = questionDAO.getQuestionsByLesson(lesson);
            request.setAttribute("questions", questions);
            request.setAttribute("Lesson", lesson);
            request.setAttribute("No", request.getParameter("No"));
            request.setAttribute("Name", request.getParameter("Name"));
            request.getRequestDispatcher("test.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}

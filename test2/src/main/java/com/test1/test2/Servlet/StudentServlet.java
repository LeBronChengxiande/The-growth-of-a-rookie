package com.test1.test2.Servlet;

import com.test1.test2.Bean.StudentBean;
import com.test1.test2.Dao.StudentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {

    private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            listStudents(request, response);
        } catch (SQLException e) {
            throw new ServletException("数据库查询出错: " + e.getMessage(), e);
        }
    }

    private void listStudents(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<StudentBean> students = studentDAO.getAllStudents();
        request.setAttribute("students", students);
        request.getRequestDispatcher("/ryxinxi/ryxinxi.jsp").forward(request, response);
    }
}

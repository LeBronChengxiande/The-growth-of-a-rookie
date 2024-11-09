package com.test1.test2.Servlet;

import com.test1.test2.Bean.AdminBean;
import com.test1.test2.Dao.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // 定义提示信息变量
        String msg1 = null;
        String msg2 = null;

        // 检查用户名和密码是否为空
        if (username == null || username.trim().isEmpty()) {
            msg1 = "用户名不能为空";
        }
        if (password == null || password.trim().isEmpty()) {
            msg2 = "密码不能为空";
        }

        // 如果有错误信息，将它们设置为请求属性并转发回登录页面
        if (msg1 != null || msg2 != null) {
            req.setAttribute("msg1", msg1);
            req.setAttribute("msg2", msg2);
            req.getRequestDispatcher("AdminLogin.jsp").forward(req, resp);
        } else {
            // 如果没有错误，验证用户身份
            AdminDAO adminDAO = new AdminDAO();
            boolean isValidUser = adminDAO.validateAdmin(username, password);

            if (isValidUser) {
                // 如果验证通过，重定向到管理员信息页面
                resp.sendRedirect("/CURD_StuServlet");
            } else {
                // 如果验证失败，设置错误信息并返回登录页面
                resp.sendRedirect("/error.html");

            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
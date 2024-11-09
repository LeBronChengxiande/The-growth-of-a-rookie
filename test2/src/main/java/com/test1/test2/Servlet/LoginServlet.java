package com.test1.test2.Servlet;

import com.test1.test2.Bean.StudentBean;
import com.test1.test2.Dao.StudentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/LoginServlet")// 定义 Servlet 的 URL 映射
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取请求参数
        String name = req.getParameter("Name");
        String no = req.getParameter("No");
        String lesson = req.getParameter("Lesson");

        //创建StudentBean实例和StudentDAO实例
        StudentBean studentBean = new StudentBean(name, no, lesson);
        studentBean.setNo(no);
        studentBean.setName(name);
        studentBean.setLesson(lesson);
        StudentDAO studentDAO = new StudentDAO();

        // 验证学生信息
        String msg = studentDAO.validateStudent(studentBean);
        if(msg==null){// 如果验证通过
            // 构造跳转到 test.jsp 的 URL，传递必要的参数
            String url = "QuestionServlet?Lesson=" + lesson + "&Name=" + URLEncoder.encode(name, "UTF-8") + "&No=" + no;
            resp.sendRedirect(url);
        }else{// 验证失败
            req.setAttribute("msg", msg);// 设置错误信息到请求对象
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            // 转发回 login.jsp 显示错误信息
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

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

    @WebServlet("/CURD_StuServlet")
    public class CURD_StuServlet extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            doGet(req, resp);
        }
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            StudentDAO studentDAO = new StudentDAO();
            String action = request.getParameter("action");
            String name = request.getParameter("Name");
            String no = request.getParameter("No");
            if (action != null && name != null && no != null && !name.isEmpty() && !no.isEmpty()) {
                StudentBean student = new StudentBean();
                student.setName(name);
                student.setNo(no);

                try {
                    switch (action) {
                        case "add":
                            studentDAO.AddStudent(student);
                            break;
                        case "delete":
                            studentDAO.DelStudent(student);
                            break;
                        case "update":
                            studentDAO.UpStudent(student);
                            break;
                        default:
                            request.setAttribute("error", "无效的操作！");
                            request.getRequestDispatcher("/error.html").forward(request, response);
                            return;
                    }
                    List<StudentBean> students = studentDAO.getAllStudents();
                    request.setAttribute("students", students);
                    //request.getRequestDispatcher("/ryxinxi/ryxinxi.jsp").forward(request, response); // 修改为重定向
                    response.sendRedirect("StudentServlet"); // 这样不会再带有action参数,而是直接交给StudentServlet处理

                } catch (SQLException e) {
                    throw new ServletException("数据库错误: 无法执行操作", e);
                }
            } else {
                // 如果缺少参数，则返回到输入页面
                List<StudentBean> students;
                try {
                    students = studentDAO.getAllStudents();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("students", students);
                request.getRequestDispatcher("/ryxinxi/ryxinxi.jsp").forward(request, response);// 重定向到展示页面
            }
        }
    }

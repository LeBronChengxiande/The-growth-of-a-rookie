package com.test1.test2.Dao;

import com.test1.test2.Bean.StudentBean;
import com.test1.test2.Util.DBUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    private Connection conn;
    private Statement stmt;
    private PreparedStatement ps;
    private ResultSet rs;

    // 验证学生信息，返回错误信息或 null（如果合法）
    public String validateStudent(StudentBean student) {
        String msg = null;
    // SQL 查询语句，匹配学生的学号和姓名
        String sql = "SELECT * FROM chjb WHERE xh='" + student.getNo() + "' AND xm='" + student.getName() + "'";

        try {
            // 获取数据库连接
            try {
                conn = DBUtil.getConnection();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            // 创建 SQL 语句执行对象
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);// 执行查询
            // 检查查询结果
            if (!rs.next()) {// 如果没有记录
                msg = "您不是合法考生！";
            } else if (rs.getInt(student.getLesson()) != -1) { // 已经考过该科目
                msg = "您已经考过本科目了！";
            }
        } catch (SQLException e) {
            msg = "数据库连接错误: " + e.getMessage();
        } finally {// 释放资源
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                DBUtil.close(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return msg;
    }
    public List<StudentBean> getAllStudents() throws SQLException {
        List<StudentBean> students = new ArrayList<>();
        String SQL = "SELECT * FROM chjb";
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(SQL)) {
            while (rs.next()) {
                StudentBean student = new StudentBean();
                student.setNo(rs.getString("xh"));  // 假设字段名是 xh
                student.setName(rs.getString("xm"));  // 假设字段名是 xm
                students.add(student);
            }
        }
        return students;
    }

    public void CRUD(StudentBean student, String SQL) throws SQLException {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(SQL)) {

            if (SQL.startsWith("INSERT")) {
                ps.setString(1, student.getName());
                ps.setString(2, student.getNo());
            } else if (SQL.startsWith("DELETE")) {
                ps.setString(1, student.getNo());
            } else if (SQL.startsWith("UPDATE")) {
                ps.setString(1, student.getName());
                ps.setString(2, student.getNo());
            }
            ps.executeUpdate();
        }
    }

    // 添加学生
    public void AddStudent(StudentBean student) throws SQLException {
        String SQL = "INSERT INTO chjb (xm, xh,jsp,asp,xml) VALUES (?, ?,-1,-1,-1)";
        CRUD(student, SQL);
    }

    // 删除学生
    public void DelStudent(StudentBean student) throws SQLException {
        String SQL = "DELETE FROM chjb WHERE xh = ?";
        CRUD(student, SQL);
    }

    // 更新学生
    public void UpStudent(StudentBean student) throws SQLException {
        String SQL = "UPDATE chjb SET xm = ? WHERE xh = ?";
        CRUD(student, SQL);
    }
}
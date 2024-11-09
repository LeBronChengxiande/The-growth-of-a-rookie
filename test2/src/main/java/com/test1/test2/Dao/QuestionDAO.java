package com.test1.test2.Dao;

import com.test1.test2.Bean.QuestionBean;
import com.test1.test2.Util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {
    public List<QuestionBean> getQuestionsByLesson(String lesson) throws SQLException {
        List<QuestionBean> questions = new ArrayList<>();
        String sql = "SELECT * FROM " + lesson + " ORDER BY th";

        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                QuestionBean question = new QuestionBean();
                question.setLx(rs.getString("lx"));
                question.setTh(rs.getString("th"));
                question.setTm(rs.getString("tm"));
                question.setFs(rs.getString("fs"));
                question.setJd(rs.getString("jd"));
                question.setXx1(rs.getString("xx1"));
                question.setXx2(rs.getString("xx2"));
                question.setXx3(rs.getString("xx3"));
                question.setXx4(rs.getString("xx4"));
                questions.add(question);
            }
        }
        return questions;
    }
}

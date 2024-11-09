package com.test1.test2.Dao;

import com.test1.test2.Bean.ScoreBean;
import com.test1.test2.Util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ScoreDAO {
    public ScoreBean getScoreByStudent(String no, String name) throws SQLException {
        String sql = "SELECT * FROM chjb WHERE xh = ? AND xm = ?";
        ScoreBean scoreBean = new ScoreBean();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, no);
            ps.setString(2, name);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                scoreBean.setNo(no);
                scoreBean.setName(name);
                scoreBean.setJspScore(rs.getInt("JSP"));
                scoreBean.setXmlScore(rs.getInt("XML"));
                scoreBean.setAspScore(rs.getInt("ASP"));
            }
        }
        return scoreBean;
    }

    public void updateScore(String lesson, int score, String no, String name) throws SQLException {
        String sql = "UPDATE chjb SET " + lesson + " = ? WHERE xh = ? AND xm = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, score);
            ps.setString(2, no);
            ps.setString(3, name);
            ps.executeUpdate();
        }
    }
}

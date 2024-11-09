package com.test1.test2.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.test1.test2.Util.DBUtil;

public class AdminDAO {
    public boolean validateAdmin(String username, String password) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean isValid = false;

        String sql = "SELECT * FROM admin WHERE user = ? AND password = ?";

        try {
            conn = DBUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {
                isValid = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                DBUtil.close(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isValid;
    }
}


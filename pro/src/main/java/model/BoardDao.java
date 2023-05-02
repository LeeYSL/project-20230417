package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class BoardDao {
	public boolean insert(Board board) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into board(boardNum, boardContent, boardFile, boardTitle"
				+ " boardTime, boardReadCnt, boardId, boardGrp, boardGrpLevel, boardGrpStep,"
				+ " memId)" + " values (?,?,?,?,now(),0,?,?,?,?,?)"; 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getBoardNum());
			pstmt.setString(2, board.getBoardContent());
			pstmt.setString(3, board.getBoardFile());
			pstmt.setString(4, board.getBoardTitle());
			pstmt.setString(5, board.getBoardId());
			pstmt.setInt(6, board.getBoardGrp());
			pstmt.setInt(7, board.getBoardGrpLevel());
			pstmt.setInt(8, board.getBoardGrpStep());
			pstmt.setString(9, board.getMemId());
			return pstmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn,pstmt,null);
		}
		return false;
	}
	public int maxnum() {
		Connection conn = DBConnection.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select ifnull(max(num),0) from board");
			if (rs.next()) {
				return rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, stmt, rs);
		}
		return 0;
	}
}

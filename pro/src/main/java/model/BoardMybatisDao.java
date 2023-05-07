package model;

import java.awt.image.DataBuffer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import graphql.relay.Connection;
import model.mapper.BoardMapper;

public class BoardMybatisDao {
	private Class<BoardMapper> cls = BoardMapper.class;
	private Map<String, Object> map = new HashMap<>();

	public int maxnum() {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return 0;
	}

	public boolean insert(Board board) {
		SqlSession session = MybatisConnection.getConnection();
		try {

			return session.getMapper(cls).insert(board) > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}

	public int boardCount(String boardId) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			map.clear();
			map.put("boardId", boardId);

			return session.getMapper(cls).boardCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return 0;
	}

	public List<Board> list(String boardId, int pageNum, int limit) {
		SqlSession session = MybatisConnection.getConnection();

		try {
			map.clear();
			map.put("boardId", boardId);
			map.put("sLimit", (pageNum - 1) * limit);
			map.put("eLimit", limit);
			
			return session.getMapper(cls).list(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;

	}

	public Board selectOne(int boardNum) {
		SqlSession session = MybatisConnection.getConnection();
		
		try {
			return session.getMapper(cls).selectOne(boardNum);
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		
		return null;
	}
}

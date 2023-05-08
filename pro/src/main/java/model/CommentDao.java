package model;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.CommentMapper;

public class CommentDao {
	public Class<CommentMapper> cls = CommentMapper.class;
	private Map<String, Object> map = new HashMap<>();

	public boolean insert(Comment comm) {
		SqlSession session = MybatisConnection.getConnection();
		try {

			return session.getMapper(cls).insert(comm) > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}

	public int maxseq(int num) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxseq(num);
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			MybatisConnection.close(session);

		}
		return 0;
	}
	public boolean delete(int num,int seq) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).delete(num,seq);
			return cnt > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}
		
	}


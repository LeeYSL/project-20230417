package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.CommentMapper;

public class CommentMybatisDao {
	public Class<CommentMapper> cls = CommentMapper.class;
	private Map<String, Object> map = new HashMap<>();

	public boolean insert(Comment comm) {
		SqlSession session = MybatisConnection.getConnection();
		System.out.println("comm :" + comm);
		try {
			session.getMapper(cls).insert(comm);
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		System.out.println("comm :" + comm);
		return false;
		
	}

	public int maxseq(int boardNum) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxseq(boardNum);
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			MybatisConnection.close(session);

		}
		return 0;
	}
	public boolean delete(int boardNum,int commentNum) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).delete(boardNum,commentNum);
			return cnt > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}
	
		public List<Comment> list(int commentNum) {
			SqlSession session = MybatisConnection.getConnection();
			
			try {
				map.clear();
				map.put("commentNum", commentNum);
				
	
				return session.getMapper(cls).list(commentNum);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(session);
			}
			return null;

		}
		public Comment selectOne(int boardNum, int commentNum) {
			SqlSession session = MybatisConnection.getConnection();
		
			try {
				return session.getMapper(cls).selectOne(boardNum,commentNum);
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(session);
			}
			return null;
			
		}
		public boolean update(Comment comm) {
			SqlSession session = MybatisConnection.getConnection();
			try {
				return session.getMapper(cls).update(comm) > 0;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(session);
			}
			return false;
		}	
		
}
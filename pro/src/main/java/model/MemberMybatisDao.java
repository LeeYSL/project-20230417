package model;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.MemberMapper;

public class MemberMybatisDao {
	private Class<MemberMapper> cls = MemberMapper.class;
	private Map<String, Object> map = new HashMap<>();

	public boolean insert(Member mem) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).insert(mem);
			if (cnt > 0)
				return true;
			else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}
	public Member selectLogin(String memId,String memPw) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectLogin(memId,memPw);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MybatisConnection.close(session);
		}
		return null;
	}
	public Member selectOne(String memId) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectOne(memId);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MybatisConnection.close(session);
		}
		return null;
	}
	public boolean update(Member mem) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).update(mem);
			return cnt > 0;		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MybatisConnection.close(session);
		}
		return false;
	}
	public String idSearch(String memEmail, String memName) {
		System.out.println("memEmail : " + memEmail);
		System.out.println("memName : " + memName);
		SqlSession session = MybatisConnection.getConnection();
		try {
			System.out.println("id : " + session.getMapper(cls).idSearch(memEmail,memName));
			return session.getMapper(cls).idSearch(memEmail,memName);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MybatisConnection.close(session);
		}
		return null;
	}
	public boolean delete(String id) {
		SqlSession session = MybatisConnection.getConnection();
		
		try {
			int cnt = session.getMapper(cls).delete(id);
			return cnt > 0; // 한레코드는 삭제가 됐다?
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}
	public String pwSearch(String memId, String memEmail,String memName) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).pwSearch(memId,memEmail,memName);	
		} catch (Exception e) {
	 		e.printStackTrace();
	 	} finally {
	 		MybatisConnection.close(session);
	 	}
	 	return null;
	}
	
}

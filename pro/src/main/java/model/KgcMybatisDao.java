package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.mapper.KgcMapper;

public class KgcMybatisDao {
	private Class<KgcMapper> cls = KgcMapper.class;

	public List<Record> yearList() {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).yearList(); // 매개변수 없고 전체 목록 다 조회해
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}
	
	public List<Record> list(String leagueYear) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).list(leagueYear); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}
}

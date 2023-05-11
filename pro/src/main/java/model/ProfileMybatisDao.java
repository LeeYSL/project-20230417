package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.KgcMapper;

public class ProfileMybatisDao {
	private Class<KgcMapper> cls = KgcMapper.class;
	private Map<String, Object> map = new HashMap<>();

	public List<Profile> list() {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).list(null); //매개변수 없고 전체 목록 다 조회해
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}
}

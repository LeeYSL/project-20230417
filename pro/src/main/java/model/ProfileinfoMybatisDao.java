package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.ProfileinfoMapper;



public class ProfileinfoMybatisDao {
	private Class<ProfileinfoMapper> cls = ProfileinfoMapper.class;
	private Map<String, Object> map = new HashMap<>();

	public List<Profileinfo> list() {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).list(); // 매개변수 없고 전체 목록 다 조회해
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}

}

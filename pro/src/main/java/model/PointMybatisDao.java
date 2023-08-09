package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.PointMapper;

public class PointMybatisDao {
	private Class<PointMapper> cls = PointMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	public int pointCount() {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).pointCount(null);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return 0;
	}
	public List<Point> list(int pageNum, int limit) {
		SqlSession session = MybatisConnection.getConnection();
		try {
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
	public boolean insert(Point point) {
		SqlSession session = MybatisConnection.getConnection();
		try {

			return session.getMapper(cls).insert(point) > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}
	public Point selectOne(int code) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectOne(code);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}
	public boolean update(Point point) {
		SqlSession session = MybatisConnection.getConnection();
		try {

			return session.getMapper(cls).update(point) > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}
}

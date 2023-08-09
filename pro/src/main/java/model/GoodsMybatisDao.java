package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.GoodsMapper;

public class GoodsMybatisDao {
	private Class<GoodsMapper> cls = GoodsMapper.class;
	private Map<String, Object> map = new HashMap<>();

	public boolean insert(Goods goods) {
		SqlSession session = MybatisConnection.getConnection();
		try {

			return session.getMapper(cls).insert(goods) > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}
	public int maxcode() {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxcode();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return 0;
	}

	public List<Goods> list() {
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

	public Goods selectOne(int code) {
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


	public int goodsCount() {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).goodsCount(null);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return 0;
	}


	public List<Goods> list(int pageNum, int limit) {
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
	public boolean update(Goods goods) {
		SqlSession session = MybatisConnection.getConnection();
		try {

			return session.getMapper(cls).update(goods) > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}
}

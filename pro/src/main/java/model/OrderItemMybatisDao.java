package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.OrderItemMapper;

public class OrderItemMybatisDao {
	private Class<OrderItemMapper> cls = OrderItemMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	
	public boolean insert(OrderItem item) {
		SqlSession session = MybatisConnection.getConnection();
		try {

			return session.getMapper(cls).insert(item) > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}


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



	public List<OrderItem> buylist(String id) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);

			return session.getMapper(cls).buylist(map); // 매개변수 없고 전체 목록 다 조회해
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}

		return null;
	}


	public int oderCount(String id) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);

			return session.getMapper(cls).oderCount(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return 0;
	}


	public List<OrderItem> buylist(String id, int pageNum, int limit) {
		SqlSession session = MybatisConnection.getConnection();

		try {
			map.clear();
			map.put("id", id);
			map.put("sLimit", (pageNum - 1) * limit);
			map.put("eLimit", limit);

			return session.getMapper(cls).buylist(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;

	}





	public int totalCount() {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).totalCount(null);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return 0;
	}


	public List<OrderItem> tlist(int pageNum, int limit) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			map.put("sLimit", (pageNum - 1) * limit);
			map.put("eLimit", limit);
			return session.getMapper(cls).tlist(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}


}

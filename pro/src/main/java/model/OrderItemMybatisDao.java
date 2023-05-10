package model;

import java.util.HashMap;
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

}

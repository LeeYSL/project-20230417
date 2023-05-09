package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.CartMapper;

public class CartMybatisDao {
	private Class<CartMapper> cls = CartMapper.class;
	private Map<String, Object> map = new HashMap<>();

		public List<Cart> cartlist(String memId) {
			SqlSession session = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("memId",memId);
				
				return session.getMapper(cls).cartlist(map); //매개변수 없고 전체 목록 다 조회해
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(session);
			}
			return null;
		}

		public boolean insert(Cart cart) {
			SqlSession session = MybatisConnection.getConnection();
			try {
				int cnt = session.getMapper(cls).insert(cart);
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



}

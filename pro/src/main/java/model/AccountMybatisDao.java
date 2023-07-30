package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.AccountMapper;

public class AccountMybatisDao {
	private Class<AccountMapper> cls = AccountMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	public void insert(String memId) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			session.getMapper(cls).insert(memId);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MybatisConnection.close(session);
		}
	}


	public void pointinsert(String memId, int pointPrice, String name, int memPoint) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			session.getMapper(cls).pointinsert(memId,pointPrice,name,memPoint);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MybatisConnection.close(session);
		}
	
	}


	public boolean minus(String memId, int price, String name, int nowpoint) {
		SqlSession session = MybatisConnection.getConnection();
		try {

			return session.getMapper(cls).minus(memId,price,name,nowpoint) > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}


	public int accountCount(String id) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).accountCount(id);
		} catch (Exception e) {
			e.printStackTrace(); 
		} finally {
			MybatisConnection.close(session);
		}
		return 0;
	}


	public List<Account> accounntlist(String id, int pageNum, int limit) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			map.put("sLimit", (pageNum - 1) * limit);
			map.put("eLimit", limit);
			map.put("id", id);
			return session.getMapper(cls).accounntlist(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}




}



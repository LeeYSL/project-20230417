package model.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.Orderinfo;

public interface OrderInfoMapper {
	@Select ("select ifnull(max(order_code),0) from orderinfo")
	int maxnum();

	@Insert("insert into orderinfo (order_code, mem_id, mem_address, order_date )" 
			+ " values (#{orderCode},#{memId},#{memAddress}, now())")
	int insert(Orderinfo info);

}

package model.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.OrderItem;

public interface OrderItemMapper {

	@Insert("insert into orderitem (order_code, goods_code, cart_quantity, mem_id )" 
			+ " values (#{orderCode},#{goodsCode},#{cartQuantity},#{memId})")
	int insert(OrderItem item);
	
	@Select ("select ifnull(max(order_code),0) from orderitem")
	int maxnum();
}

package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.OrderItem;

public interface OrderItemMapper {

	@Insert("insert into orderitem (order_code, goods_code, cart_quantity, mem_id )" 
			+ " values (#{orderCode},#{goodsCode},#{cartQuantity},#{memId})")
	int insert(OrderItem item);
	
	@Select ("select ifnull(max(order_code),0) from orderitem")
	int maxnum();
	
	@Select ({"<script>" ,"SELECT i.mem_id, i.order_code, i.cart_quantity, g.goods_name, g.goods_price, g.goods_img "
					+ "FROM orderitem i , goods g, member m "
					+ "WHERE i.goods_code = g.goods_code and c.mem_id= #{id} and i.mem_id= m.mem_id",
					"</script>"})
	List<OrderItem> list(Map<String, Object> map);
}

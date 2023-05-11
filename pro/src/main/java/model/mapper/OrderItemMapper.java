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
	
	@Select ({"<script>" ,"SELECT i.order_code, i.mem_id, i.goods_code, i.cart_quantity, g.goods_name, g.goods_price, g.goods_img, f.mem_address "
			+ "FROM  goods g, orderitem i, orderinfo f  "
			+ "WHERE f.mem_id= #{id} and g.goods_code = i.goods_code and i.order_code = f.order_code "
			+ " order by i.order_code desc "
			+ " limit #{sLimit}, #{eLimit}",
				"</script>"})
	List<OrderItem> buylist(Map<String, Object> map);

	 @Select("select count(*) from orderitem where mem_id=#{memId}")
	int oderCount(String id);


		 @Select("select count(*) from orderitem ")
		int totalCount(Object object);

		 

			@Select ({"<script>" ,"SELECT i.order_code, i.mem_id, i.goods_code, i.cart_quantity, g.goods_name, g.goods_price, g.goods_img, f.mem_address "
					+ "FROM  goods g, orderitem i, orderinfo f  "
					+ "WHERE f.mem_id= i.mem_id and g.goods_code = i.goods_code and i.order_code = f.order_code "
					+ " order by i.order_code desc "
					+ " limit #{sLimit}, #{eLimit}",
						"</script>"})
		List<OrderItem> tlist(Map<String, Object> map);
}

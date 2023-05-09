package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.Cart;


public interface CartMapper {
	@Select ({"<script>" ,"SELECT c.mem_id, c.goods_code, c.cart_quantity, g.goods_name, g.goods_price, g.goods_img "
			+ "FROM cart c , goods g "
			+ "WHERE c.goods_code = g.goods_code ",
			"</script>"}) 
	List<Cart> cartlist(Map<String, Object> map);

	
	@Insert("insert into cart (goods_code, mem_id, cart_quantity )" 
			+ " values (#{goodsCode},#{memId},1)")	
	int insert(Cart cart);

}

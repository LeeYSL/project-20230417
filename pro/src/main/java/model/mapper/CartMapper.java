package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.Cart;


public interface CartMapper {
	@Select ({"<script>" ,"SELECT c.mem_id, c.goods_code, c.cart_quantity, g.goods_name, g.goods_price, g.goods_img "
			+ "FROM cart c , goods g, member m "
			+ "WHERE c.goods_code = g.goods_code and c.mem_id= #{memId} and c.mem_id= m.mem_id",
			"</script>"}) 
	List<Cart> cartlist(Map<String, Object> map);

	
	@Insert("insert into cart (goods_code, mem_id, cart_quantity )" 
			+ " values (#{goodsCode},#{memId},1)")	
	int insert(Cart cart);

	@Select("select mem_id from cart")
	String find(String id);

	@Select("select * from cart where mem_id=#{memId}")
	Cart selectFind(String memId);
//
//	@Select("select * from cart where goods_code=#{goodsCode}")
//	Cart selectOne(int goodsCode);
//
//	@Delete("delete from cart where goods_code=#{goodsCode}")
//	int delete(int goodsCode);
//
	@Delete("delete from cart where goods_code=#{goodsCode}  and mem_id= #{memId}")
	int delete(Cart cart);

	@Select({"<script>",
		"select * from cart",
		"<if test='names != null'> where goods_code in"
		+ "<foreach collection='names' item='goods_code' "
		+ " separator=',' open='(' close=')'>#{goodsCode}</foreach></if>",
		"</script>"})
	List<Cart> list(Map<String, Object> map);

 @Select("select * from cart where goods_code=#{code} and mem_id= #{memId}")
	Cart selectOne(int code);

}

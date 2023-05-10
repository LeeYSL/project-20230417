package model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.Cart;
import model.Goods;

public interface GoodsMapper {
	
	@Insert("insert into goods (goods_code, goods_name, goods_price, goods_img, goods_num )" 
			+ " values (#{goodsCode},#{goodsName},#{goodsPrice},#{goodsImg},#{goodsNum})")
	int insert(Goods goods);

	@Select ("select ifnull(max(goods_num),0) from goods")
	int maxnum();

	@Select({"<script>",
		"select * from goods",
		"</script>"})
	List<Goods> list(Object object);

	@Select("select * from goods where goods_code=#{code}")
	Goods selectOne(int code);


}
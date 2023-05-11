package model.mapper;

import java.util.List;
import java.util.Map;

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

//	@Select("select * from goods")
//	List<Goods> list(Object object);

	@Select("select * from goods where goods_code=#{code}")
	Goods selectOne(int code);

	@Select("select count(*) from goods")
	int goodsCount(Object object);
	
	
	@Select ({"<script>" ,"SELECT * FROM goods order by goods_code desc" 
			+ " limit #{sLimit}, #{eLimit}",
			"</script>"})
	List<Goods> list(Map<String, Object> map);


}

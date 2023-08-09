package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Goods;

public interface GoodsMapper {
	
	@Insert("insert into goods (goods_code, goods_name, goods_price, goods_img, goods_num, goods_description )" 
			+ " values (#{goodsCode},#{goodsName},#{goodsPrice},#{goodsImg},#{goodsNum},#{goodsDescription})")
	int insert(Goods goods);

	@Select ("select ifnull(max(goods_code),0) from goods")
	int maxcode();

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

	@Update({"<script>"
			+ "update goods set goods_name=#{goodsName}, goods_price=#{goodsPrice}, "
			+ "<if test='goodsImg != null'> goods_img=#{goodsImg}, </if>"
			+ "<if test='goodsDescription != null'> goods_description=#{goodsDescription}, </if>"
			+ " goods_num=#{goodsNum}  where goods_code=#{goodsCode} "
			+ "</script>"})
	int update(Goods goods);


}

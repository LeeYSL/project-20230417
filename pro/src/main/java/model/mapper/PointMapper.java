package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.Point;

public interface PointMapper {

	@Select("select count(*) from point")	
	int pointCount(Object object);

	@Select ({"<script>" ,"SELECT * FROM point order by point_price  " 
			+ " limit #{sLimit}, #{eLimit}",
			"</script>"})
	List<Point> list(Map<String, Object> map);

	@Insert("insert into point (point_code, point_name, point_price, point_img )" 
			+ " values (#{pointCode},#{pointName},#{pointPrice},#{pointImg})")	
	int insert(Point point);

	@Select("select * from point where point_code=#{code}")	
	Point selectOne(int code);

}

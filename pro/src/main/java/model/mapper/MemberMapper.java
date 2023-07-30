package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Comment;
import model.Member;

public interface MemberMapper {

	@Insert("insert into member"
			+ "(mem_id, mem_pw, mem_name,mem_phone,mem_email,mem_adress,mem_position,mem_point) "
			+ "values (#{memId},#{memPw},#{memName},#{memPhone},#{memEmail},#{memAdress}, "
			+ "#{memPosition},#{memPoint})")
	int insert(Member mem);

	@Select("select * from member where mem_id=#{memId} and mem_pw=#{memPw}")
	Member selectLogin(@Param("memId")String memId, @Param("memPw")String memPw);
	
	@Select("select * from member where mem_id=#{value}")
	Member selectOne(String id);
	
	@Update("update member set mem_pw=#{memPw},mem_name=#{memName},mem_phone=#{memPhone}, "
			+ " mem_email=#{memEmail},mem_adress=#{memAdress}"
			+ " where mem_id=#{memId}")
	int update(Member mem);
    
	@Select("select mem_id from member "
			+ " where mem_email=#{memEmail} and mem_name=#{memName}")
	String idSearch(@Param("memEmail")String memEmail,@Param("memName")String memName);

	@Delete("delete from member where mem_id=#{memId}")
	int delete(String memId);

	@Select("select mem_pw from member "
			+ " where mem_id=#{memId} and mem_email=#{memEmail} and mem_name=#{memName} ")
	String pwSearch(@Param("memId")String memId,@Param("memEmail")String memEmail,@Param("memName")String memName);

	@Update("update member set mem_point=#{memPoint} "
			+ "where mem_id=#{memId}")
	int mupdate(Member member);

	@Select("select count(*) from member")
	int memberCount(Object object);

	@Select ({"<script>" ,"SELECT * FROM member order by mem_id " 
			+ " limit #{sLimit}, #{eLimit}",
			"</script>"})
	List<Member> list(Map<String, Object> map);


	@Update("update member set mem_point=#{memPoint}+#{pointPrice} where mem_id = #{memId}") 
	int addpoint(@Param("pointPrice")int pointPrice, @Param("memPoint")int memPoint,@Param("memId")String memId); 


//	@Update("update member set mem_point=#{memPoint}+#{pointPrice} where mem_id = #{memId}") 
//	
//	Member addpoint(@Param("memId")String memId, @Param("pointPrice")int pointPrice, @Param("memPoint")int memPoint);

	

}

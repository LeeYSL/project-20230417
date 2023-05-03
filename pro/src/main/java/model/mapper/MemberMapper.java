package model.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	String idSearch(@Param("memEmail")String memEmail,@Param("memName") String memName);

}

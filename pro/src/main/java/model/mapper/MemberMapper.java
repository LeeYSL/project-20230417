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
	Member selectOne(@Param("memId")String memId, @Param("memPw")String memPw);

	
	@Update("update member set mem_pw=#{memId},mem_name=#{memName},mem_phone=#{memPhone}, "
			+ " mem_email=#{memEmail},mem_adress=#{memAdress}"
			+ " where mem_id=#{memId}")
	int update(Member mem);

}

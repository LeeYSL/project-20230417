package model.mapper;

import org.apache.ibatis.annotations.Insert;

import model.Member;

public interface MemberMapper {

	@Insert("insert into member"
			+ "(mem_id, mem_pw, mem_name,mem_phone,mem_email,mem_adress,mem_position,mem_point) "
			+ "values (#{memId},#{memPw},#{memName},#{memPhone},#{memEmail},#{memAdress}, "
			+ "#{memPosition},#{memPoint})")
	int insert(Member mem);

}

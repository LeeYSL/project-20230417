package model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import model.Profileinfo;

public interface ProfileinfoMapper {
@Select("select* from profileinfo")
	List<Profileinfo> list();

@Select("select distinct numposition from profileinfo")
List<String> positionnames();

@Select("select* from profileinfo where numposition= #{value}")
List<Profileinfo> positionlist(String s);

}

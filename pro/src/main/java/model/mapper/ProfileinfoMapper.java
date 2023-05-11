package model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import model.Profileinfo;

public interface ProfileinfoMapper {
@Select("select* from profileinfo")
	List<Profileinfo> list();

}

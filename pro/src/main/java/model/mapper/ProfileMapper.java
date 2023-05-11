package model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import model.Profile;

public interface ProfileMapper {
	@Select("select * from profile")
	List<Profile> list(Object object);

}

package model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import model.Record;

public interface KgcMapper {
     
	@Select("select league_year, league_name from record GROUP BY league_year, league_name order by league_year desc")
	List<Record> yearList();
	
	@Select("select * from record where league_year = #{leagueYear} order by level")
	List<Record> list(String leagueYear);

}

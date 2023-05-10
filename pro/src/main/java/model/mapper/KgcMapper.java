package model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import model.Record;

public interface KgcMapper {
     
	@Select("select league_year, league_name from record GROUP BY league_year, league_name order by league_year desc")
	List<Record> yearList();
	
	@Select("SELECT a.*,"
			+ "	 b.team_img "
			+ " from record a"
			+ " JOIN team b"
			+ " ON a.team_name = b.team_name"
			+ " WHERE a.league_year = #{leagueYear}"
			+ " order by a.level;")
	List<Record> list(String leagueYear);

}

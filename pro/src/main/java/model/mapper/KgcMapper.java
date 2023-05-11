package model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import model.Game;
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
	
	
    @Select("select substr(game_day,1,6) AS gameday from game GROUP BY gameday")
	List<Game> gameList();

    
    @Select("SELECT *, "
            + " (SELECT team_img FROM team b WHERE a.home_team = b.team_name) AS home_img,"
		    + " (SELECT team_img FROM team b WHERE a.away_team = b.team_name) AS away_img "
            + " FROM game a "
            + " WHERE substr(game_day,1,6) = #{gameDay}")
	List<Game> gameYearlist(String gameDay);

}

package model.mapper;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.Board;
public interface BoardMapper {
	@Select ("select ifnull(max(board_num),0) from board") //이게 뭔말인지...
	int maxnum();
	
	@Insert("insert into board (board_num, board_content, board_file, board_title, "
			+ " board_time, board_readcnt, board_id, board_grp, board_grplevel, board_grpstep, mem_id )" 
			+ " values (#{boardNum},#{boardContent},#{boardFile},#{boardTitle},now(),0,#{boardId},"
					+ "#{boardGrp},#{boardGrpLevel},#{boardGrpStep},#{memId})")
	int insert(Board board);

}

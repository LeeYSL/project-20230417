package model.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.checkerframework.checker.units.qual.degrees;

import model.Board;
public interface BoardMapper {
	@Select ("select ifnull(max(board_num),0) from board") //이게 뭔말인지...
	int maxnum();
	
	@Insert("insert into board (board_num, board_content, board_file, board_title, "
			+ " board_time, board_readcnt, board_id, board_grp, board_grplevel, board_grpstep, mem_id )" 
			+ " values (#{boardNum},#{boardContent},#{boardFile},#{boardTitle},now(),0,#{boardId},"
					+ "#{boardGrp},#{boardGrpLevel},#{boardGrpStep},#{memId})")
	int insert(Board board);

	
	@Select ({"<script>" ,"SELECT * FROM board where board_id=#{boardId} " 
			+ " order by board_grp desc, board_grpstep asc"
			+ " limit #{sLimit}, #{eLimit}",
			"</script>"})
	List<Board>list(Map<String, Object> map);

	
	@Select ({"<script>",
		"select count(*) from board where board_id=#{boardId}",
		"</script>"})
	int boardCount(Map<String, Object> map);



	@Select("select * from board where board_num=#{boardNum}")
	Board selectOne(int boardNum);

	@Update("update board set mem_id=#{memId}, board_title=#{boardTitle}, board_content=#{boardContent},boardFile=#{boardFile} where board_num=#{boardNum}")
	int update(Board board);
   
	@Delete("delete from board where board_num=#{boardNum}")
	int delete(String boardNum);

}

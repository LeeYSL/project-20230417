package model;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface BoardMapper {
	@Select ("select ifnull(max(num),0) from board") //이게 뭔말인지...
	int maxnum();
	
	String sql = "insert into board(boardNum, boardContent, boardFile, boardTitle, "
			+ " boardTime, boardReadCnt, boardId, boardGrp, boardGrpLevel, boardGrpStep, "
			+ " memId)" + " values (#{boardNum},#{boardContent},#{boardFile},#{boardTitle},now(),0,#{boardId},"
					+ "#{boardGrp},#{boardGrpLevel},#{boardGrpStep})";

	@Insert(sql)
	int insert(Board board);

}

package model.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import model.Comment;

public interface CommentMapper {
	
	@Select("insert into Comment"
			+ "(board_num, comment_num, comment_time, mem_id) "
			+ "values (#{boardNum},#{commentNum},#{commentTime},#{memId})") 
	int insert(Comment comm);

	@Select("select ifnull(max(seq),0) from comment where num=#{num}") //#{num}는 value 값 num 값을 담겠다
	int maxseq(int num);
	
	
    @Delete("delete from Comment where num=#{num} and seq=#{seq}")
	int delete(int num, int seq);

}

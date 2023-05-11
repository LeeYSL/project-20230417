package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Comment;

public interface CommentMapper {
	
	@Insert ("insert into comment "
			+ " (board_num, comment_num, comment_time, mem_id , comment_content) "
			+ " values (#{boardNum},#{commentNum},now(),#{memId},#{commentContent})") 
	int insert(Comment comm);

	@Select("select ifnull(max(comment_num),0) from comment where board_num=#{boardNum}") //#{num}는 value 값 num 값을 담겠다
	int maxseq(int boardNum);
	
	
    @Delete("delete from comment where board_num=#{boardNum} and comment_num=#{commentNum}")
	int delete(@Param("boardNum")int boardNum, @Param("commentNum")int commentNum);
    
    @Select("select * from comment where board_num = #{boardNum}")
    List<Comment> list(int boardNum);

    @Select("select * from comment where board_num = #{boardNum} and comment_num=#{commentNum}")
	Comment selectOne(@Param("boardNum")int boardNum, @Param("commentNum")int commentNum);

    @Update("update comment set comment_content=#{commentContent} where board_num=#{boardNum} and comment_num=#{commentNum} " )
	int update(Comment comm);

	

}

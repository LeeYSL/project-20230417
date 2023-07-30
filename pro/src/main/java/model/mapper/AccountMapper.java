package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import model.Account;

public interface AccountMapper {

	@Insert("insert into account "
			+ " (mem_id, account_plus, account_minus,account_date,account_total) "
			+ " values (#{memId},30000,0,now(),30000) ")
	Object insert(String memId);

	@Insert("insert into account "
			+ " (mem_id, account_plus, account_minus,account_date, account_reason, account_total ) "
			+ " values (#{memId},#{pointPrice},0,now(),#{name},#{memPoint}+#{pointPrice}) ")	
	void pointinsert(@Param("memId")String memId,@Param("pointPrice") int pointPrice,@Param("name") String name, @Param("memPoint")int memPoint);

	
	@Insert("insert into account "
			+ " (mem_id, account_plus, account_minus,account_date, account_reason, account_total ) "
			+ " values (#{memId},0,#{price},now(),#{name},#{nowpoint}-#{price}) ")		
	int minus(@Param("memId")String memId, @Param("price")int price, @Param("name")String name,@Param("nowpoint") int nowpoint);

	@Select("select count(*) from account where mem_id=#{id}")		
	int accountCount(String id);

	@Select ({"<script>" ,"SELECT * FROM account where mem_id=#{id} " 
			+ " order by account_date desc "
			+ " limit #{sLimit}, #{eLimit}",
			"</script>"})	
	List<Account> accounntlist(Map<String, Object> map);


	

}


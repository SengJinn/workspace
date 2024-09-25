package com.bitc.membership.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

public interface MembershipDAO {

	// 포인트 적립
	@Update("UPDATE member SET point = COALESCE(point, 0) + #{point} WHERE email = #{email}")
	int pointUpdate(@Param("email")String email, @Param("point")int point);
	
}

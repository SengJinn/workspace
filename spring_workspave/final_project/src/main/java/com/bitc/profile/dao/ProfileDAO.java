package com.bitc.profile.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.profile.vo.ProfileVO;

public interface ProfileDAO {

	@Insert("INSERT INTO profile (email, name, image, pass) VALUES (#{email}, #{name}, #{image}, #{pass})")
	boolean createProfile(ProfileVO profile);

	// 사용자 계정으로 프로필 리스트 조회
	@Select("SELECT * FROM profile WHERE email = #{email}")
	List<ProfileVO> profileList(String email);

	// 선택한 프로필 정보 가져오기
	@Select("SELECT num, name, image, email, bookmark, pass FROM profile WHERE num = #{num}")
	ProfileVO selectProfile(int num);

	// 프로필 삭제
	@Delete("DELETE FROM profile WHERE num = #{num} AND email = #{email}")
	boolean deleteProfile(@Param("num") int num, @Param("email") String email);

	// 프로필 수정
	@Update("UPDATE profile SET name = #{name}, pass = #{pass}, image = #{image} WHERE num = #{num}")
	boolean updateProfile(ProfileVO profile);

}

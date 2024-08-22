package com.bitc.di.dao;

import org.springframework.stereotype.Repository;

@Repository
public class TestDBCPImpl implements TestDAO{

	@Override
	public void select(String message) {
		System.out.println("DBCP 구현 : " + message);
	}

}

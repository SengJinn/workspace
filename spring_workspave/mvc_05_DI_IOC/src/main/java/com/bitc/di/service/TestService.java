package com.bitc.di.service;

import org.springframework.stereotype.Service;

import com.bitc.di.dao.TestDAO;
import com.bitc.di.dao.TestDBCPImpl;

@Service
public class TestService {

	private final TestDAO dao;

//	@Autowired
	public TestService(TestDAO dao) {
		// this.dao = new TestDAOImpl();
		// this.dao = new TestDBCPImpl();
		this.dao = dao;
	}

	/*
	 * @Autowired public void setDao(TestDAO dao) { this.dao = dao; }
	 */
	public void testService(String message) {
		System.out.println("testService : " + message);
		dao.select(message);
		// this.dao = new TestDAOImpl();
	}

}

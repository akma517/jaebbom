package com.sku.jaebbom;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class OracleConnectionTest {
	private static final Logger logger = LoggerFactory.getLogger(OracleConnectionTest.class);
	
	@Autowired
	private DataSource dataSource;
	
	@Test
	public void testConnection() {
		try (Connection con = dataSource.getConnection()){
			logger.info("\n Oracle 연결: "+ con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

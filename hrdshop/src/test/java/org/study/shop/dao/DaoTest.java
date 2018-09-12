package org.study.shop.dao;



import java.sql.Date;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.study.shop.model.Member;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"
})
public class DaoTest {

	@Autowired
	private ShopDao dao;
	
	@Test
	public void testInsertMember() throws Exception {
    Member member = new Member();
	member.setMember_id("user1");
	member.setMember_name("user01");
	member.setMember_pw("1234");
	member.setMember_join_date(new Date(new java.util.Date().getTime()));
	dao.insertMember(member);
	}
}

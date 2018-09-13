package org.study.shop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.study.shop.model.Member;

@Repository
public class ShopDaoImpl implements ShopDao {

	private boolean isInit = false;
	
	private static final String namespace="org.study.mapper.ShopMapper";
	@Autowired
	SqlSession session;
	
	@Override
	public void insertMember(Member member) throws Exception{
		if (isInit == false) {
			init();
		}
		
		session.insert(namespace + ".insertMember", member);
	}

	@Override
	public void init() {
		if (existMemberTable() == false) {
			createMemberTable();
		}
		
		isInit = true;
	}

	@Override
	public boolean existMemberTable() {
		int count = session.selectOne(namespace + ".existMemberTable");
		
		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public void createMemberTable() {
		session.update(namespace + ".createMemberTable");
	}

	@Override
	public boolean existMemberId(String id) {
		int count = session.selectOne(namespace + ".existMemberId", id);
		
		if (count == 0) {
			return false;
		} else {
			return true;
		}
		  
	}

}
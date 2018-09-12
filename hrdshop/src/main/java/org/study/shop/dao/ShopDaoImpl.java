package org.study.shop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.study.shop.model.Member;

@Repository
public class ShopDaoImpl implements ShopDao{
	
	private static final String namespaces="org.study.mapper.ShopMapper";

	@Autowired
	SqlSession session;
	
	@Override
	public void insertMember(Member member) {
	session.insert(namespaces +".insertMember",member);
		
	}

	

}

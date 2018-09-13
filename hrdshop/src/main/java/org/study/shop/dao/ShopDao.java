package org.study.shop.dao;

import org.study.shop.model.Member;

public interface ShopDao {

	public void init();
	
	public void insertMember(Member member) throws Exception;
	
	public boolean existMemberTable();
	
	public void createMemberTable();

	public boolean existMemberId(String id);
}
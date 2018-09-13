package org.study.shop.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.study.shop.dao.ShopDao;
import org.study.shop.model.Member;

/**
 * �ش� Ŭ�󽺴� ������ ��Ʈ�ѷ��μ� �⺻���� �� ����� �����ϰ� �ִ�
 * 
 *
 * @author jitaek
 *
 */
@Controller
public class ShopController {

	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	@Autowired
	ShopDao dao;
	/**
	 * �ش� �Լ��� ȸ����� ��ûó�� �Լ�
	 * 
	 * 
	 * @return ȸ����� ������ �� �̸�
	 * 
	 */
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String register() {
		logger.info("/register get called...");
		
		return "registerForm";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	@ResponseBody
	public String registerProc(Member member, String member_pw1, String member_pw2) {
		logger.info("/register post called...");
		
		
		if (member_pw1.length() > 0 && member_pw1.equals(member_pw2)) {
			member.setMember_pw(member_pw1);
			logger.info("member: " + member + "(" + member_pw1 + ", " + member_pw2 +")");
			
			try {
				dao.insertMember(member);
				return "success";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "fail2";
			}
			
		} else {
			return "fail";
		}

	}
	
	@RequestMapping(value="/idcheck", method=RequestMethod.POST)
	@ResponseBody
	public String idCheck(String id) {
		logger.info("idCheck: " + id);
		
		if (dao.existMemberId(id)) {
			return "not available";
		} else {
			return "available";
		}

	}
	
}
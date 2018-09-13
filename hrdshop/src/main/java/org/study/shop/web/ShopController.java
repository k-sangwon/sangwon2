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
 * 해당 클라스는 스프링 컨트롤러로서 기본적인 웹 기능을 맵핑하고 있다
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
	 * 해당 함수는 회원등록 요청처리 함수
	 * 
	 * 
	 * @return 회원등록 페이지 뷰 이름
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
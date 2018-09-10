package org.study.shop.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShopController {
	
	private static final Logger logger=LoggerFactory.getLogger(ShopController.class);
	
	@RequestMapping("/register")
	public String register() {
		logger.info("/register called");
		
		return "registerForm";
	}
}

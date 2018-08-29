package org.study.board.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.study.board.dao.BoardDAO;
import org.study.board.model.Board;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private BoardDAO dao;
	
	@RequestMapping("/list")
	public String listAll(Model model){
		logger.info("/list was called");
		try {
			List<Board> list = dao.listAll();
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "board/list";
	}
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String register() {
		logger.info("/register was called");
		return "board/register";
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String procRegister(Board board, RedirectAttributes rttr) {
		logger.info("/register post was called: " + board);
		// database process
		try {
			dao.create(board);
			rttr.addFlashAttribute("msg", "success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			rttr.addFlashAttribute("msg","failure");
			e.printStackTrace();
		}
		
		return "redirect:/list";
	}
	
	@RequestMapping(value="/read") 
	public String read(int bno, Model model) throws Exception{
		logger.info("read was called: " + bno);
				
		Board board = dao.read(bno);
		logger.info("Board: content=" + board.getContent());
		
		dao.increaseViewCnt(bno);
		model.addAttribute("board", board);
		
		return "board/read";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyGet(int bno, Model model) {
		logger.info("modify get was called");
		
		try {
			Board board = dao.read(bno);
			model.addAttribute("board", board);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "board/modify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPost(Board board, RedirectAttributes rttr) {
		logger.info("modify post was called " + board);
		
		try {
			dao.update(board);
			rttr.addFlashAttribute("msg", "success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			rttr.addFlashAttribute("msg", "failure");
		}
		return "redirect:/list";
	}
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(Integer bno, RedirectAttributes rttr) {
		logger.info("delete post was called " + bno);
		
		try {
			dao.delete(bno);
			rttr.addFlashAttribute("msg2", "success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			rttr.addFlashAttribute("msg2", "failure");
		}
		return "redirect:/list";
	}
}

package org.study.board.dao;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.junit.runner.RunWith;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.study.board.model.Board;
import org.study.board.dao.BoardDAO;
import org.study.board.web.BoardController;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = 
	{ "file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDAOTest {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private BoardDAO dao;
	
	@Test
	public void testCreate() throws Exception {
		Board board = new Board();
		board.setTitle("스프링 프레임워크");
		board.setContent("스프링 MVC");
		board.setWriter("구멍가게코딩단");
		
		dao.create(board);
	}
	
	@Test
	public void testRead() throws Exception {
		Board board = dao.read(26);
		
		Assert.assertEquals("구멍가게코딩단", board.getWriter());
		
		board = dao.read(40);
		Assert.assertNull(board);
	}
	
	@Test
	public void testUpdate() throws Exception {
		Board board = dao.read(24);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		
		dao.update(board);
	}
	@Test
	public void testIncreaseViewCnt()throws Exception{
		dao.increaseViewCnt(21);
		
	}
	
	@Test
	public void testListAll() throws Exception {
		List<Board> list = dao.listAll();
		
		Assert.assertEquals(1, list.size());
	}
	
	@Test
	public void testListPage() throws Exception{
		List<Board> firstPage = dao.listPage(1);
		for(Board b: firstPage) {
			logger.info(b.toString());
		}
	
	} 
}

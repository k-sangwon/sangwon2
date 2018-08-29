package org.study.board.dao;

import java.util.List;

import org.study.board.model.Board;
import org.study.board.model.Criteria;

public interface BoardDAO {
	
	public void create(Board board) throws Exception;
	
	public Board read(Integer bno) throws Exception;
	
	public void update(Board board) throws Exception;
	
	public void delete(Integer bno) throws Exception;
	
	public void increaseViewCnt(Integer bno) throws Exception;
	
	public List<Board> listAll() throws Exception;
	
	public List<Board> listPage(int pageNum) throws Exception; 
	
	public List<Board>  listPage(Criteria cri) throws Exception;
}

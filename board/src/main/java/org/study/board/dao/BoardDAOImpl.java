package org.study.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.study.board.model.Board;
import org.study.board.model.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	private static final String namespace = "org.study.mapper.BoardMapper";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void create(Board board) throws Exception {
		session.insert(namespace + ".create", board);
	}

	@Override
	public Board read(Integer bno) throws Exception {
		return session.selectOne(namespace + ".read", bno);
	}

	@Override
	public void update(Board board) throws Exception {
		session.update(namespace + ".update", board);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace + ".delete", bno);
	}

	@Override
	public void increaseViewCnt(Integer bno) throws Exception {
		session.update(namespace + ".increase", bno);
	}
	
	
	@Override
	public List<Board> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public List<Board> listPage(int pageNum) throws Exception {
			if(pageNum<=0) {
				pageNum=1;
			}
			
			pageNum =(pageNum-1)* 10;
		return session.selectList(namespace + ".listPage",pageNum);
	}

	@Override
	public List<Board> listPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}

package sp.board.service;

import sp.board.dao.BoardDao;

public class BoardService {
	private BoardDao dao;

	public BoardService() {
		super();
		dao = new BoardDao();
	}
	
}

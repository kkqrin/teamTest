package sp.post.service;

import sp.post.dao.PostDao;

public class PostService {
	private PostDao dao;

	public PostService() {
		super();
		dao = new PostDao();
	}
	
}

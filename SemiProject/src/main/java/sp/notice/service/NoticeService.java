package sp.notice.service;

import sp.notice.dao.NoticeDao;

public class NoticeService {
	private NoticeDao dao;

	public NoticeService() {
		super();
		dao = new NoticeDao();
	}
	
}

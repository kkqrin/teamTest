package sp.noticeQuestion.service;

import sp.notice.dao.NoticeDao;
import sp.noticeQuestion.dao.NoticeQuestionDao;

public class NoticeQuestionService {
	private NoticeQuestionDao dao;

	public NoticeQuestionService() {
		super();
		dao = new NoticeQuestionDao();
	} 
}

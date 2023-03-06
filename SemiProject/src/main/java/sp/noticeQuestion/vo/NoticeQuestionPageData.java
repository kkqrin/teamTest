package sp.noticeQuestion.vo;

import java.util.ArrayList;

import sp.notice.vo.Notice;

public class NoticeQuestionPageData {
	private ArrayList<NoticeQuestion> list;
	private String pageNavi;
	private int start;
	public NoticeQuestionPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeQuestionPageData(ArrayList<NoticeQuestion> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<NoticeQuestion> getList() {
		return list;
	}
	public void setList(ArrayList<NoticeQuestion> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
}
	
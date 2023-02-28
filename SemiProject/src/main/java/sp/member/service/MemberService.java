package sp.member.service;

import sp.member.dao.MemberDao;

public class MemberService {
	private MemberDao dao;

	public MemberService() {
		super();
		dao = new MemberDao();
	}
	
}

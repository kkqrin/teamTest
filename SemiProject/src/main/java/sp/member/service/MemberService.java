package sp.member.service;

import java.net.ConnectException;
import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.member.dao.MemberDao;
import sp.member.vo.Member;

public class MemberService {
	private MemberDao dao;

	public MemberService() {
		super();
		dao = new MemberDao();
	}

	public ArrayList<Member> selectAllMember() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = dao.selectAllMember(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	
}

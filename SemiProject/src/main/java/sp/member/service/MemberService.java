package sp.member.service;

import java.net.ConnectException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.StringTokenizer;

import org.apache.catalina.startup.ConnectorCreateRule;

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


	public int changeGrade(int memberNo, int memberGrade) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.changeGrade(conn, memberNo, memberGrade);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	public boolean checkedChangeGrade(String no, String grade) {
		Connection conn = JDBCTemplate.getConnection();
		StringTokenizer sT1 = new StringTokenizer(no,"/");
		StringTokenizer sT2 = new StringTokenizer(grade,"/");
		boolean result = true;
		while(sT1.hasMoreTokens()) {
			int memberNo = Integer.parseInt(sT1.nextToken());
			int memberGrade = Integer.parseInt(sT2.nextToken());
			int changeResult = dao.changeGrade(conn, memberNo, memberGrade);
			if(changeResult == 0) {
				result = false;
				break;
			}
		}
		if(result) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public Member selectOneMember(String memberId) {
		Connection conn =JDBCTemplate.getConnection();
		Member m =dao.selectOneMember(conn,memberId);
		JDBCTemplate.close(conn);
		return m;
	}

	public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertMember(conn,m);
		if(result>0) {

			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Member selectOneMember(Member m) {
		Connection conn =JDBCTemplate.getConnection();
		Member member= dao.selectOneMember(conn,m);
		JDBCTemplate.close(conn);
		return member;
		
	}

	public Member selectMemberNo(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = dao.selectMemberNo(conn, memberNo);
		JDBCTemplate.close(conn);
		return m;
	}

	public int updateInfo(Member member) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateInfo(conn,member);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.deleteMember(conn,memberId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Member selectOneMemberPhone(Member m) {
		Connection conn =JDBCTemplate.getConnection();
		Member member= dao.selectOneMemberPhone(conn,m);
		JDBCTemplate.close(conn);
		return member;
		
	}

	public String selectOneMemberPhone(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		String memberPhone = dao.selectMemberPhone(conn,memberId);
		JDBCTemplate.close(conn);
		return memberPhone;
	}

	public String selectMemberEmail(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		String memberEmail = dao.selectMemberEmail(conn,memberId);
		JDBCTemplate.close(conn);
		return memberEmail;
	}

	public int updateMemberTemp(int memberNo, int memberTemp) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateMemberTemp(conn, memberNo, memberTemp);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


	public Member selectRetireMember(String memberPw) {
		Connection conn =JDBCTemplate.getConnection();
		Member member =dao.selectRetireMember(conn,memberPw);
		JDBCTemplate.close(conn);
		return member;
	}
	
	
	
	
}



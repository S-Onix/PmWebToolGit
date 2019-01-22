package service.member;

import dao.MemberDAO;
import service.Service;

public class MemberSignUpService implements Service{
	MemberDAO memberDAO;
	
	public MemberSignUpService(MemberDAO memberDAO) {
		// TODO Auto-generated constructor stub
		this.memberDAO = memberDAO;
	}

	@Override
	public void implementService() {
		// TODO Auto-generated method stub
		
	}
}

package controller;
import org.springframework.stereotype.Controller;

import service.member.MemberSignUpService;

@Controller
public class SignUpController {

	private MemberSignUpService memberSignUpService;
	
	public SignUpController(MemberSignUpService memberSignUpService) {
		this.memberSignUpService = memberSignUpService;
	}
		
	
	
}

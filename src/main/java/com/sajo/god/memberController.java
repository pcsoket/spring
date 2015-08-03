package com.sajo.god;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

<<<<<<< HEAD
import com.sajo.dao.MemberDAO;
import com.sajo.dto.MemberDTO;


@Controller("MemberController")
public class MemberController {
=======
import com.sajo.god.member.dao.MemberDAO;
>>>>>>> b27e4bdfc02d41e9aef5a3a24944ef9ff8082abc

@Controller
public class MemberController {
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO dao;
	
	

}

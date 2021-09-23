package com.sku.jaebbom.user.controller;

import java.io.File;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sku.jaebbom.talent.model.TalentVO;
import com.sku.jaebbom.user.model.UserVO;
import com.sku.jaebbom.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private JavaMailSender mailSender;

	/**
	 * 로그인 페이지 이동
	 * */
	@RequestMapping("/loginPage.do")
	public String loginPage() {
		return "user/loginPage";
	}
	/**
	 * 로그인 처리
	 * */
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public void login(Model model, @RequestParam("user_id") String user_id, @RequestParam("user_pwd") String user_pwd,
			HttpServletRequest request) throws Exception{
		
		//실질적인 로그인 처리는 인터셉트가 처리
		UserVO userVO = userService.login(new UserVO(user_id, user_pwd));
		model.addAttribute("user", userVO);
		//return"redirect:/";
	}
	
	/**
	 * 로그아웃
	 * */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		userService.logout(session);
		System.out.println("로그아웃");
		return "redirect:/";
	}
	
	/**
	 * 회원가입 동의 페이지 이동
	 * */
	@RequestMapping("/registerPage.do")
	public String registerPage() {
		return "user/registerPage";
	}

	
	
	/**
	 * 회원가입 페이지 이동
	 * */
	@RequestMapping("/joinPage.do")
	public String joinPage() {
		return "user/joinPage";
	}
	
	// 아이디 중복 검사
	@RequestMapping(value = "/userIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String userIdChkPOST(String user_id) throws Exception{
		
		System.out.println("진입");
		int result = userService.idCheck(user_id);
		System.out.println("결과값 = " + result);
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 x
		}
	}
	
	// 닉네임 중복 검사
	@RequestMapping(value = "/NickNameChk", method = RequestMethod.POST)
	@ResponseBody
	public String NickNameChkPOST(String nickname) throws Exception{
				
		System.out.println("닉네임 진입");
		int result = userService.nickCheck(nickname);
		System.out.println("닉네임 결과값 = " + result);
		if(result != 0) {
			return "fail";	// 중복 닉네임 존재
		} else {
			return "success";	// 중복 닉네임 x
		}
	}

	/**
	 * 회원 가입
	 */
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Model model, @RequestParam("ID") String user_id, @RequestParam("PW") String user_pwd,
			@RequestParam("nickname") String nickname, @RequestParam("name") String user_name, @RequestParam("email") String user_mail,
			@RequestParam("address") String user_adress, HttpServletResponse response) throws Exception{
		
		System.out.println("vo값 확인"+user_name+user_id+ user_pwd+ user_mail+ user_adress+ nickname);
		userService.joinMember(new UserVO(user_name, user_id, user_pwd, user_mail, user_adress, nickname));
		return "redirect:/";
	}
	
	
	/**
	 * 회원탈퇴 페이지 이동
	 * */
	@RequestMapping("/drawPage.do")
	public String drawPage() {
		return "user/drawPage";
	}
	
	/**
	 * 회원탈퇴 실시
	 * */
	@RequestMapping("/draw.do")
	public void draw(Model model, HttpSession session, HttpServletResponse response,
			@RequestParam("password") String password) throws Exception {
		UserVO user = (UserVO) session.getAttribute("login");
		
		int user_num = user.getUser_num();
		String user_pwd = user.getUser_pwd();
		boolean pwcheck = user_pwd.equals(password);
		if(pwcheck) {//탈퇴실시
			userService.deleteUser(new UserVO(user_num, user_pwd));
			
			PrintWriter response1 = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
			response1.append("<script>");
			response1.append("alert('회원 탈퇴에 성공하였습니다.\\n그동안 이용해주셔서 감사합니다.');");
			response1.append("location.href='/jaebbom/'");
			response1.append("</script>");
			response1.flush();
    		userService.logout(session);

		}else {//비번체크 실패
			response.setContentType("text/html; charset=UTF-8");
    		PrintWriter response1 = response.getWriter();
			response1.append("<script>");
    		response1.println("alert('비밀번호가 다릅니다');");
			response1.append("location.href='/jaebbom/user/drawPage.do'");
			response1.append("</script>");
    		response1.flush();
		}
	}
	
	/**
	 * 마이페이지
	 * */
	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String myPage(Model model, HttpSession session) throws Exception{
		/*
		 * String user_id = (String) session.getAttribute("user_id"); int user_num =
		 * (Integer)session.getAttribute("user_num");
		 */
		UserVO user = (UserVO) session.getAttribute("login");
		
		String user_id = user.getUser_id();
		int user_num = user.getUser_num();
		
		
		UserVO vo1 = userService.getUserInfo(user_id);
		model.addAttribute("userInfo", vo1);
		UserVO vo2 = userService.getUserUniv(user_id);
		model.addAttribute("userUniv", vo2);
		model.addAttribute("userCareerList", userService.getUserCareer(user_num));
		List<TalentVO> vo4 = userService.getregisteredTalent(user_num);
		model.addAttribute("registeredTalent", vo4);
		return "user/myPage";
	}
	
	/**
	 * 사용자 정보변경 페이지 이동
	 * */
	@RequestMapping(value="/changeUserInfo.do", method= RequestMethod.GET)
	public String changeUserInfo(Model model, HttpSession session) throws Exception{
		
		UserVO user = (UserVO) session.getAttribute("login");
		
		String user_id = user.getUser_id();
		
		model.addAttribute("userInfo", userService.getUserInfo(user_id));
		model.addAttribute("userVO",new UserVO());
		return "user/changeUserInfo";
	}
	
	/**
	 * 사용자 정보 업데이트
	 * */
	@RequestMapping(value="/updateUserInfo.do", method= RequestMethod.POST)
	public String updateUserInfo(Model model, @ModelAttribute("userVO") UserVO userVO, HttpServletResponse response, HttpSession session) throws Exception{
		userService.updateUserInfo(userVO);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter response1 = response.getWriter();
		response1.println("<script>alert('회원정보 수정 완료');</script>");
		response1.flush();
		
		UserVO user = (UserVO) session.getAttribute("login");
		
		String user_id = user.getUser_id();
		int user_num = user.getUser_num();

		UserVO vo1 = userService.getUserInfo(user_id);
		model.addAttribute("userInfo", vo1);
		UserVO vo2 = userService.getUserUniv(user_id);
		model.addAttribute("userUniv", vo2);
		model.addAttribute("userCareerList", userService.getUserCareer(user_num));
		List<TalentVO> vo4 = userService.getregisteredTalent(user_num);
		model.addAttribute("registeredTalent", vo4);
		return "user/myPage";
	}
	
	/**
	 * Id 찾기 페이지 이동
	 * */
	@RequestMapping("/findidPage.do")
	public String findidPage() {
		return "user/findIDPage";
	}
	/**
	 * PW 찾기 페이지 이동
	 * */
	@RequestMapping("/findpwpage.do")
	public String findpwpage() {
		return "user/findPWPage";
	}
	/**
	 * PW 변경 페이지 이동
	 * */
	@RequestMapping("/rePWPage.do")
	public String rePWPage() {
		return "user/rePWPage";
	}
	
	/**
	 * 이메일로 비번전송 
	 * */
    @RequestMapping(value="/sendPW.do", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(Model model, String user_mail, String user_name, String user_id, HttpServletResponse response_email) throws Exception{
    	
    	UserVO pw = userService.findpw(new UserVO(user_id, user_name));
                
        if(pw.getUser_mail() != user_mail) {
        	response_email.setContentType("text/html; charset=UTF-8");
            PrintWriter out_email = response_email.getWriter();
            out_email.println("<script>alert('등록된 이메일이 아닙니다.');</script>");
            out_email.flush();
            return "user/findPWPage";
        }else {
	        System.out.println("비번 : " + pw.getUser_pwd());
	        
	        /* 이메일 보내기 */
	        String setFrom = "sjinjin6@naver.com";
	        String toMail = user_mail;
	        String title = "비밀번호 전송 이메일 입니다.";
	        String content = 
	                "홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "비밀번호는 " + pw.getUser_pwd() + "입니다.";
	        /* */
	        try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	       
	        response_email.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_email = response_email.getWriter();
	        out_email.println("<script>alert('이메일로 비밀번호를 발송했습니다.');</script>");
	        out_email.flush();
	        return "user/loginPage";
        }
    }
    
    /**
	 * 이메일로 id전송 
	 * */
    @RequestMapping(value="/sendID.do", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(Model model, String user_mail, String user_name, HttpServletResponse response_email) throws Exception{
    	System.out.println(user_mail);
    	UserVO id = userService.findid(user_mail);
    	System.out.println(id);
    	if(id == null) {
        	response_email.setContentType("text/html; charset=UTF-8");
            PrintWriter out_email = response_email.getWriter();
            out_email.println("<script>alert('등록된 이메일이 아닙니다.');</script>");
            out_email.flush();
            return "user/findIDPage";
        }else {
                
	        /* 인증번호(난수) 생성 (테스트용)
	        Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;
	        System.out.println("인증번호 " + checkNum);
	        */
	        //System.out.println("아이디 : " + id.getUser_id());
	        
	        /* 이메일 보내기 */
	        String setFrom = "sjinjin6@naver.com";
	        String toMail = user_mail;
	        String title = "아이디 전송 이메일 입니다.";
	        String content = 
	                "홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "비밀번호는 " + id.getUser_id() + "입니다.";
	        /* */
	        try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	       
	        response_email.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_email = response_email.getWriter();
	        out_email.println("<script>alert('이메일로 아이디를 발송했습니다.');</script>");
	        out_email.flush();
	        return "user/loginPage";
        }
    }
    
    /**
     * 비밀번호 변경
     * */
    @RequestMapping(value="/modifyPW.do", method=RequestMethod.GET)
    public String modifyPW(Model model, String oldPW, String newPW, String checkPW, HttpServletResponse response, HttpSession session) throws Exception{
    	System.out.println(newPW);
    	
    	UserVO user = (UserVO) session.getAttribute("login");
		
		String user_id = user.getUser_id();
		int user_num = user.getUser_num();
		String user_pwd = user.getUser_pwd();

		boolean pwcheck = user_pwd.equals(oldPW);
		boolean recheck = newPW.equals(checkPW);
		
		String pwPattern = "^(?=.*\\d)(?=.*[~`!@#$%\\^&*()-])(?=.*[a-z])(?=.*[A-Z]).{9,12}$";
		Matcher matcher = Pattern.compile(pwPattern).matcher(newPW);
		pwPattern = "(.)\\1\\1\\1";
		Matcher matcher2 = Pattern.compile(pwPattern).matcher(newPW);
		//출처: https://cofs.tistory.com/358

		System.out.println(user_pwd +" | "+ oldPW + " | " + pwcheck + !matcher.matches() + matcher2.find());
		
		if(!matcher.matches() && matcher2.find()) {
			response.setContentType("text/html; charset=UTF-8");
    		PrintWriter response1 = response.getWriter();
    		response1.println("<script>alert('비밀번호의 양식에 어긋납니다');</script>");
    		response1.flush();
    		return "user/rePWPage";
		}else if(pwcheck && recheck) {
			user_pwd = newPW;
			userService.modifyPw(new UserVO(user_num, user_pwd));
			
	    	response.setContentType("text/html; charset=UTF-8");
			PrintWriter response1 = response.getWriter();
			response1.println("<script>alert('수정 완료');</script>");
			response1.flush();
			
			UserVO vo1 = userService.getUserInfo(user_id);
			model.addAttribute("userInfo", vo1);
			UserVO vo2 = userService.getUserUniv(user_id);
			model.addAttribute("userUniv", vo2);
			model.addAttribute("userCareerList", userService.getUserCareer(user_num));
			List<TalentVO> vo4 = userService.getregisteredTalent(user_num);
			model.addAttribute("registeredTalent", vo4);
			return "user/myPage";
    	}else {
    		response.setContentType("text/html; charset=UTF-8");
    		PrintWriter response1 = response.getWriter();
    		response1.println("<script>alert('비밀번호가 다릅니다');</script>");
    		response1.flush();
    		return "user/rePWPage";
    	}
    }
    
    /**
	 * 이메일 인증 확인
	 * */
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(Model model, @RequestParam("email") String user_mail, HttpServletResponse response_email) throws Exception{
    	System.out.println(user_mail);
                
        /* 인증번호(난수) 생성 (테스트용)*/
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        System.out.println("인증번호 " + checkNum);
        
        //System.out.println("아이디 : " + id.getUser_id());
        
        /* 이메일 보내기 */
        String setFrom = "yunasong517@gmail.com";
        String toMail = user_mail;
        String title = "회원 가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증번호는 " + checkNum + "입니다." +
		        "<br>" + 
	            "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        String num = Integer.toString(checkNum);
        return num;
        
    }
    
    @RequestMapping(value="/regUnivInfo.do", method= RequestMethod.GET)
	public String providerRegPage(Model model, HttpSession session) throws Exception{
		
		UserVO user = (UserVO) session.getAttribute("login");
		
		String user_id = user.getUser_id();
		
		model.addAttribute("userInfo", userService.getUserInfo(user_id));
		model.addAttribute("userVO",new UserVO());
		return "user/providerRegPage";
	}
		
   
    @RequestMapping(value="/regUnivInfo.do", method=RequestMethod.POST)
    public String regUnivInfo(@RequestParam("file") MultipartFile file,@RequestParam("file2") MultipartFile file2,
    		Model model, HttpSession session, @ModelAttribute("userVO") UserVO userVO, HttpServletResponse response) throws Exception{
		
    	
    	//업로드 경로
    	String uploadPath = "F:/jeabbom/workspace/jaebbom/src/main/resources/uploaded/";
    	
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter response1 = response.getWriter();
		response1.println("<script>alert('신청 완료');</script>");
		response1.flush();
    	
        //민증사진
        String fileName = file.getOriginalFilename();
        File target = new File(uploadPath, fileName);
        
        //학생증사진
        String fileName2 = file2.getOriginalFilename();
        File target2 = new File(uploadPath, fileName2);
        
        //경로 확인 및 생성
        if ( ! new File(uploadPath).exists()) {
            new File(uploadPath).mkdirs();
        }
        
        //파일경로에 파일복사
        try {
            FileCopyUtils.copy(file.getBytes(), target);
            FileCopyUtils.copy(file2.getBytes(), target2);
            
        } catch(Exception e) {//에러시  	
            e.printStackTrace();
        }
	       
        //디비에 저장할떄 사용
        //dto.setFileName(fileName);  
        //dto.setFileName2(fileName2); 
        
        userService.regUnivInfo(userVO);
		
        UserVO user = (UserVO) session.getAttribute("login");
		
		String user_id = user.getUser_id();
		int user_num = user.getUser_num();

		UserVO vo1 = userService.getUserInfo(user_id);
		model.addAttribute("userInfo", vo1);
		UserVO vo2 = userService.getUserUniv(user_id);
		model.addAttribute("userUniv", vo2);
		model.addAttribute("userCareerList", userService.getUserCareer(user_num));
		List<TalentVO> vo4 = userService.getregisteredTalent(user_num);
		model.addAttribute("registeredTalent", vo4);
		return "user/myPage";
    }
    
    @RequestMapping(value="/careerRegPage.do", method= RequestMethod.GET)
	public String careerRegPage(Model model, HttpSession session) throws Exception{
		
		UserVO user = (UserVO) session.getAttribute("login");
		
		String user_id = user.getUser_id();
		
		model.addAttribute("userInfo", userService.getUserInfo(user_id));
		model.addAttribute("userVO",new UserVO());
		return "user/careerRegPage";
	}
    
	/**
	* 아직 미완성, 파일 업로드 관련 기능만 처리하면 완성
	*/
    @RequestMapping(value="/regCareer.do", method= RequestMethod.POST)
	public String regCareer(Model model, HttpSession session, @RequestParam("career_name") String career_name,
			MultipartFile file ,HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		UserVO user = (UserVO) session.getAttribute("login");
		String user_id = user.getUser_id();

		// 업로드 파일 저장 경로
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/uploads/careerfile");
		
		// 이름 중복을 방지하기 위해 현재 시각(년월일 포함)을 파일 이름 앞에 붙임
		LocalDateTime now = LocalDateTime.now();
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 HH시 mm분 ss초"));
		String fileName = formatedNow + file.getOriginalFilename();
		File target = new File(uploadPath, fileName);
		
        //경로 확인 및 생성
        if ( !new File(uploadPath).exists()) {
            new File(uploadPath).mkdirs();
        }
		
        //파일경로에 파일복사
        try {
            FileCopyUtils.copy(file.getBytes(), target);
        
        //에러시 
        } catch(Exception e) { 	
            e.printStackTrace();
        }
        
		// 경력 등록을 위한 회원 정보 가져오기
		UserVO career_user = userService.getUserInfo(user_id);
        
		career_user.setCareer_name(career_name);
		career_user.setCareer_photo(fileName);
		
		userService.insertCareer(career_user);
		
		model.addAttribute("userInfo", career_user);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter response1 = response.getWriter();
		response1.println("<script>alert('경력을 등록하였습니다.');</script>");
		response1.flush();
		
		return "user/myPage";
	}
    
}

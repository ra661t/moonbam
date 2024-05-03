package com.moonBam.controller.review;

import com.moonBam.dto.MemberDTO;
import com.moonBam.dto.ReviewDTO;
import com.moonBam.service.ReviewService;
import com.moonBam.service.member.MemberLoginService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;

@Controller
public class WriteReviewController {

	@Autowired
	ReviewService service;

	@Autowired
	MemberLoginService memberLoginService;
	
	// 비동기 리뷰 작성 서블릿
	@RequestMapping(value="my-review", method=RequestMethod.POST)
	@ResponseBody
	public String writeReview(ReviewDTO review, Principal principal, HttpSession session, @RequestParam String contTitle) {
		//System.out.println("contTITLE: " + contTitle);
		// 세션에서 로그인 정보 파싱
		MemberDTO loginUser = memberLoginService.findByPrincipal(principal);
		
		String jsonText = null;
		//로그인 정보가 존재하지 않을 때
		if(loginUser==null) {
			//System.out.println("Asdasdasdas");
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
			
		// 로그인 정보가 존재할 때
		} else {
			
			// DB에 등록, 등록된 review객체 받아옴
			String postText = review.getPostText();
			review.setPostText(postText.replace("<", "&lt;").replace(">", "&gt;").replace("\"","&quot;"));
			review.setPostTitle(contTitle+" 리뷰");
			review = service.writeReview(review);
			
			// javascript에서 텍스트를 JSON.parse()로 json객체로 변환하여 사용할 수 있게하기 위해 하는 작업
			jsonText = "{"
					+ "\"postId\": \""+review.getPostId()+"\","
					+ "\"postText\": \""+review.getPostBoard()+"\","
					+ "\"userId\": \""+review.getUserId()+"\","
					+ "\"contId\": \""+review.getContId()+"\","
					+ "\"postTitle\": \""+review.getPostTitle()+"\","
					+ "\"postDate\": \""+review.getPostDate()+"\","
					+ "\"editDate\": \""+review.getEditDate()+"\","
					+ "\"postText\": \""+review.getPostText()+"\","
					+ "\"nickname\": \""+review.getNickname()+"\""
					+ "}";
		}
		return jsonText;
	}
	
	
}

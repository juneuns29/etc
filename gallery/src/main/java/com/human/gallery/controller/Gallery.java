package com.human.gallery.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.human.gallery.util.PageUtil;
import com.human.gallery.vo.GalleryVO;

/**
 * 이 클래스는 겔러리 관련 요청을 처리해줄 컨트롤러 클래스
 * @author 	전은석
 * @since	2024.07.23
 * @version	v.1.0
 * 
 * 			작업이력
 * 					2024.07.23	- 담당자: 전은석
 * 								클래스 제작
 * 								리스트보기 요청처리
 *
 */

@Controller
@RequestMapping("/gallery")
public class Gallery {
	
	@RequestMapping("/galList.gal")
	public ModelAndView galList(HttpSession session, ModelAndView mv, 
											PageUtil page, GalleryVO gVO) {
		String view = "gallery/gallery";
		
		// 데이터 셋팅
		mv.addObject("LIST", gVO.getList());
		mv.addObject("PAGE", page);
		
		// 뷰 셋팅
		mv.setViewName(view);
		return mv;
	}
}

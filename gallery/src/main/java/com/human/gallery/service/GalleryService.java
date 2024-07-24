package com.human.gallery.service;

import java.util.ArrayList;
import java.util.List;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.human.gallery.dao.GalleryDao;
import com.human.gallery.util.PageUtil;
import com.human.gallery.vo.GalleryVO;

@Service
@Aspect
public class GalleryService {
	@Autowired
	 GalleryDao gDao;
	
	/**
	 * 게시글 초기화 유효성검사
	 */
	@Before("execution(* com.human.gallery.controller.Gallery.galList(..))")
	public void galleryInitCheck(JoinPoint join) {
		// 초기화 체크
		int cnt = gDao.getCnt();
		if(cnt == 0) {
			insertGallery();
		}
		
		// pageing 처리
		PageUtil page = (PageUtil) join.getArgs()[2];
		if(page.getNowPage() == 0) {
			page.setNowPage(1);
		}
		
		page.setTotalCount(gDao.getTotal());
		page.setPage();
		
		// 리스트 꺼내오기
		List<GalleryVO> list = gDao.selList(page);
		
		// vo 꺼내기
		GalleryVO vo = (GalleryVO) join.getArgs()[3];
		// vo 에 리스트 셋팅
		vo.setList(list);
	}
	
	/**
	 * 기본 게시글 추가 처리함수
	 */
	@Transactional
	public void insertGallery() {
		List<GalleryVO> list = getInitList();
		
		for(int i = 0 ; i < list.size(); i++ ) {
			// 게시글 추가
			gDao.addGallery(list.get(i));
			// 사진 정보 입력
			gDao.addPhoto(list.get(i));
		}
	}
	
	/**
	 * 초기화 데이터
	 */
	public List<GalleryVO> getInitList(){
		ArrayList<GalleryVO> list = new ArrayList<GalleryVO>();
		
		String[] titleArr = {
			"Le French", "The Perfect Sandwich, A Real Classic",
			"Salmon For Your Skin", "All I Need Is a Popsicle",
			"Once Again, Robust Wine and Vegetable Pasta",
			"Cherries, interrupted", "Let Me Tell You About This Steak", 
			"The Perfect Sandwich, A Real NYC Classic"
		};
		
		String[] bodyArr = {
				"Lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.",
				"Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.",
				"Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.",
				"Lorem ipsum text praesent tincidunt ipsum lipsum.",
				"Lorem ipsum text praesent tincidunt ipsum lipsum.",
				"Lorem ipsum text praesent tincidunt ipsum lipsum.\r\n" + "\r\n" + "What else?",
				"Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum",
				"Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum."
		};
		
		String[] photos = {
			"croissant.jpg", "sandwich.jpg", "salmon.jpg", "popsicle.jpg", 
			"wine.jpg", "cherries.jpg", "steak.jpg", "sandwich.jpg"
		};
		
		String[] snames = {
				"croissant.jpg", "sandwich.jpg", "salmon.jpg", "popsicle.jpg", 
				"wine.jpg", "cherries.jpg", "steak.jpg", "sandwich(1).jpg"
		};
		
		String[] writers = {
			"euns", "jennie", "mj", "jisoo",
			"loid", "ania", "iu", "bond"
		};
		
		// 8개의 게시글 완성후 추가
		for(int i = 0 ; i < 8 ; i++ ) {
			GalleryVO vo = new GalleryVO();
			
			vo.setTitle(titleArr[i]);
			vo.setBody(bodyArr[i]);
			vo.setOriname(photos[i]);
			vo.setSavename(snames[i]);
			vo.setId(writers[i]);
			
			list.add(vo);
		}
		return list;
	}
}

package com.human.gallery.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.human.gallery.util.PageUtil;
import com.human.gallery.vo.GalleryVO;

/**
 * 이 클래스는 겔리리 관련 데이터베이스 작업 전담 클래스
 * @author	전은석
 * @since	2024.07.23
 * @version	v.1.0
 * 
 * 			작업이력
 * 					2024.07.23	- 담당자 : 전은석
 * 								클래스제작
 * 								게시글 입력 처리
 * 								첨부파일 입력 처리
 *
 */


public class GalleryDao {
	@Autowired
	SqlSessionTemplate session;
	
	/**
	 * 숨긴파일 포함 총 게시글 수 조회 전담 처리함수
	 */
	public int getCnt() {
		return session.selectOne("gSQL.getCount");
	}
	
	/**
	 * 총 게시글 리스트 카운트 조회 전담 처리함수
	 */
	public int getTotal() {
		return session.selectOne("gSQL.getTotal");
	}
	
	/**
	 * 게시글 리스트 조회 전담 처리함수
	 */
	public List<GalleryVO> selList(PageUtil page){
		return session.selectList("gSQL.selList", page);
	}
	
	/**
	 * 게시글 등록 처리함수
	 */
	public int addGallery(GalleryVO gVO) {
		return session.insert("gSQL.addGallery", gVO);
	}
	
	/**
	 * 첨부파일 등록 처리함수
	 */
	public int addPhoto(GalleryVO gVO) {
		return session.insert("gSQL.addPhoto", gVO);
	}
}

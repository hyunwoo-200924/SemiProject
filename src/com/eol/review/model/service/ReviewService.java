package com.eol.review.model.service;

import static com.eol.common.JDBCTemplate.close;
import static com.eol.common.JDBCTemplate.commit;
import static com.eol.common.JDBCTemplate.getConnection;
import static com.eol.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.eol.product.model.vo.Product;
import com.eol.review.model.dao.ReviewDao;
import com.eol.review.model.vo.Review;

public class ReviewService {
	
	private ReviewDao dao=new ReviewDao();
	
	public Review selectReview(int no) {
		Connection conn=getConnection();
		Review r=dao.selectReview(conn,no);
		close(conn);
		
		return r;
	}

	public int insertReview(Review r, int odoNo, int odpNo, String pName, int mNo) {
		Connection conn=getConnection();
		int result=dao.insertReview(conn,r, odoNo, odpNo, pName, mNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;	
	}

	public List<Review> reviewList(int cPage2, int numPerPage2, int mNo) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		List<Review> list=dao.reviewList(conn,cPage2,numPerPage2, mNo);
		close(conn);
		return list;
	}
	
	public List<Review> reviewList2(int mNo) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		List<Review> list=dao.reviewList2(conn, mNo);
		close(conn);
		return list;
	}

	public int reviewCount() {
		Connection conn=getConnection();
		int count=dao.reviewCount(conn);
		close(conn);
		return count;
	}
	
	public int reviewPullCount(int mNo) {
		Connection conn=getConnection();
		int count=dao.reviewPullCount(conn, mNo);
		close(conn);
		return count;
	}
	
	public List<Review> reviewPullList(int cPage, int numPerPage, int mNo) {
		//p_no o_no 가져오기
		Connection conn = getConnection();
		List<Review> list = dao.reviewPullList(conn,cPage,numPerPage, mNo);
		close(conn);
		return list;
	}
	
	
	public int reviewDelete(Review r, int oNo, int pNo) {
		Connection conn = getConnection();
		int result = dao.reviewDelete(conn, r, oNo, pNo);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int updatePoint(int mPoint, int mNo) {
		Connection conn = getConnection();
		int result = dao.updatePoint(conn, mPoint, mNo);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int updateReview(int rNo, String rTitle, String rContent, String mImage) {
		Connection conn = getConnection();
		int result = dao.updateReview(conn, rNo, rTitle, rContent, mImage);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Review> selectDate(int cPage, int numPerPage, String ydate, int mNo) {
		Connection conn=getConnection();
		List<Review> list=dao.selectDate(conn,cPage,numPerPage, ydate, mNo);
		close(conn);
		
		return list;
	}
}

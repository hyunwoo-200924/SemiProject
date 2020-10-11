package com.eol.review.model.service;

import static com.eol.common.JDBCTemplate.close;
import static com.eol.common.JDBCTemplate.commit;
import static com.eol.common.JDBCTemplate.getConnection;
import static com.eol.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

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

	public int insertReview(Review r) {
		Connection conn=getConnection();
		int result=dao.insertReview(conn,r);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;	
	}

	public List<Review> reviewList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		List<Review> list=dao.reviewList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int reviewCount() {
		Connection conn=getConnection();
		int count=dao.reviewCount(conn);
		close(conn);
		return count;
	}
	
//	public int[] pullReview(int mNo) {
//		//p_no o_no 가져오기
//		Connection conn = getConnection();
//		int[] nResult = dao.pullReview(conn,mNo);
//		close(conn);
//		return nResult;
//	}
}

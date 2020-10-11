package com.eol.qna.model.service;

import static com.eol.common.JDBCTemplate.close;
import static com.eol.common.JDBCTemplate.commit;
import static com.eol.common.JDBCTemplate.getConnection;
import static com.eol.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.eol.qna.model.dao.QnaDao;
import com.eol.qna.model.vo.Paging;
import com.eol.qna.model.vo.Qna;

public class QnaService {

	private QnaDao qDao = new QnaDao();

	// 1:1문의 등록하기
	public int insertQna(Qna q) {

		Connection conn = getConnection();

		int result = qDao.insertQna(conn, q);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);
		System.out.println(2);
		return result;

	}

	// 1:1 문의 리스트 가져오기
	public List<Qna> selectQna(Paging pg, int mNo) {

		Connection conn = getConnection();

		List<Qna> list = qDao.selectQna(conn, pg, mNo);

		System.out.println("이거다음");
		for(Qna a : list) {
			
			System.out.println(list.get(0).getqStatus());
		}
		// 답변 가져오기 
		for(Qna q : list) {
			System.out.println(q.getqStatus());
			 if(q.getqStatus().equals("Y")) {//답변이 달렸다면
			  
				 String answer = qDao.selectAnswer(conn, q.getqNo()); 
				 System.out.println(answer);
				 String answerResult = "";
				 if(answer != null && answer.contains("\r\n")) {
					 answerResult = answer.replace("\r\n", "<br>"); 
					 
				 } else {
					 answerResult = answer;
				 }
				 q.setAnswerResult(answerResult);
			 
			 }
		 
		}
		 

		close(conn);

		return list;
	}

	// 1:1 문의 지우기
	public int deleteQna(int qNo) {
		Connection conn = getConnection();

		int result = qDao.deleteQna(conn, qNo);

		close(conn);

		return result;
	}

	// 1:1문의 갯수
	public int getListCount(int mNo) {
		Connection conn = getConnection();

		int result = qDao.getListCount(conn, mNo);

		close(conn);

		return result;
	}
}

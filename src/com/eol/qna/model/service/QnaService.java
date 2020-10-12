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

		if (result > 0) commit(conn);
		else rollback(conn);

		close(conn);
		System.out.println(2);
		return result;

	}

	// 1:1 문의 리스트 가져오기
	public List<Qna> selectQna(Paging pg, int mNo) {

		Connection conn = getConnection();

		List<Qna> list = qDao.selectQna(conn, pg, mNo);

		// 답변 가져오기 
		for(Qna q : list) {

			//질문내용 엔터처리
			String qContentOrigin = q.getqContent();
			
			if(qContentOrigin != null && qContentOrigin.contains("\r\n")) {
				q.setqContent(qContentOrigin.replace("\r\n", "<br>"));
			}
			
			 if(q.getqStatus().equals("Y")) {//답변이 달렸다면
			  
				 String answer = qDao.selectAnswer(conn, q.getqNo()); 
				 
				 //대답 엔터처리
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

	//1:1 문의 수정하기 눌렀응ㄹ 때 내용 가져오기
	public Qna selectQuestionView(int qNo) {
		Connection conn = getConnection();
		
		Qna q = qDao.selectQuestionView(conn, qNo);
		
		close(conn);
		
		return q;
	}

	//1:1문의 수정하기
	public int updateQuestion(Qna q) {
		
		Connection conn = getConnection();

		int result = qDao.updateQuestion(conn, q);

		if (result > 0) commit(conn);
		else rollback(conn);

		close(conn);

		return result;
		
	}
}

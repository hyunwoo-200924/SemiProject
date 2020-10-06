package com.eol.notice.service;

import java.sql.Connection;
import java.util.List;

import com.eol.notice.dao.NoticeDao;
import com.eol.notice.model.vo.Notice;

import static com.eol.common.JDBCTemplate.getConnection;
import static com.eol.common.JDBCTemplate.close;
import static com.eol.common.JDBCTemplate.commit;
import static com.eol.common.JDBCTemplate.rollback;
public class NoticeService {
	
	
	NoticeDao dao=new NoticeDao();
	
	public Notice selectNoticeOne(int no) {
		Connection conn=getConnection();
		Notice n=dao.selectNoticeOne(conn,no);
		close(conn);
		
		return n;
	}

	public int inserNotice(Notice n) {
		Connection conn=getConnection();
		int result=dao.insertNotice(conn,n);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;	
		
	}

	public List<Notice> noticeList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		List<Notice> list=dao.noticeList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int noticeCount() {
		Connection conn=getConnection();
		int count=dao.noticeCount(conn);
		close(conn);
		
		return count;
	}

}

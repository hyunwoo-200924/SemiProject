package com.eol.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.eol.review.model.service.ReviewService;
import com.eol.review.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class noticeWriteEndServlet
 */
@WebServlet("/review/reviewWriteEnd")
public class ReviewWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	//.쿨라이언트가 보낸 파일저장하기
		//1.클라이언트가 보낸요청이 multipart으로 요청한건지 확인하기
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "리뷰작성오류![form:enctype에러관리자에게 문의하세요");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			System.out.println("여기까지는 가나??");
			return;
		}
	
		//정상적인 multipart방식으로 요청이 들어오면 파일을 업로드하고 db에 저장하기
		//cos.jar를 이용해서 파일을 업로드한다.
		//1.파일업로드위치를 선정! 절대경로로
		String path=getServletContext().getRealPath("/upload/review");
		//2.업로드파일의 최대크기를 설정
		int maxSize=1024*1024*10;//10MB
		//3.파일명에 대한 인코딩값을 설정(utf-8)
		String encode="UTF-8";
		//4.파일명을 재정의할수있는 객체 (메소드)대입
		//cos.jar에서 기본제공하는 파일명rename객체가 있음
		DefaultFileRenamePolicy rename=new DefaultFileRenamePolicy();
		
		//cos.jar에서 제공하는 MultipartRequest객체를 생성하면 업로드가 됨
		
		MultipartRequest mr= new MultipartRequest(request, path,maxSize,encode,rename);
		//MultipartRequest객체를 생성후에는 파라미터값을 MultipartRequest로 가져와야함
		//HttpServletRequest는 사용하지않음
		
		//클라리언트에서 M_NO 가져오기
		int mNo = Integer.parseInt(mr.getParameter("mNo"));
		
//		int[] nResult = new ReviewService().pullReview(mNo);
		
		Review r=new Review();
		r.setrTitle(mr.getParameter("reviewTitle"));
		r.setrWriter(mr.getParameter("reviewWriter"));
		r.setrContent(mr.getParameter("reviewContent"));
		
		//파일이름은 rename,되어있는 파일이름을 가져와야하기때문에
		//mr.getFilesystemName("name")메소드를이용
		//n.setFilePath(request.getParameter("upload")
		
		int result=new ReviewService().insertReview(r);
		
		if(result > 0) {
			System.out.println("인서트 성공");
			request.getRequestDispatcher("views/review/reviewList.jsp").forward(request, response);
		}else {
			
			String msg="등록 실패";
			String loc="/views/review/reviewList.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc",loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

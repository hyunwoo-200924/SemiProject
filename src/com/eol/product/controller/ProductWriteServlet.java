package com.eol.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.eol.product.model.vo.Product;
import com.eol.product.service.ProductService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ProductWriteServlet
 */
@WebServlet("/product/productWrite")
public class ProductWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String fileName=request.getParameter("file");
		//1파일의 경로를 가져옴(절대경로)
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg","공지사항작성오류![form:enctype에러관리자에게 문의하세요!]");
			request.setAttribute("loc","/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		//정상적인 multipart방식으로 요청이 오면 파일을 업로드하고 db에 저장하기
		//cos.jar를 이용해서 파일을 업로드한다.
		//1.파일 업로드위치를 선정! 절대경로로
		String path=getServletContext().getRealPath("/upload/notice");
		//2.업로드파일의 최대크기를 설정
		int maxSize=1024*1024*10;//10MB
		//3.파일명에 대한 인코딩값을 설정(UTF-8)
		String encode="UTF-8";
		//4.파일명을 재정의할수있는 객체 (메소드).대입
		//COS.JAR에서 기본제공하는 파일명 RENAME객체가  있음.
		DefaultFileRenamePolicy rename=new DefaultFileRenamePolicy();
		
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,encode,rename);
		//MultipartRequest객체를 생성후에는 파라미터 값을 MulipartRequest로 가져와야함.
		//httpServletREquest는 사용하지않음
		
		
		Product p=new Product();
		p.setpName(mr.getParameter("pName"));
		p.setpPrice(Integer.parseInt(mr.getParameter("pPrice")));
		p.setpDiscount(Integer.parseInt(mr.getParameter("pDiscount")));
		p.setpStock(Integer.parseInt(mr.getParameter("pStock")));
		p.setpServing(Integer.parseInt(mr.getParameter("pServing")));
		p.setpCooktime(Integer.parseInt(mr.getParameter("pCooktime")));
		p.setpReadytime(Integer.parseInt(mr.getParameter("pReadytime")));
		p.setpTaste(Integer.parseInt(mr.getParameter("pTaste")));
		
		p.setpImage1(mr.getFilesystemName("upload"));
		p.setpImage2(mr.getFilesystemName("upload"));
		p.setpImage3(mr.getFilesystemName("upload"));
		p.setpVideo(mr.getFilesystemName("upload"));
		p.setpDetailImage1(mr.getFilesystemName("upload"));
		p.setpDetailImage2(mr.getFilesystemName("upload"));
		p.setpDetailImage3(mr.getFilesystemName("upload"));
		
		p.setpDetailTitle1(mr.getParameter("pDetailTitle1"));
		p.setpDetailTitle2(mr.getParameter("pDetailTitle2"));
		p.setpDetailMain(mr.getParameter("pDetailMain"));
		p.setpDetailContent1(mr.getParameter("pDetailContent1"));
		p.setpDetailContent2(mr.getParameter("pDetailContent2"));
		
		p.setpRecipeImage1(mr.getParameter("pRecipeImage1"));
		p.setpRecipeImage2(mr.getParameter("pRecipeImage2"));
		p.setpRecipeImage3(mr.getParameter("pRecipeImage3"));
		p.setpRecipeImage4(mr.getParameter("pRecipeImage4"));
		
		p.setpRecipeContent1(mr.getParameter("pRecipeConten1"));
		p.setpRecipeContent2(mr.getParameter("pRecipeConten2"));
		p.setpRecipeContent3(mr.getParameter("pRecipeConten3"));
		p.setpRecipeContent4(mr.getParameter("pRecipeConten4"));
		
		int result = new ProductService().insertProduct(p);
		
		String msg="";
		String loc="/product/productWrite";
		msg=result>0?"상품등록 성공":"상품등록실패";
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

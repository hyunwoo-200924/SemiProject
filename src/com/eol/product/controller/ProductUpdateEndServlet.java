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
 * Servlet implementation class ProductUpdateServlet
 */
@WebServlet("/product/productUpdateEnd")
public class ProductUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(""+ServletFileUpload.isMultipartContent(request));
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg","등록작성오류![form:enctype에러관리자에게 문의하세요!]");
			request.setAttribute("loc","/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		//정상적인 multipart방식으로 요청이 오면 파일을 업로드하고 db에 저장하기
		//cos.jar를 이용해서 파일을 업로드한다.
		//1.파일 업로드위치를 선정! 절대경로로
		String path=getServletContext().getRealPath("/upload/product");//업로드되서 저장되는위치
		//2.업로드파일의 최대크기를 설정
		
//		File dir=new File(path);
//		if(!dir.exists())dir.mkdirs();
		int maxSize=1024*1024*100;//10MB
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
		
		p.setpImage1(mr.getFilesystemName("pImage1"));
		p.setpImage2(mr.getFilesystemName("pImage2"));
		p.setpImage3(mr.getFilesystemName("pImage3"));
		p.setpVideo(mr.getFilesystemName("pVideo"));
		p.setpDetailImage1(mr.getFilesystemName("pDetailImage1"));
		p.setpDetailImage2(mr.getFilesystemName("pDetailImage2"));
		p.setpDetailImage3(mr.getFilesystemName("pDetailImage3"));
		
		p.setpDetailTitle1(mr.getParameter("pDetailTitle1"));
		p.setpDetailTitle2(mr.getParameter("pDetailTitle2"));
		p.setpDetailMain(mr.getParameter("pDetailMain"));
		p.setpDetailContent1(mr.getParameter("pDetailContent1"));
		p.setpDetailContent2(mr.getParameter("pDetailContent2"));
		
		p.setpRecipeImage1(mr.getFilesystemName("pRecipeImage1"));
		p.setpRecipeImage2(mr.getFilesystemName("pRecipeImage2"));
		p.setpRecipeImage3(mr.getFilesystemName("pRecipeImage3"));
		p.setpRecipeImage4(mr.getFilesystemName("pRecipeImage4"));
	
		
		p.setpRecipeContent1(mr.getParameter("pRecipeContent1"));
		p.setpRecipeContent2(mr.getParameter("pRecipeContent2"));
		p.setpRecipeContent3(mr.getParameter("pRecipeContent3"));
		p.setpRecipeContent4(mr.getParameter("pRecipeContent4"));
	
		int result=new ProductService().updateProduct(p);
		System.out.println("p-dao가기전:여기오류??"+result);
		String msg="";
		String loc="";
		String path1="";
		if(result>0) {
			//선택한 공지사항이 삭제됨.
			msg="상품이 수정되었습니다";
			
			request.setAttribute("msg",msg);
		
			response.sendRedirect(request.getContextPath()+"/views/product/productUpdate.jsp");
		}else {
			msg="상품수정이 실패하였습니다.";
			request.setAttribute("result",result);
			path1="/views/product/productUpdate.jsp";
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

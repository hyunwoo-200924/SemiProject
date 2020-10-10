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
@WebServlet("/product/productUpdate")
public class ProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		if(!ServletFileUpload.isMultipartContent(request)) {
//			request.setAttribute("msg","등록작성오류![form:enctype에러관리자에게 문의하세요!]");
//			request.setAttribute("loc","/");
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//			return;
//		}
//		
//		//정상적인 multipart방식으로 요청이 오면 파일을 업로드하고 db에 저장하기
//		//cos.jar를 이용해서 파일을 업로드한다.
//		//1.파일 업로드위치를 선정! 절대경로로
//		String path=getServletContext().getRealPath("/upload/product");//업로드되서 저장되는위치
//		//2.업로드파일의 최대크기를 설정
//		
////		File dir=new File(path);
////		if(!dir.exists())dir.mkdirs();
//		int maxSize=1024*1024*100;//10MB
//		//3.파일명에 대한 인코딩값을 설정(UTF-8)
//		String encode="UTF-8";
//		//4.파일명을 재정의할수있는 객체 (메소드).대입
//		
//		
//		
//		//COS.JAR에서 기본제공하는 파일명 RENAME객체가  있음.
//		DefaultFileRenamePolicy rename=new DefaultFileRenamePolicy();
//		
//		MultipartRequest mr=new MultipartRequest(request,path,maxSize,encode,rename);
//		//MultipartRequest객체를 생성후에는 파라미터 값을 MulipartRequest로 가져와야함.
//		//httpServletREquest는 사용하지않음
//		
		
		
		Product p=new Product();
		p.setpName(request.getParameter("pName"));
		p.setpPrice(Integer.parseInt(request.getParameter("pPrice")));
		p.setpDiscount(Integer.parseInt(request.getParameter("pDiscount")));
		p.setpStock(Integer.parseInt(request.getParameter("pStock")));
		p.setpServing(Integer.parseInt(request.getParameter("pServing")));
		p.setpCooktime(Integer.parseInt(request.getParameter("pCooktime")));
		p.setpReadytime(Integer.parseInt(request.getParameter("pReadytime")));
		p.setpTaste(Integer.parseInt(request.getParameter("pTaste")));
		
		p.setpImage1(request.getParameter("pImage1"));
		p.setpImage2(request.getParameter("pImage2"));
		p.setpImage3(request.getParameter("pImage3"));
		p.setpVideo(request.getParameter("pVideo"));
		p.setpDetailImage1(request.getParameter("pDetailImage1"));
		p.setpDetailImage2(request.getParameter("pDetailImage2"));
		p.setpDetailImage3(request.getParameter("pDetailImage3"));
		
		p.setpDetailTitle1(request.getParameter("pDetailTitle1"));
		p.setpDetailTitle2(request.getParameter("pDetailTitle2"));
		p.setpDetailMain(request.getParameter("pDetailMain"));
		p.setpDetailContent1(request.getParameter("pDetailContent1"));
		p.setpDetailContent2(request.getParameter("pDetailContent2"));
		
		p.setpRecipeImage1(request.getParameter("pRecipeImage1"));
		p.setpRecipeImage2(request.getParameter("pRecipeImage2"));
		p.setpRecipeImage3(request.getParameter("pRecipeImage3"));
		p.setpRecipeImage4(request.getParameter("pRecipeImage4"));
	
		
		p.setpRecipeContent1(request.getParameter("pRecipeContent1"));
		p.setpRecipeContent2(request.getParameter("pRecipeContent2"));
		p.setpRecipeContent3(request.getParameter("pRecipeContent3"));
		p.setpRecipeContent4(request.getParameter("pRecipeContent4"));
	
		int result=new ProductService().updateProduct(p);
		
		String msg="";
		String loc="";
		String path1="";
		if(result>0) {
			//선택한 공지사항이 삭제됨.
			msg="상품이 수정되었습니다";
			loc="/product/productList";
			path1="/views/common/msg.jsp";
			request.setAttribute("msg",msg);
			request.setAttribute("loc",loc);
		}else {
			request.setAttribute("product",p);
			path1="/views/product/productRegister.jsp";
		}
		request.getRequestDispatcher(path1).forward(request, response);
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc","/product/productList.jsp");
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

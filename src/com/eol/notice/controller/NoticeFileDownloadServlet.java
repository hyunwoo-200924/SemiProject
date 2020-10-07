package com.eol.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeFileDownloadServlet
 */
@WebServlet("/notice/noticeFileDownload")
public class NoticeFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFileDownloadServlet() {
        super();

    
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fileName=request.getParameter("fileName");
		//파일을 다운로드 한다는 의미는 서버에 있는 파일 클라이언트쪽으로 전송해준다는데
		//1.파일의 경로를 가져옴
		String filePath=getServletContext().getRealPath("/upload/notice");
		//2.파일을 inputStream으로 가져옴
		File f=new File(filePath+"/"+fileName);
		//f.delete();
		//inputStream을 통해서 파이을 서버ram으로 가져옴
		FileInputStream fis=new FileInputStream(f);
		BufferedInputStream bis=new BufferedInputStream(fis);
		//2-1파일명을 위한 인코딩 처리
		//브라우저별로 파일명에 대한 인코딩작업을딸리해줘야함.
		String fileReName="";
		String header=request.getHeader("user-agent");
		boolean isMSIE=header.indexOf("MSIE") != -1|| header.indexOf("Trident")!=-1;
		if(isMSIE) {
			fileReName=URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+","%20");
		}else {
			fileName=new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
		}
		//3.파일을 브라우저에게 바이트 단위로 전송함.
		//3-1응답타입을 설정함.
		
		response.setContentType("application/octet-stream");//파일을 보낸다는 MISE타입을 설정
		response.setHeader("Content-Disposition","attachment;filename="+fileReName);
		//다운로드 방식, 다운롣 파일이름설정
		//3-2파일을 전송할 OutputStream을 가져옴
		ServletOutputStream sos=response.getOutputStream();
		BufferedOutputStream bos=new BufferedOutputStream(sos);
		
		int read=-1;
		while((read=bis.read())!=-1) {
			bos.write(read);
		}
		bos.close();//bufferoutputStream을 닫아줌
		bis.close();//bufferoutputStream을 닫아줌
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

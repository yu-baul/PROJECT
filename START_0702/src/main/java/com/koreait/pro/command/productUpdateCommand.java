package com.koreait.pro.command;

import java.io.File;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.pro.dao.ProductDAO;

public class productUpdateCommand implements ProCommand {

   @Override
   public void execute(SqlSession sqlSession, Model model) {
      
      Map<String, Object> map = model.asMap();
      MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
      
      int p_No = Integer.parseInt(request.getParameter("p_No"));
      String p_Name = request.getParameter("p_Name");
      String p_Cartegory = request.getParameter("p_Cartegory");
      String p_Content = request.getParameter("p_Content");
      int p_Price = Integer.parseInt(request.getParameter("p_Price"));
      
      MultipartFile p_Img_Path = request.getFile("p_Img_Path");
      
      // 업로드 할 파일의 이름 /  확장자 분리하기
      // 동일한 이름을 가진 파일이 업로드 되지 않도록 직접 파일 이름을 수정해서 올린다.
      
      // 업로드 된 원래 파일명
      String originFilename = p_Img_Path.getOriginalFilename();
      
      // originFilename 에서 확장자 분리
      String extName = originFilename.substring(originFilename.lastIndexOf(".") + 1);
      
      // 저장할 파일 이름 만들기 / 업로드 / 파일이름 DB 에 저장
      String saveFilename = null;
      try {
         // 1) 저장할 파일 이름 만들기
         // 파일명 중복 방지 대책으로 서버에 저장할 파일의 이름에 업로드 시간을 추가한다.
         // 서버에 저장될 파일명 : 원래파일명_업로드시간.확장자
         // 원래파일명 : originFilename.substring(0, originFilename.lastIndexOf("."))
         // 업로드시간 : System.currentTimeMillis()
         saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) +
                     "_" +
                     System.currentTimeMillis() +
                     "." + extName;
         
         // 2) 업로드
         
         // 2-1) 파일이 저장될 서버 내 경로(/resources/storage)를 알아낸다.
         String realPath = request.getSession().getServletContext().getRealPath("/resources/storage");
         
         // 2-2) (/resources/storage) 경로가 존재하지 않으면 필요한 경로(디렉토리)를 만든다.
         // new File(경로) : 경로로 디렉토리만 사용되면 디렉토리로 인식한다.
         File directory = new File(realPath);
         if( !directory.exists() ) {
            directory.mkdir();  // mkdirs (하위 디렉토리를 모두 만든다.)
         }
         
         // 2-3) 서버에 저장할 파일을 만든다.
         File saveFile = new File(realPath, saveFilename);  // (경로, 파일명)
         
         // 2-4) 업로드한다.
         p_Img_Path.transferTo(saveFile);
         
         // 3) DB 에 저장   
         ProductDAO pDAO = sqlSession.getMapper(ProductDAO.class);
         pDAO.ProductUpdate(p_No, p_Name, p_Cartegory, p_Content, p_Price, saveFilename);
         
         model.addAttribute("p_No", p_No);
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      
      

   }

}
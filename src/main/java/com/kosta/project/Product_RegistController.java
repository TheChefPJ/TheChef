package com.kosta.project;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.kosta.project.dao.IFarmProductDao;
import com.kosta.project.dao.IRTPdao;
import com.kosta.project.dto.FarmProductDto;
import com.kosta.project.dto.RTPdto;

@Controller
public class Product_RegistController {
   
   @Autowired
   private SqlSession sqlSession;
   
   
   //레시피테마insert//////////////////////////////////////////////////////////////////////////////////////////////////   
         @RequestMapping("/recipeRegister")
         public String RTP_writeView(Locale locale, Model model,HttpServletRequest request) {
            System.out.println("/recipeRegister()");
            return "back.storeManage.recipeRegister";
         }
         @RequestMapping("/RTP_write")
         public String RTP_write(HttpServletRequest request, Model model, RTPdto dto, Principal principal){
            System.out.println("RTP_write()");
            dto.setId(principal.getName());
            //p_regdate는 insert할때 직접 sysdate로 넣는다.
            
            List<CommonsMultipartFile> files = dto.getFiles();
            List<String> fileNames = new ArrayList<String>();
            if (files != null && files.size() > 0) {
               // 이 경우라면 최소 한개는 파일첨부
               
               for (CommonsMultipartFile multipartFile : files) {
                  //파일명 고유한 값 넣어주기 위해 파일명에 현재시간 넣기
                  Calendar calendar = Calendar.getInstance();
                  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
                  String fname = dateFormat.format(calendar.getTime())+multipartFile.getOriginalFilename();
                  String path = request.getSession().getServletContext().getRealPath("/upload/RTP");
                  String fullpath = path + "\\" + fname;
                  if (!fname.equals("")) {
                     // 서버에 물리적 경로 파일쓰기작업
                     try {
                        FileOutputStream fs = new FileOutputStream(fullpath);
                        fs.write(multipartFile.getBytes());
                        fs.close();
                     } catch (IOException e) {
                        e.printStackTrace();
                     }
                  }
                  fileNames.add(fname); // 파일의 이름만 별도 관리
               }
               // DB insert (파일명)
               dto.setP_contentFile(fileNames.get(0));
               dto.setP_thumbFile(fileNames.get(1));
            }
            IRTPdao dao = sqlSession.getMapper(IRTPdao.class);
            dao.RTP_write(dto); // 레시피/테마 테이블에 insert
            return "redirect:/";
         }//RTP_write() end
         
   //레시피테마 delete ///////////////////////////////////////////////////////////////////////////////////////////
         @RequestMapping("/RTP_delete")
         public String RTP_delete(HttpServletRequest request, Model model){
            
            System.out.println("RTP_delete("+request.getParameter("p_no")+")"); // RTP_delete(p_no)
            String p_no = request.getParameter("p_no"); // id값 id변수에 저장
            
            // p_no에 해당하는 파일 실제 경로에서 삭제
            IRTPdao dao = sqlSession.getMapper(IRTPdao.class);
            RTPdto dto = new RTPdto();
            dto = dao.RTP_selectAll(p_no);
            String p_contentFile = dto.getP_contentFile();// 삭제할 p_contentFile명
            String p_thumbFile = dto.getP_thumbFile();// 삭제할 p_thumbFile명
            String path = request.getSession().getServletContext().getRealPath("/upload/RTP");//삭제할 파일 경로
            String fullpath1 = path + "\\" + p_contentFile;
            String fullpath2 = path + "\\" + p_thumbFile;
            File file = new File(fullpath1);
            if(file.exists()==true) file.delete();
            file = new File(fullpath2);
            if(file.exists()==true) file.delete();

            // p_no에 해당하는 데이터 삭제
            dao.RTP_delete(p_no); // 레시피/테마 테이블에서 삭제 delete      
            
            model.addAttribute("searchRange",request.getParameter("searchRange"));
            model.addAttribute("searchNo",request.getParameter("searchNo"));
            model.addAttribute("searchTitle",request.getParameter("searchTitle"));
            model.addAttribute("searchWriter",request.getParameter("searchWriter"));
            model.addAttribute("searchCategory",request.getParameter("searchCategory"));
            model.addAttribute("searchKeyword",request.getParameter("searchKeyword"));
            model.addAttribute("startRegdate",request.getParameter("startRegdate"));
            model.addAttribute("endRegdate",request.getParameter("endRegdate"));
            
            return "redirect:/productSelect_Modify";
         }//RTP_delete() end
   //레시피 테마 update//////////////////////////////////////////////////////////////////////////////////////////
         @RequestMapping("/RTP_updateView")
         public String RTP_updateView(Model model, HttpServletRequest request) {
            System.out.println("RTP_updateView()");
            IRTPdao dao = sqlSession.getMapper(IRTPdao.class);
            RTPdto dto = dao.RTP_selectAll(request.getParameter("p_no")); // p_no에 해당하는 데이터 뽑기
            model.addAttribute("updateList", dto);  // 뽑은 데이터 updateList라는 이름으로 보내기
            
            model.addAttribute("searchRange",request.getParameter("searchRange"));
            model.addAttribute("searchNo",request.getParameter("searchNo"));
            model.addAttribute("searchTitle",request.getParameter("searchTitle"));
            model.addAttribute("searchWriter",request.getParameter("searchWriter"));
            model.addAttribute("searchCategory",request.getParameter("searchCategory"));
            model.addAttribute("searchKeyword",request.getParameter("searchKeyword"));
            model.addAttribute("startRegdate",request.getParameter("startRegdate"));
            model.addAttribute("endRegdate",request.getParameter("endRegdate"));
            
            return "back.storeManage.recipeUpdate";
         }
         @RequestMapping("/RTP_update")
         public String RTP_update(HttpServletRequest request, RTPdto dto, Model model){
            System.out.println("RTP_update()");
            
            List<CommonsMultipartFile> files = dto.getFiles();
            List<String> fileNames = new ArrayList<String>();
            if (files != null && files.size() > 0) {
               // 이 경우라면 최소 한개는 파일첨부
               for (CommonsMultipartFile multipartFile : files) {
                  //파일명 고유한 값 넣어주기 위해 파일명에 현재시간 넣기
                  Calendar calendar = Calendar.getInstance();
                  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
                  String fname = dateFormat.format(calendar.getTime())+multipartFile.getOriginalFilename();
                  String path = request.getSession().getServletContext().getRealPath("/upload/RTP");
                  String fullpath = path + "\\" + fname;

                  if (!fname.equals("")) {
                     // 서버에 물리적 경로 파일쓰기작업
                     try {
                        FileOutputStream fs = new FileOutputStream(fullpath);
                        fs.write(multipartFile.getBytes());
                        fs.close();
                     } catch (IOException e) {
                        e.printStackTrace();
                     }
                  }
                  fileNames.add(fname); // 파일의 이름만 별도 관리
               }
            }
            //p_regdate는 update시간으로 넣어야할지... 그냥시간으로 넣어야할지 고민이군!
            dto.setP_contentFile(fileNames.get(0));
            dto.setP_thumbFile(fileNames.get(1));
            
            IRTPdao dao = sqlSession.getMapper(IRTPdao.class);
            dao.RTP_update(dto); // 레시피/테마 테이블에 insert
            
            model.addAttribute("searchRange",request.getParameter("searchRange"));
            model.addAttribute("searchNo",request.getParameter("searchNo"));
            model.addAttribute("searchTitle",request.getParameter("searchTitle"));
            model.addAttribute("searchWriter",request.getParameter("searchWriter"));
            model.addAttribute("searchCategory",request.getParameter("searchCategory"));
            model.addAttribute("searchKeyword",request.getParameter("searchKeyword"));
            model.addAttribute("startRegdate",request.getParameter("startRegdate"));
            model.addAttribute("endRegdate",request.getParameter("endRegdate"));
            
            return "redirect:/productSelect_Modify";
         }//RTP_update() end
         
   //레시피 select ///////////////////////////////////////////////////////////////////////////////////////////   
         @RequestMapping("/recipe_list")
         public String recipe_list(Model model,HttpServletRequest request){ 
            String p_category1 = request.getParameter("p_category1");
            String categoryValue = null;
            IRTPdao dao = sqlSession.getMapper(IRTPdao.class);
            
            List<RTPdto> recipe_list = new ArrayList<RTPdto>();
            List<RTPdto> recipe_onePageList = new ArrayList<RTPdto>();
            
            ///페이징처리/////////////////////////////////////////////////////////
            int pageSize = 16;// 한페이지에 나오는 최대 데이터 갯수
            int allCount = 0; // 선택한 데이터 총 갯수
            int count = 0;//선택된 한페이지에 있는 데이터 총 갯수
            String pageNum = request.getParameter("pageNum"); // 페이지번호
             // 카테고리 버튼 누를때 기본값 1로 get방식으로 받음
            if (pageNum == null) { // null인경우 1로 지정
                  pageNum = "1";
             }
            int currentPage = Integer.parseInt(pageNum); // currentPage : 현재 보고 있는 페이지
            int startRow = (currentPage * pageSize) - (pageSize-1); // 현재페이지의 시작행
             int endRow = currentPage * pageSize; // 현재페이지의 끝행
             
             
             System.out.println("pageNum : " + pageNum);
             System.out.println("currentPage : " + currentPage);
             System.out.println("startRow : " + startRow);
             System.out.println("endRow : " + endRow);
            
            if(p_category1==null){// 레시피 리스트 전체뽑기 - category1순으로 정렬 
               System.out.println("recipe_list()");   
               categoryValue="no";
               recipe_list = dao.recipe_listAll();
               recipe_onePageList = dao.recipe_onePageList(startRow,endRow);
            }else{//레시피 p_category1에 해당하는 리스트 뽑기
               System.out.println("recipe_listCategory()");
               categoryValue=p_category1;
               recipe_list = dao.recipe_listCategory(p_category1);
               recipe_onePageList = dao.recipe_onePageListCategory(p_category1,startRow,endRow);
            }
            allCount = recipe_list.size(); // 선택한 데이터 총 갯수
            count = recipe_onePageList.size();//한페이지에 보여줄 데이터 총 갯수
            
            System.out.println("allCount : " + allCount);
             System.out.println("count : " + count);
            
             model.addAttribute("categoryValue",categoryValue);
             
             model.addAttribute("count", new Integer(count));
             model.addAttribute("currentPage", new Integer(currentPage));
             model.addAttribute("startRow", new Integer(startRow));
             model.addAttribute("endRow", new Integer(endRow));
             model.addAttribute("allCount", new Integer(allCount));
             model.addAttribute("pageSize", new Integer(pageSize));
             model.addAttribute("recipe_list",recipe_list); // 해당하는 전체리스트
             model.addAttribute("recipe_onePageList",recipe_onePageList); // 한페이지에 출력될 리스트
            
            return "front.recipe_theme.recipe_list";
         }
   //테마 select ///////////////////////////////////////////////////////////////////////////////////////////
         @RequestMapping("/theme_list")
         public String theme_list(Model model,HttpServletRequest request){
            
            String p_category2 = request.getParameter("p_category2");
            String categoryValue = null;
            IRTPdao dao = sqlSession.getMapper(IRTPdao.class);

            List<RTPdto> theme_list = new ArrayList<RTPdto>();
            List<RTPdto> theme_onePageList = new ArrayList<RTPdto>();
            
            ///페이징처리/////////////////////////////////////////////////////////
            int pageSize = 16;// 한페이지에 나오는 최대 데이터 갯수
            int allCount = 0; // 선택한 데이터 총 갯수
            int count = 0;//선택된 한페이지에 있는 데이터 총 갯수
            String pageNum = request.getParameter("pageNum"); // 페이지번호
             // 카테고리 버튼 누를때 기본값 1로 get방식으로 받음
            if (pageNum == null) { // null인경우 1로 지정
                  pageNum = "1";
             }
            int currentPage = Integer.parseInt(pageNum); // currentPage : 현재 보고 있는 페이지
            int startRow = (currentPage * pageSize) - (pageSize-1); // 현재페이지의 시작행
             int endRow = currentPage * pageSize; // 현재페이지의 끝행
             
             
             System.out.println("pageNum : " + pageNum);
             System.out.println("currentPage : " + currentPage);
             System.out.println("startRow : " + startRow);
             System.out.println("endRow : " + endRow);   
             
            if(p_category2==null){// 테마 리스트 전체뽑기 - category2순으로 정렬 
               System.out.println("theme_list()");   
               categoryValue="no";
               theme_list = dao.theme_listAll();
               theme_onePageList = dao.theme_onePageList(startRow,endRow);
            }else{//테마 p_category2에 해당하는 리스트 뽑기
               System.out.println("theme_listCategory()");
               categoryValue=p_category2;
               theme_list = dao.theme_listCategory(p_category2);
               theme_onePageList = dao.theme_onePageListCategory(p_category2,startRow,endRow);
            }
            allCount = theme_list.size(); // 선택한 데이터 총 갯수
            count = theme_onePageList.size();//한페이지에 보여줄 데이터 총 갯수
            
            System.out.println("allCount : " + allCount);
             System.out.println("count : " + count);
             
             model.addAttribute("categoryValue",categoryValue);
             
             model.addAttribute("count", new Integer(count));
             model.addAttribute("currentPage", new Integer(currentPage));
             model.addAttribute("startRow", new Integer(startRow));
             model.addAttribute("endRow", new Integer(endRow));
             model.addAttribute("allCount", new Integer(allCount));
             model.addAttribute("pageSize", new Integer(pageSize));
             model.addAttribute("theme_list",theme_list); // 해당하는 전체리스트
             model.addAttribute("theme_onePageList",theme_onePageList); // 한페이지에 출력될 리스트
            return "front.recipe_theme.theme_list";
         }
   //골라담기 insert////////////////////////////////////////////////////////////////////////////////////////////
         @RequestMapping("/farmProductRegister")
         public String farmProductRegister(){
            System.out.println("farmProduct_writeView()");
            return "back.storeManage.farmProductRegister";
         }//farmProductRegister()
         @RequestMapping("/farmProduct_write")
         public String farmProduct_write(HttpServletRequest request, Model model, FarmProductDto dto, Principal principal){
            System.out.println("farmProduct_write()");
            dto.setId(principal.getName());
            //s_regdate는 insert할때 직접 sysdate로 넣는다.
            
            List<CommonsMultipartFile> files = dto.getFiles();
            List<String> fileNames = new ArrayList<String>();
            if (files != null && files.size() > 0) {
               // 이 경우라면 최소 한개는 파일첨부
               
               for (CommonsMultipartFile multipartFile : files) {
                  //파일명 고유한 값 넣어주기 위해 파일명에 현재시간 넣기
                  Calendar calendar = Calendar.getInstance();
                  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
                  String fname = dateFormat.format(calendar.getTime())+multipartFile.getOriginalFilename();
                  String path = request.getSession().getServletContext().getRealPath("/upload/farmProduct");
                  String fullpath = path + "\\" + fname;
                  if (!fname.equals("")) {
                     // 서버에 물리적 경로 파일쓰기작업
                     try {
                        FileOutputStream fs = new FileOutputStream(fullpath);
                        fs.write(multipartFile.getBytes());
                        fs.close();
                     } catch (IOException e) {
                        e.printStackTrace();
                     }
                  }
                  fileNames.add(fname); // 파일의 이름만 별도 관리
               }
               // DB insert (파일명)
               dto.setS_contentFile(fileNames.get(0));
               dto.setS_thumbFile(fileNames.get(1));
            }
            IFarmProductDao dao = sqlSession.getMapper(IFarmProductDao.class);
            dao.farmProduct_write(dto); // 골라담기테이블에 insert
            return "redirect:/";
         }//farmProduct_write() end
   //골라담기 select ///////////////////////////////////////////////////////////////////////////////////////////   
         @RequestMapping("/farmProduct_list")
         public String farmProduct_list(Model model,HttpServletRequest request){ 
                  
            String s_category = request.getParameter("s_category");
            String categoryValue = null;
            IFarmProductDao dao = sqlSession.getMapper(IFarmProductDao.class);
         
            List<FarmProductDto> farmProduct_list = new ArrayList<FarmProductDto>();
            List<FarmProductDto> farmProduct_onePageList = new ArrayList<FarmProductDto>();
            
            ///페이징처리/////////////////////////////////////////////////////////
            int pageSize = 16;// 한페이지에 나오는 최대 데이터 갯수
            int allCount = 0; // 선택한 데이터 총 갯수
            int count = 0;//선택된 한페이지에 있는 데이터 총 갯수
            String pageNum = request.getParameter("pageNum"); // 페이지번호
             // 카테고리 버튼 누를때 기본값 1로 get방식으로 받음
            if (pageNum == null) { // null인경우 1로 지정
                  pageNum = "1";
             }
            int currentPage = Integer.parseInt(pageNum); // currentPage : 현재 보고 있는 페이지
            int startRow = (currentPage * pageSize) - (pageSize-1); // 현재페이지의 시작행
             int endRow = currentPage * pageSize; // 현재페이지의 끝행
             
             
             System.out.println("pageNum : " + pageNum);
             System.out.println("currentPage : " + currentPage);
             System.out.println("startRow : " + startRow);
             System.out.println("endRow : " + endRow);   
            
            if(s_category==null){// 골라담기 리스트 전체뽑기
               System.out.println("farmProduct_list()");   
               categoryValue="no";
               farmProduct_list = dao.farmProduct_list();
               farmProduct_onePageList = dao.farmProduct_onePageList(startRow,endRow);
            }else{//골라담기 s_category에 해당하는 리스트 뽑기
               System.out.println("farmProduct_listCategory()");
               categoryValue=s_category;
               farmProduct_list = dao.farmProduct_listCategory(s_category);
               farmProduct_onePageList = dao.farmProduct_onePageListCategory(s_category,startRow,endRow);
            }
            allCount = farmProduct_list.size(); // 선택한 데이터 총 갯수
            count = farmProduct_onePageList.size();//한페이지에 보여줄 데이터 총 갯수
            
            System.out.println("allCount : " + allCount);
             System.out.println("count : " + count);
             
             model.addAttribute("categoryValue",categoryValue);
             
             model.addAttribute("count", new Integer(count));
             model.addAttribute("currentPage", new Integer(currentPage));
             model.addAttribute("startRow", new Integer(startRow));
             model.addAttribute("endRow", new Integer(endRow));
             model.addAttribute("allCount", new Integer(allCount));
             model.addAttribute("pageSize", new Integer(pageSize));
             model.addAttribute("farmProduct_list",farmProduct_list); // 해당하는 전체리스트
             model.addAttribute("farmProduct_onePageList",farmProduct_onePageList); // 한페이지에 출력될 리스트
            return "front.farmProduct.farmProduct_list";
         }
   //골라담기 delete ///////////////////////////////////////////////////////////////////////////////////////////
         @RequestMapping("/farmProduct_delete")
         public String farmProduct_delete(HttpServletRequest request, Model model){
            System.out.println("farmProduct_delete("+request.getParameter("s_no")+")");
            String s_no = request.getParameter("s_no"); 
                  
            // s_no에 해당하는 파일 실제 경로에서 삭제
            IFarmProductDao dao = sqlSession.getMapper(IFarmProductDao.class);
            FarmProductDto dto = new FarmProductDto();
            dto = dao.farmProduct_selectAll(s_no); //
            String s_contentFile = dto.getS_contentFile();// 삭제할 s_contentFile명
            String s_thumbFile = dto.getS_thumbFile();// 삭제할 s_thumbFile명
            String path = request.getSession().getServletContext().getRealPath("/upload/farmProduct");//삭제할 파일 경로
            String fullpath1 = path + "\\" + s_contentFile;
            String fullpath2 = path + "\\" + s_thumbFile;
            File file = new File(fullpath1);
            if(file.exists()==true) file.delete();
            file = new File(fullpath2);
            if(file.exists()==true) file.delete();
            // s_no에 해당하는 데이터 삭제
            dao.farmProduct_delete(s_no); // 골라담기 테이블에서 삭제 delete   
            
            model.addAttribute("searchRange",request.getParameter("searchRange"));
            model.addAttribute("searchNo",request.getParameter("searchNo"));
            model.addAttribute("searchTitle",request.getParameter("searchTitle"));
            model.addAttribute("searchWriter",request.getParameter("searchWriter"));
            model.addAttribute("searchCategory",request.getParameter("searchCategory"));
            model.addAttribute("searchKeyword",request.getParameter("searchKeyword"));
            model.addAttribute("startRegdate",request.getParameter("startRegdate"));
            model.addAttribute("endRegdate",request.getParameter("endRegdate"));
            
            return "redirect:/productSelect_Modify";
         }//farmProduct_delete() end

         //골라담기 update//////////////////////////////////////////////////////////////////////////////////////////
         @RequestMapping("/farmProduct_updateView")
         public String farmProduct_updateView(Model model, HttpServletRequest request) {
            System.out.println("farmProduct_updateView()");
            IFarmProductDao dao = sqlSession.getMapper(IFarmProductDao.class);
            FarmProductDto dto = dao.farmProduct_selectAll(request.getParameter("s_no"));
            model.addAttribute("updateList", dto);  // 뽑은 데이터 updateList라는 이름으로 보내기
            
            model.addAttribute("searchRange",request.getParameter("searchRange"));
            model.addAttribute("searchNo",request.getParameter("searchNo"));
            model.addAttribute("searchTitle",request.getParameter("searchTitle"));
            model.addAttribute("searchWriter",request.getParameter("searchWriter"));
            model.addAttribute("searchCategory",request.getParameter("searchCategory"));
            model.addAttribute("searchKeyword",request.getParameter("searchKeyword"));
            model.addAttribute("startRegdate",request.getParameter("startRegdate"));
            model.addAttribute("endRegdate",request.getParameter("endRegdate"));
            
            return "back.storeManage.farmProductUpdate";
         }
         @RequestMapping("/farmProduct_update")
         public String farmProduct_update(HttpServletRequest request, FarmProductDto dto, Model model){
            System.out.println("farmProduct_update()");
            
            List<CommonsMultipartFile> files = dto.getFiles();
            List<String> fileNames = new ArrayList<String>();
            if (files != null && files.size() > 0) {
               // 이 경우라면 최소 한개는 파일첨부
               for (CommonsMultipartFile multipartFile : files) {
                  //파일명 고유한 값 넣어주기 위해 파일명에 현재시간 넣기
                  Calendar calendar = Calendar.getInstance();
                  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
                  String fname = dateFormat.format(calendar.getTime())+multipartFile.getOriginalFilename();
                  String path = request.getSession().getServletContext().getRealPath("/upload/farmProduct");
                  String fullpath = path + "\\" + fname;

                  if (!fname.equals("")) {
                     // 서버에 물리적 경로 파일쓰기작업
                     try {
                        FileOutputStream fs = new FileOutputStream(fullpath);
                        fs.write(multipartFile.getBytes());
                        fs.close();
                     } catch (IOException e) {
                        e.printStackTrace();
                     }
                  }
                  fileNames.add(fname); // 파일의 이름만 별도 관리
               }
            }
            
            //dto.setId(principal.getName());
            //p_regdate는 update시간으로 넣어야할지... 그냥시간으로 넣어야할지 고민이군!
            dto.setS_contentFile(fileNames.get(0));
            dto.setS_thumbFile(fileNames.get(1));
            
            IFarmProductDao dao = sqlSession.getMapper(IFarmProductDao.class);
            dao.farmProduct_update(dto); 
            
            model.addAttribute("searchRange",request.getParameter("searchRange"));
            model.addAttribute("searchNo",request.getParameter("searchNo"));
            model.addAttribute("searchTitle",request.getParameter("searchTitle"));
            model.addAttribute("searchWriter",request.getParameter("searchWriter"));
            model.addAttribute("searchCategory",request.getParameter("searchCategory"));
            model.addAttribute("searchKeyword",request.getParameter("searchKeyword"));
            model.addAttribute("startRegdate",request.getParameter("startRegdate"));
            model.addAttribute("endRegdate",request.getParameter("endRegdate"));
            
            return "redirect:/productSelect_Modify";
         }//update() end
   }
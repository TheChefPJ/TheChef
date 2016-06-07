package com.kosta.project;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.project.dao.INotice_BoardDao;
import com.kosta.project.dto.CommentDTO;
import com.kosta.project.dto.NoticeBoardDto;

@Controller
public class Notice_BoardFrontController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/NB_list")
	public String list(HttpServletRequest request, Model model){
		
		int pg = 1;
		String strPg = request.getParameter("pg");
		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		int rowSize = 10;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		INotice_BoardDao dao = sqlSession.getMapper(INotice_BoardDao.class);
		int total = dao.getListCount(); // 총 게시물수

		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);

		int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] >>
		int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (toPage > allPage) {
			toPage = allPage;
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		List<NoticeBoardDto> list = dao.list(map);
		Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String fname = dateFormat.format(calendar.getTime());   
        System.out.println("fname"+fname);
		
		
		System.out.println("list()");
	    model.addAttribute("fname",fname);
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		return "front.noticeboard.NB_list";
	
	}
	
	@RequestMapping("/NB_write_view")
	public String write_view(Model model){
		System.out.println("write_view()");
		return "back.noticeboard.noticeWriteView";				// /WEB-INF/views/write_view.jsp
	}// write_view() end
		
	
	@RequestMapping("/NB_write")
	public String write(HttpServletRequest request, Model model){
		System.out.println("write()");
		NoticeBoardDto dto = new NoticeBoardDto();
		dto.setN_title(request.getParameter("n_title"));
		dto.setN_writer(request.getParameter("n_writer"));
		dto.setN_contents(request.getParameter("n_content"));
		INotice_BoardDao dao = sqlSession.getMapper(INotice_BoardDao.class); // IBDao에서 Mapper를 얻어올거야
		dao.write(dto);
		return "redirect:/noticeManage"; 
//		return "redirect:NB_list";				// /WEB-INF/views/list.jsp
	}// write() end
	
	@RequestMapping("/NB_content_view")
	public String content_view(HttpServletRequest request, Model model){
		System.out.println("content_view()");
		String n_no = request.getParameter("n_no");
		System.out.println("title받아오는고");
		INotice_BoardDao dao = sqlSession.getMapper(INotice_BoardDao.class);
		dao.readcount(n_no);	//조회수 1증가
		System.out.println("조회수 1증가했는고");
		
		Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String fname = dateFormat.format(calendar.getTime());   
        System.out.println("fname"+fname);
        
        model.addAttribute("fname",fname);
		model.addAttribute("content_view",dao.contentView(n_no));
		
		System.out.println("listcomment");
		model.addAttribute("ListComment",dao.ListComment(n_no));
		
		return "front.noticeboard.content_view";
	}
	
	@RequestMapping("/NB_content_view_comment")
	public String insertComment(HttpServletRequest request ,Model model ){
		
	    System.out.println("insertComment");
		String n_no = request.getParameter("n_no");
        String comment_name = request.getParameter("comment_name");
        String comment_comm = request.getParameter("comment_comm");
        
		CommentDTO cdto = new CommentDTO();
		cdto.setN_no(request.getParameter("n_no"));
		cdto.setComment_name(request.getParameter("comment_name"));
		cdto.setComment_comm(request.getParameter("comment_comm"));
		
		System.out.println(n_no);
		System.out.println(comment_name);
		System.out.println(comment_comm);

        System.out.println("setComment");
		INotice_BoardDao dao = sqlSession.getMapper(INotice_BoardDao.class);

		dao.insertComment(cdto);
		
        System.out.println("insertComment ok");
        model.addAttribute("n_no",n_no);
		
		
		
		return "redirect:/NB_content_view";

	}
	
	@RequestMapping("/NB_delete")
	public String delete(HttpServletRequest request){
		System.out.println("delete()");
		String n_no = request.getParameter("n_no");
		INotice_BoardDao dao = sqlSession.getMapper(INotice_BoardDao.class);
		dao.deletecomment(n_no);
		dao.delete(n_no);
		return "redirect:/noticeManage";
	}
	
	@RequestMapping("/CM_delete")
	public String commentDelete(HttpServletRequest request,Model model){
		
		String n_no = request.getParameter("n_no");
		System.out.println(n_no);
		System.out.println("commentS delete()");
		String comment_seq = request.getParameter("comment_seq");
		System.out.println(comment_seq);
		INotice_BoardDao dao = sqlSession.getMapper(INotice_BoardDao.class);
		dao.commentDelete(comment_seq);
		System.out.println("comment delete ok??");
		
        model.addAttribute("comment_seq",comment_seq);
        model.addAttribute("n_no",n_no);

		return "redirect:/NB_content_view?n_no="+n_no;
	}
	
	@RequestMapping("/NB_modify_view")
	public String modify_view(HttpServletRequest request, Model model, NoticeBoardDto dto){
		System.out.println("modify_view()");
		String n_no = request.getParameter("n_no");
		INotice_BoardDao dao = sqlSession.getMapper(INotice_BoardDao.class);
		model.addAttribute("content_view",dao.contentView(n_no));
		System.out.println("여까지잘오나?");
		return "back.noticeboard.modify_view";
	}
	
	@RequestMapping(value="/NB_modify",method=RequestMethod.POST)
	public String modify(HttpServletRequest request){
		System.out.println("modify()");
		NoticeBoardDto dto = new NoticeBoardDto();
		dto.setN_writer(request.getParameter("N_writer"));
		dto.setN_title(request.getParameter("N_title"));
		dto.setN_contents(request.getParameter("N_contents"));
		dto.setN_no(Integer.parseInt(request.getParameter("N_no")));
		INotice_BoardDao dao = sqlSession.getMapper(INotice_BoardDao.class);
		dao.modify(dto);
		return "redirect:/noticeManage";
	}
	
	@RequestMapping(value="/NB_noticeManage")
	public String backpage_search(HttpServletRequest request, Model model){
		System.out.println("backpage-search()");
		
		INotice_BoardDao dao = sqlSession.getMapper(INotice_BoardDao.class);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dataFrom", request.getParameter("dataFrom"));
		map.put("dataTo", request.getParameter("dataTo"));
		map.put("category_selector", request.getParameter("category_selector"));
		map.put("dataForSearch", request.getParameter("dataForSearch"));
		String flag = (String)map.get("category_selector");
		System.out.println("flag값:"+flag);
		
		int pg = 1;
		String strPg = request.getParameter("pg");
		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		int rowSize = 10;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;
		
		map.put("start", start);
		map.put("end", end);
		
		
		List<NoticeBoardDto> list =null;
//		List<NoticeBoardDto> list =dao.backpage_search_bytitle(map);
		int total=0;
		
		if(flag.equals("sub")){
			System.out.println("내가실행되나?");
			list = dao.backpage_search_bytitle(map);
			total = dao.getListCount_back1(map);
		} else{
			System.out.println("눼가실행되나");
			list = dao.backpage_search_byno(map);
			total = dao.getListCount_back2(map);
		}
		
//		int total = list.size(); // 아이디어 번뜩였는데? ㅎ
		System.out.println("total.size:"+total);
		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);

		int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] >>
		int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (toPage > allPage) {
			toPage = allPage; 
		}
		
		Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String fname = dateFormat.format(calendar.getTime());
		
		model.addAttribute("fname",fname);
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		
		return "back.storeManage.noticeManage";
	}
}

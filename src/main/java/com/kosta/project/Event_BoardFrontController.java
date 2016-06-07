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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.project.dao.IEvent_BoardDao;
import com.kosta.project.dao.INotice_BoardDao;
import com.kosta.project.dto.EventBoardCommentDto;
import com.kosta.project.dto.EventBoardDto;
import com.kosta.project.dto.NoticeBoardDto;

@Controller
public class Event_BoardFrontController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/EB_list")
	public String list(HttpServletRequest request, Model model){
		
		int pg = 1;
		String strPg = request.getParameter("pg");
		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		int rowSize = 10;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		IEvent_BoardDao dao = sqlSession.getMapper(IEvent_BoardDao.class);
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

		List<EventBoardDto> list = dao.list(map);
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
		return "front.eventboard.EB_list";
	
	}
	
	@RequestMapping("/EB_write_view")
	public String write_view(Model model){
		System.out.println("write_view()");
		return "front.eventboard.write_view";				// /WEB-INF/views/write_view.jsp
	}// write_view() end
		
	@RequestMapping("/EB_write")
	public String write(HttpServletRequest request, Model model){
		System.out.println("write()");
		EventBoardDto dto = new EventBoardDto();
		dto.setE_title(request.getParameter("e_title"));
		dto.setE_writer(request.getParameter("e_writer"));
		dto.setE_contents(request.getParameter("e_content"));
		IEvent_BoardDao dao = sqlSession.getMapper(IEvent_BoardDao.class); // IBDao에서 Mapper를 얻어올거야
		dao.write(dto);  

		return "redirect:/eventManage";				// /WEB-INF/views/list.jsp
	}// write() end
	
	@RequestMapping("/EB_content_view")
	public String content_view(HttpServletRequest request, Model model){
		System.out.println("content_view()");
		String e_no = request.getParameter("e_no");
		System.out.println("title받아오는고");
		IEvent_BoardDao dao = sqlSession.getMapper(IEvent_BoardDao.class);
		dao.readcount(e_no);	//조회수 1증가
		System.out.println("조회수 1증가했는고");
		
		Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String fname = dateFormat.format(calendar.getTime());   
        System.out.println("fname"+fname);
        model.addAttribute("fname",fname);
		model.addAttribute("content_view",dao.contentView(e_no));
		
		System.out.println("listcomment");
		model.addAttribute("ListComment",dao.ListComment(e_no));
		
		return "front.eventboard.content_view";
	}
	
	@RequestMapping("/EB_content_view_comment")
	public String insertComment(HttpServletRequest request ,Model model ){
		
	    System.out.println("insertComment");
		String e_no = request.getParameter("e_no");
        String comment_name = request.getParameter("comment_name");
        String comment_comm = request.getParameter("comment_comm");
        
        EventBoardCommentDto cdto = new EventBoardCommentDto();
		cdto.setE_no(request.getParameter("e_no"));
		cdto.setComment_name(request.getParameter("comment_name"));
		cdto.setComment_comm(request.getParameter("comment_comm"));
		
		System.out.println(e_no);
		System.out.println(comment_name);
		System.out.println(comment_comm);

        System.out.println("setComment");
        IEvent_BoardDao dao =sqlSession.getMapper(IEvent_BoardDao.class);
		dao.insertComment(cdto);
		
        System.out.println("insertComment ok");
        model.addAttribute("e_no",e_no);
		
		
		
		return "redirect:/EB_content_view";

	}
	
	@RequestMapping("/EB_delete")
	public String delete(HttpServletRequest request){
		System.out.println("delete()");
		String e_no = request.getParameter("e_no");
		IEvent_BoardDao dao = sqlSession.getMapper(IEvent_BoardDao.class);
		dao.deletecomment(e_no);
		dao.delete(e_no);
		return "redirect:/eventManage";
	}
	
	@RequestMapping("/ECM_delete")
	public String commentDelete(HttpServletRequest request,Model model){
		
		String e_no = request.getParameter("e_no");
		System.out.println(e_no);
		System.out.println("commentS delete()");
		String comment_seq = request.getParameter("comment_seq");
		System.out.println(comment_seq);
		IEvent_BoardDao dao = sqlSession.getMapper(IEvent_BoardDao.class);
		dao.commentDelete(comment_seq);
		System.out.println("comment delete ok??");
		
        model.addAttribute("comment_seq",comment_seq);
        model.addAttribute("e_no",e_no);

		return "redirect:/EB_content_view?e_no="+e_no;
	}
	@RequestMapping("/EB_modify_view")
	public String modify_view(HttpServletRequest request, Model model, EventBoardDto dto){
		System.out.println("modify_view()");
		String e_no = request.getParameter("e_no"); 
		IEvent_BoardDao dao = sqlSession.getMapper(IEvent_BoardDao.class);
		model.addAttribute("content_view",dao.contentView(e_no));
		return "back.eventboard.modify_view";
	}
	
	@RequestMapping(value="/EB_modify",method=RequestMethod.POST)
	public String modify(HttpServletRequest request){
		System.out.println("modify()");
		EventBoardDto dto = new EventBoardDto();
		dto.setE_writer(request.getParameter("E_writer"));
		dto.setE_title(request.getParameter("E_title"));
		dto.setE_contents(request.getParameter("E_contents"));
		dto.setE_no(Integer.parseInt(request.getParameter("E_no")));
		IEvent_BoardDao dao = sqlSession.getMapper(IEvent_BoardDao.class);
		dao.modify(dto);
		return "redirect:/eventManage";
	}
	
	@RequestMapping(value="/EB_eventManage")
	public String backpage_search(HttpServletRequest request, Model model){
		System.out.println("backpage-search()");
		
		IEvent_BoardDao dao = sqlSession.getMapper(IEvent_BoardDao.class);
		
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
		
		
		List<EventBoardDto> list =null;
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
		
		return "back.storeManage.eventManage";
	}
	
}

package com.qust.engineer.servlet;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.itcast.servlet.BaseServlet;

import com.qust.engineer.dao.AnswerDao;
import com.qust.engineer.entity.Answer;
import com.qust.engineer.entity.Category;
import com.qust.engineer.entity.Question;
import com.qust.engineer.entity.User;
import com.qust.engineer.service.AnswerService;
import com.qust.engineer.service.CategoryService;
import com.qust.engineer.service.QuestionService;

public class QuestionServlet extends BaseServlet {

	/*
	 * 
	 * private CategoryService ctgService = new CategoryService();
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Category> categorys = ctgService.findAll();
		req.setAttribute("categorys", categorys);
		return "f:/jsps/category/all.jsp";
	}
	 * 
	 * 
	 */
	
	private CategoryService ctgService = new CategoryService();
	private QuestionService questionService = new QuestionService();
	private AnswerService answerService = new AnswerService();
	private AnswerDao answerDao = new AnswerDao();
    private	 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
	
	/**
	 * 进入提问首页
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	public String findQForMainPlate(HttpServletRequest req, HttpServletResponse resp){
		List<Question> new10Q = questionService.findNew10Q();
		List<Question> hot10Q = questionService.findHot10Q();
		List<Category> categorys = ctgService.findAll();
		
		req.setAttribute("new10Q", new10Q);
		req.setAttribute("hot10Q", hot10Q);
		req.setAttribute("categorys", categorys);
		
		
		return "f:/jsps/Question/AskPlates.jsp";
	}
	
	
	/**
	 * 进入单个问题板块
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	public String findQPlate(HttpServletRequest req, HttpServletResponse resp){
		
		String plate_id = req.getParameter("plate");
		if(this.isDigit(plate_id)){//如果是数字字符串的话
			
			//加载问题板块需要的问题
			List<Question> plateQ = questionService.findQueByCtgId(Integer.valueOf(plate_id));
			req.setAttribute("plateQ", plateQ);
			
			
			//加载分类
			Category category = ctgService.findByCtg_id(plate_id);
			req.setAttribute("category",category);
			
			
			
			List<Category> categorys = ctgService.findAll();
			req.setAttribute("categorys", categorys);//加载 分类目录
			
			return "f:/jsps/Question/SinglePlate.jsp";
			
		}
		
		//如果出错了，就返回刚才发过来的链接
		String s = req.getHeader("Referer");
		req.setAttribute("url", s);
			return "f:/jsps/error/error.jsp"; 
	}
	
	
	/**
	 * 
	 * 跳转到添加问题页面
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	
	public String rediretAddQ(HttpServletRequest req, HttpServletResponse resp){
	
		List<Category> categorys = ctgService.findAll();
		req.setAttribute("categorys", categorys);//加载 分类目录
		return "f:/jsps/Question/Ask.jsp";
	}
	
	
	public String addQ(HttpServletRequest req, HttpServletResponse resp){
		
	//获取发来的请求
	int ctg_id=Integer.valueOf((req.getParameter("ctg_id")));
		
	String q_name = (String) req.getParameter("Qtitle");
	String q_desc = (String) req.getParameter("Qdesc");
	
	
	//创建对象
	Question question = new Question();
	Category ctg = new Category();
	User user = new User();
	
	//赋值
	ctg.setCtg_id(ctg_id);
	question.setCategory(ctg);

	user = (User)req.getSession().getAttribute("session_user");
	
	/*
	HttpSession session = req.getSession();
	user = (User)session.getAttribute("user");
	*/
	//该处应该是获取  Session中的ID，但是为了方便，直接给其赋值就可以
	question.setUser(user);
	question.setQ_name(q_name);
	question.setQ_desc(q_desc);
	question.setQ_time(df.format(new Date()));
	
	
	
	//调用添加问题方法
	questionService.add(question);
	
	req.setAttribute("success", true);
		return rediretAddQ(req,resp);
	}
	
	/**
	 * 
	 * 通过问题ID来找到问题的相关情况
	 * 
	 * 并且找到相关回答的情况————还需要实现Answer类
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	public String findQA(HttpServletRequest req, HttpServletResponse resp){
	
		int q_id =Integer.valueOf( req.getParameter("q_id"));
		
		List<Answer> answer = new ArrayList<Answer>();
		Question question = questionService.findQById(q_id);
		answer = answerService.findAByQ(q_id);
		
		List<Category> categorys = ctgService.findAll();
		req.setAttribute("categorys", categorys);//加载 分类目录
		
		req.setAttribute("question", question);
		req.setAttribute("answer", answer);
		
		
	return "f:/background/remark.jsp";
	}
	
	
	
	/**
	 * 添加回答
	 * @param req
	 * @param resp
	 * @return
	 */
	public String addAnswer(HttpServletRequest req, HttpServletResponse resp){
		
		//参数初始化
		int q_id =Integer.valueOf( req.getParameter("q_id"));
		String a_content = req.getParameter("Adesc");
		Question question = new Question();
		question.setQ_id(q_id);
		User user = new User();
		
		user = (User)req.getSession().getAttribute("session_user");
		
		
		/*
		HttpSession session = req.getSession();
		user = (User)session.getAttribute("user");
		*/
		
		//初始化 answer 对象
		Answer answer = new Answer();
		answer.setA_time(df.format(new Date()));
		answer.setA_content(a_content);
		answer.setQuestion(question);
		answer.setUser(user);
		
		
		//暂时将判断方法写在这里
		
		if(answerService.IsAnswered(answer)){
			//调用添加方法
			answerService.add(answer);
			req.setAttribute("message","回答添加成功！");
			return this.findQA(req, resp);
		}else{
			req.setAttribute("addError","您已经为该问题添加过回答！");
			return this.findQA(req, resp);
		}
		
		
	}
	
	
public String updateAnswer(HttpServletRequest req, HttpServletResponse resp){
		
		//参数初始化
		int q_id =Integer.valueOf( req.getParameter("q_id"));
		int a_id = Integer.valueOf(req.getParameter("a_id"));
		String a_content = req.getParameter("newAdesc");
		Question question = new Question();
		question.setQ_id(q_id);
		User user = new User();
		user = (User)req.getSession().getAttribute("session_user");
		
		
		//初始化 answer 对象
		Answer answer = new Answer();
		answer.setA_time(df.format(new Date()));
		answer.setA_content(a_content);
		answer.setQuestion(question);
		answer.setUser(user);
		answer.setA_id(a_id);
		
		//暂时将判断方法写在这里
		
			answerService.update(answer);
			return this.findQA(req, resp);

		
		
	}
	
	
	
	public  String deleteAnswer(HttpServletRequest req, HttpServletResponse resp){
		int a_id =Integer.valueOf(req.getParameter("a_id"));
		
		Answer answer = new Answer();
		answer.setA_id(a_id);
		answerService.delet(answer);
		req.setAttribute("msg", "删除成功");
		return this.findQA(req,resp);
	}
	
	
	
	/**
	 * 
	 * 将数字字符串转换成数字
	 * 
	 * @param str
	 * @return
	 */
	public boolean isDigit(String str){
		try { 
				int num=Integer.valueOf(str);//把字符串强制转换为数字
				return true;//如果是数字，返回True
			} catch (Exception e) {
				return false;//如果抛出异常，返回False}
		}
	}
	
	
	
	
	
	
}

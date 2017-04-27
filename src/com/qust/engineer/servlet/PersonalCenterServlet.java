package com.qust.engineer.servlet;
import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.ImageIcon;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

import com.qust.engineer.entity.Answer;
import com.qust.engineer.entity.Question;
import com.qust.engineer.entity.Route;
import com.qust.engineer.entity.User;
import com.qust.engineer.service.PersonalCenterService;


public class PersonalCenterServlet extends BaseServlet {
	private PersonalCenterService personalCenterService = new PersonalCenterService();
	//根据用户uid查出用户的信息，用于显示
	public String findUserInforById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User)request.getSession().getAttribute("session_user");
		user = personalCenterService.findUserInforById(user.getU_id());
		request.setAttribute("user", user);
		return "f:/jsps/personal/personal.jsp";
	}
	//根据用户uid查出用户的信息，用于显示,跳转到b编辑页面
		public String findUserInforByIdEdit(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			User user = (User)request.getSession().getAttribute("session_user");
			user = personalCenterService.findUserInforById(user.getU_id());
			request.setAttribute("user", user);
			return "f:/jsps/personal/editInformation.jsp";
		}
	//根据用户uid查出用户的所有回答
	public String findQuestionsById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1.调用service根据uid查找所有回答
		 * 2.若查找成功，返回用户所有的回答；若有错，将错误保存到PersonalException中。
		 * 3.成功后,将信息保存到request域中，跳转到myQuestion.jsp中。
		 */
		List<Question> questions = new ArrayList<Question>();
		User user = (User)request.getSession().getAttribute("session_user");
		questions = personalCenterService.findQuestionsById(user.getU_id());
		request.getSession().setAttribute("questions", questions);
		return "f:/jsps/personal/myQuestion.jsp";
	}
	//根据用户uid查出用户的所有提问
	public String findAnswersById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1.调用service根据uid查找所有提问
		 * 2.若查找成功，返回用户所有的提问；若有错，将错误保存到PersonalException中。
		 * 3.成功后,将信息保存到request域中，跳转到myQuestion.jsp中。
		 */
		List<Answer> answers = new ArrayList<Answer>();
		User user = (User)request.getSession().getAttribute("session_user");
		answers = personalCenterService.findAnswersById(user.getU_id());
		request.getSession().setAttribute("answers", answers);
		return "f:/jsps/personal/myAnswer.jsp";
	}
	//根据用户uid查出该用户的所有路线
	public String findRoutesById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1.调用service根据uid查找路线
		 * 2.若查找成功，返回用户所有的路线；若有错，将错误保存到PersonalException中。
		 * 3.成功后，将返回信息保存到request域中，跳转到myroute.jsp
		 */
		List<Route> routes = new ArrayList<Route>();
		User user = (User)request.getSession().getAttribute("session_user");
		routes = personalCenterService.findRoutesById(user.getU_id());
		request.getSession().setAttribute("routes", routes);
		return "f:/jsps/personal/myroute.jsp";	
	}
	
	//图片
	/*private void error(String msg, HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("msg", msg);
		req.getRequestDispatcher("/jsps/personal/msg.jsp").forward(req, resp);
		
	}*/
	//完整的修改信息
	public String completeUpdateInfor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		/*
//		 * 添加图片
//		 */
//		/*
//		response.setContentType("text/html;charset=UTF-8");//处理响应编码
//		request.setCharacterEncoding("UTF-8");
//		//1.上传3步
//				//1.1创建工厂
//				FileItemFactory factory = new DiskFileItemFactory();
//				//1.2创建解析器
//				ServletFileUpload sfu = new ServletFileUpload(factory);
//				sfu.setFileSizeMax(1024*1024);//设置单个上传文件的大小最大为1M
//				//1.3解析request得到FileItem
//				List<FileItem> fileItems = null;
//				try {
//					fileItems = sfu.parseRequest(request);
//				} catch (FileUploadException e) {
//					error("您上传的图片大小超过了1M，请换小于1M的图片",request,response);
//					e.printStackTrace();
//					return null;
//				}
//				//2先把普通表单项放到map中再映射到User
//				Map<String,Object> map = new HashMap<String,Object>();
//				for(FileItem fileItem:fileItems){
//					if(fileItem.isFormField()){
//						map.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
//					}
//				}
//				//3.映射到User对象中
//				User user = CommonUtils.toBean(map, User.class);
//				/*
//				 * 3.把上传的图片保存起来
//				 * 3.1获取文件名截取
//				 * 3.2给文件名添加uuid前缀，防止重名
//				 * 3.3校验图片的扩展名只能是JPG个PNG
//				 * 3.4校验图片的尺寸
//				 * 3.5指定文件的保存路径，要用ServletContext.getRealPath
//				 * 3.6保存
//				 * 3.7把保存的路径设置给School
//				 */
//				FileItem fileItem = fileItems.get(7);//获取第八个表单项
//				String filename = fileItem.getName();//注意这个得到的是上传路径
//				int index = filename.lastIndexOf("\\");
//				if(index!=-1){//等于-1说明没有\
//					filename = filename.substring(index+1);
//				}
//				//给文件名加上uuid，防止重名
//				filename = CommonUtils.uuid()+"_"+filename;
//				filename = filename.substring(index+1);
//				//3.3校验扩展名
//				if(!filename.toLowerCase().endsWith(".jpg")&&!filename.toLowerCase().endsWith(".png")){
//					error("图片格式必须是JPG或PNG", request, response);
//					return null;
//				}
//				/*
//				 * 3.4校验图片的尺寸
//				 * 	》先要保存图片，把图片new成图片对象：Image，Icon、ImageIcon、BufferImage、ImageIO
//				 * 	3.41获取图片的真实路径
//				 * 	3.42创建目标文件
//				 * 	3.43保存文件
//				 */
//				String savePath = this.getServletContext().getRealPath("/ctg_imgs");
//				File destFile = new File(savePath, filename);
//				try {
//					fileItem.write(destFile);//会把临时文件重定向到指定路径，再删除临时文件；
//				} catch (Exception e) {
//					throw new RuntimeException("保存临时文件，用来校验尺寸时出错了！");
//				}
//				/*
//				 * 校验图片的尺寸
//				 * 1.使用文件路径来创建ImageIcon
//				 * 2.通过ImageIcon得到image
//				 * 3.获取宽高校验
//				 */
//				ImageIcon icon = new ImageIcon(destFile.getAbsolutePath());
//				Image image = icon.getImage();
//				if((image.getWidth(null)>200||image.getWidth(null)<80)
//						||(image.getHeight(null)>200||image.getHeight(null)<80)){
//					error("您上传的图片尺寸不符合100*100的比例！", request, response);
//					destFile.delete();//删除图片
//					return null;
//				}
//				//把图片的路径设置给category
//				user.setU_img("jsps/images/"+filename); 
//				
//				//4.调用service方法完成添加
//				
//				personalCenterService.completeUpdateInfor(user);
//				request.setAttribute("msg", "用户信息修改成功!");
//				return "f:/jsps/personal/msg.jsp";*/
		/*
		 * 1.封装表单信息,还要记得添加邮箱信息，因为邮箱无法修改，所以该表单中不存在，需要人为添加
		 * 2.对表单信息进行二次验证，若有错误，保存信息到request域中，转发到msg.jsp页面中
		 * 3.若验证通过，则调用service的updateInfor方法,修改信息,若有错误，保存到PersonalException中，并转发
		 * 4.成功后跳转到msg.jsp页面中
		 */
		User form = CommonUtils.toBean(request.getParameterMap(),User.class);
		form.setU_email(((User)request.getSession().getAttribute("session_user")).getU_email());
		Map<String,String> errors = completeValidateInfor(form,request.getSession());
		if(errors.size()>0)
		{
			request.setAttribute("form", form);//回显信息
			request.setAttribute("errors", errors);
			return "f:/jsps/personal/personal.jsp";//回显页面
		}
		personalCenterService.completeUpdateInfor(form);
		request.setAttribute("user", form);//回显信息
		request.setAttribute("msg", "用户信息修改成功!");
		return "f:/jsps/personal/msg.jsp";
	}
	//快速修改信息
	public String quickUpdateInfor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1.封装表单信息,还要记得添加邮箱信息，因为邮箱无法修改，所以该表单中不存在，需要人为添加
		 * 2.对表单信息进行二次验证，若有错误，保存信息到request域中，转发到msg.jsp页面中
		 * 3.若验证通过，则调用service的updateInfor方法,修改信息,若有错误，保存到PersonalException中，并转发
		 * 4.成功后跳转到msg.jsp页面中
		 */
		User form = CommonUtils.toBean(request.getParameterMap(),User.class);
		form.setU_email(((User)request.getSession().getAttribute("session_user")).getU_email());
		Map<String,String> errors = quickValidateInfor(form,request.getSession());
		if(errors.size()>0)
		{
			request.setAttribute("form", form);//回显信息
			request.setAttribute("errors", errors);
			return "f:/jsps/personal/repersonal.jsp";//回显页面
		}
		personalCenterService.quickUpdateInfor(form);
		User user2 = new User();
		User user = (User)request.getSession().getAttribute("session_user");
		user2 = personalCenterService.findUserInforById(user.getU_id());
		request.setAttribute("user", user2);//回显信息
		//request.setAttribute("msg", "用户信息修改成功!");
		return "f:/jsps/personal/personal.jsp";		
	}
	//验证表单信息
	private Map<String,String> quickValidateInfor(User user,HttpSession session)
	{
		Map<String,String> errors = new HashMap<String, String>();
		String username = user.getU_name();
		String password = user.getU_pwd();
		String sex = user.getU_sex();
		//昵称校验
		if(username==null||username.trim().isEmpty())
		{
			errors.put("username","昵称不能为空");
		}
		else if(username.length()<2||username.length()>20)
		{
			errors.put("username", "2<长度<20");			
		}
		//密码校验
		if(password==null||password.trim().isEmpty())
		{
			errors.put("password","密码不能为空");
		}
		else if(password.length()<6||password.length()>20)
		{
			errors.put("password", "6<长度<20");			
		}
	    //性别校验
		if(sex==null||sex.trim().isEmpty())
		{
			errors.put("sex","性别不能为空");
		}
		else if(!sex.equalsIgnoreCase("男")&&!sex.equalsIgnoreCase("女"))
		{
			errors.put("sex", "性别输入不合法!");			
		}
		return errors;
	}
	//完整验证表单信息
		private Map<String,String> completeValidateInfor(User user,HttpSession session)
		{
			Map<String,String> errors = new HashMap<String, String>();
			String username = user.getU_name();
			String sex = user.getU_sex();
			String desc = user.getU_desc();
			//昵称校验
			if(username==null||username.trim().isEmpty())
			{
				errors.put("username","昵称不能为空");
			}
			else if(username.length()<2||username.length()>20)
			{
				errors.put("username", "2<长度<20");			
			}
			
		    //性别校验
			if(sex==null||sex.trim().isEmpty())
			{
				errors.put("sex","性别不能为空");
			}
			else if(!sex.equalsIgnoreCase("男")&&!sex.equalsIgnoreCase("女"))
			{
				errors.put("sex", "性别输入不合法!");			
			}
			//个性签名校验
			if(desc==null||desc.trim().isEmpty())
			{
				errors.put("desc","性别不能为空");
			}
			
			return errors;
		}
	
}

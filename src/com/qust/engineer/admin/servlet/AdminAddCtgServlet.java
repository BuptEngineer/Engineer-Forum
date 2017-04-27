package com.qust.engineer.admin.servlet;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.itcast.commons.CommonUtils;

import com.qust.engineer.entity.Category;
import com.qust.engineer.service.CategoryService;

public class AdminAddCtgServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");//处理响应编码
		request.setCharacterEncoding("UTF-8");
		//1.上传3步
		//1.1创建工厂
		FileItemFactory factory = new DiskFileItemFactory();
		//1.2创建解析器
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setFileSizeMax(1024*1024);//设置单个上传文件的大小最大为1M
		//1.3解析request得到FileItem
		List<FileItem> fileItems = null;
		try {
			fileItems = sfu.parseRequest(request);
		} catch (FileUploadException e) {
			error("您上传的图片大小超过了1M，请换小于1M的图片",request,response);
			e.printStackTrace();
			return;
		}
		
		//2先把普通表单项放到map中再映射到Category
		Map<String,Object> map = new HashMap<String,Object>();
		for(FileItem fileItem:fileItems){
			if(fileItem.isFormField()){
				map.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
			}
		}
		
		//3.映射到Category对象中
		Category category = CommonUtils.toBean(map, Category.class);
		
		/*
		 * 3.把上传的图片保存起来
		 * 3.1获取文件名截取
		 * 3.2给文件名添加uuid前缀，防止重名
		 * 3.3校验图片的扩展名只能是JPG个PNG
		 * 3.4校验图片的尺寸
		 * 3.5指定文件的保存路径，要用ServletContext.getRealPath
		 * 3.6保存
		 * 3.7把保存的路径设置给School
		 */
		FileItem fileItem = fileItems.get(1);//获取第二个表单项
		String filename = fileItem.getName();//注意这个得到的是上传路径
		int index = filename.lastIndexOf("\\");
		if(index!=-1){//等于-1说明没有\
			filename = filename.substring(index+1);
		}
		//给文件名加上uuid，防止重名
		filename = CommonUtils.uuid()+"_"+filename;
		filename = filename.substring(index+1);
		//3.3校验扩展名
		if(!filename.toLowerCase().endsWith(".jpg")&&!filename.toLowerCase().endsWith(".png")){
			error("图片格式必须是JPG或PNG", request, response);
			return ;
		}
		/*
		 * 3.4校验图片的尺寸
		 * 	》先要保存图片，把图片new成图片对象：Image，Icon、ImageIcon、BufferImage、ImageIO
		 * 	3.41获取图片的真实路径
		 * 	3.42创建目标文件
		 * 	3.43保存文件
		 */
		String savePath = this.getServletContext().getRealPath("/ctg_imgs");
		File destFile = new File(savePath, filename);
		try {
			fileItem.write(destFile);//会把临时文件重定向到指定路径，再删除临时文件；
		} catch (Exception e) {
			throw new RuntimeException("保存临时文件，用来校验尺寸时出错了！");
		}
		/*
		 * 校验图片的尺寸
		 * 1.使用文件路径来创建ImageIcon
		 * 2.通过ImageIcon得到image
		 * 3.获取宽高校验
		 */
		ImageIcon icon = new ImageIcon(destFile.getAbsolutePath());
		Image image = icon.getImage();
		if((image.getWidth(null)>200||image.getWidth(null)<80)
				||(image.getHeight(null)>200||image.getHeight(null)<80)){
			error("您上传的图片尺寸不符合100*100的比例！", request, response);
			destFile.delete();//删除图片
			return;
		}
		//把图片的路径设置给category
		category.setCtg_img("ctg_imgs/"+filename);
		
		//4.调用service方法完成添加
		CategoryService ctgService = new CategoryService();
		ctgService.add(category);
		request.setAttribute("msg", "恭喜您添加分类成功！");
		request.getRequestDispatcher("/adminjsps/msg.jsp").forward(request, response);
	}
	
	private void error(String msg, HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("msg", msg);
		req.getRequestDispatcher("/adminjsps/category/add.jsp").forward(req, resp);
		
	}

}

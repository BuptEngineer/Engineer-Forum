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
		response.setContentType("text/html;charset=UTF-8");//澶勭悊鍝嶅簲缂栫爜
		request.setCharacterEncoding("UTF-8");
		//1.涓婁紶3姝�
		//1.1鍒涘缓宸ュ巶
		FileItemFactory factory = new DiskFileItemFactory();
		//1.2鍒涘缓瑙ｆ瀽鍣�
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setFileSizeMax(1024*1024);//璁剧疆鍗曚釜涓婁紶鏂囦欢鐨勫ぇ灏忔渶澶т负1M
		//1.3瑙ｆ瀽request寰楀埌FileItem
		List<FileItem> fileItems = null;
		try {
			fileItems = sfu.parseRequest(request);
		} catch (FileUploadException e) {
			error("鎮ㄤ笂浼犵殑鍥剧墖澶у皬瓒呰繃浜�1M锛岃鎹㈠皬浜�1M鐨勫浘鐗�",request,response);
			e.printStackTrace();
			return;
		}
		
		//2鍏堟妸鏅�氳〃鍗曢」鏀惧埌map涓啀鏄犲皠鍒癈ategory
		Map<String,Object> map = new HashMap<String,Object>();
		for(FileItem fileItem:fileItems){
			if(fileItem.isFormField()){
				map.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
			}
		}
		
		//3.鏄犲皠鍒癈ategory瀵硅薄涓�
		Category category = CommonUtils.toBean(map, Category.class);
		
		/*
		 * 3.鎶婁笂浼犵殑鍥剧墖淇濆瓨璧锋潵
		 * 3.1鑾峰彇鏂囦欢鍚嶆埅鍙�
		 * 3.2缁欐枃浠跺悕娣诲姞uuid鍓嶇紑锛岄槻姝㈤噸鍚�
		 * 3.3鏍￠獙鍥剧墖鐨勬墿灞曞悕鍙兘鏄疛PG涓狿NG
		 * 3.4鏍￠獙鍥剧墖鐨勫昂瀵�
		 * 3.5鎸囧畾鏂囦欢鐨勪繚瀛樿矾寰勶紝瑕佺敤ServletContext.getRealPath
		 * 3.6淇濆瓨
		 * 3.7鎶婁繚瀛樼殑璺緞璁剧疆缁橲chool
		 */
		FileItem fileItem = fileItems.get(1);//鑾峰彇绗簩涓〃鍗曢」
		String filename = fileItem.getName();//娉ㄦ剰杩欎釜寰楀埌鐨勬槸涓婁紶璺緞
		int index = filename.lastIndexOf("\\");
		if(index!=-1){//绛変簬-1璇存槑娌℃湁\
			filename = filename.substring(index+1);
		}
		//缁欐枃浠跺悕鍔犱笂uuid锛岄槻姝㈤噸鍚�
		filename = CommonUtils.uuid()+"_"+filename;
		filename = filename.substring(index+1);
		//3.3鏍￠獙鎵╁睍鍚�
		if(!filename.toLowerCase().endsWith(".jpg")&&!filename.toLowerCase().endsWith(".png")){
			error("鍥剧墖鏍煎紡蹇呴』鏄疛PG鎴朠NG", request, response);
			return ;
		}
		/*
		 * 3.4鏍￠獙鍥剧墖鐨勫昂瀵�
		 * 	銆嬪厛瑕佷繚瀛樺浘鐗囷紝鎶婂浘鐗噉ew鎴愬浘鐗囧璞★細Image锛孖con銆両mageIcon銆丅ufferImage銆両mageIO
		 * 	3.41鑾峰彇鍥剧墖鐨勭湡瀹炶矾寰�
		 * 	3.42鍒涘缓鐩爣鏂囦欢
		 * 	3.43淇濆瓨鏂囦欢
		 */
		String savePath = this.getServletContext().getRealPath("/ctg_imgs");
		File destFile = new File(savePath, filename);
		try {
			fileItem.write(destFile);//浼氭妸涓存椂鏂囦欢閲嶅畾鍚戝埌鎸囧畾璺緞锛屽啀鍒犻櫎涓存椂鏂囦欢锛�
		} catch (Exception e) {
			throw new RuntimeException("淇濆瓨涓存椂鏂囦欢锛岀敤鏉ユ牎楠屽昂瀵告椂鍑洪敊浜嗭紒");
		}
		/*
		 * 鏍￠獙鍥剧墖鐨勫昂瀵�
		 * 1.浣跨敤鏂囦欢璺緞鏉ュ垱寤篒mageIcon
		 * 2.閫氳繃ImageIcon寰楀埌image
		 * 3.鑾峰彇瀹介珮鏍￠獙
		 */
		ImageIcon icon = new ImageIcon(destFile.getAbsolutePath());
		Image image = icon.getImage();
		if((image.getWidth(null)>200||image.getWidth(null)<80)
				||(image.getHeight(null)>200||image.getHeight(null)<80)){
			error("鎮ㄤ笂浼犵殑鍥剧墖灏哄涓嶇鍚�100*100鐨勬瘮渚嬶紒", request, response);
			destFile.delete();//鍒犻櫎鍥剧墖
			return;
		}
		//鎶婂浘鐗囩殑璺緞璁剧疆缁檆ategory
		category.setCtg_img("ctg_imgs/"+filename);
		
		//4.璋冪敤service鏂规硶瀹屾垚娣诲姞
		CategoryService ctgService = new CategoryService();
		ctgService.add(category);
		request.setAttribute("msg", "鎭枩鎮ㄦ坊鍔犲垎绫绘垚鍔燂紒");
		request.getRequestDispatcher("/adminjsps/msg.jsp").forward(request, response);
	}
	
	private void error(String msg, HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("msg", msg);
		req.getRequestDispatcher("/adminjsps/category/add.jsp").forward(req, resp);
	}

}

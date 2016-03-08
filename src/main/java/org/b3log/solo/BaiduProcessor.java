package org.b3log.solo;
 
import java.io.PrintWriter; 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.b3log.latke.servlet.HTTPRequestContext;
import org.b3log.latke.servlet.HTTPRequestMethod;
import org.b3log.latke.servlet.annotation.RequestProcessing;
import org.b3log.latke.servlet.annotation.RequestProcessor;
import org.b3log.latke.servlet.renderer.DoNothingRenderer;

import com.baidu.ueditor.ActionEnter;  
/**
 * 注解WebServlet用来描述一个Servlet 属性name描述Servlet的名字,可选
 * 属性urlPatterns定义访问的URL,或者使用属性value定义访问的URL.(定义访问的URL是必选属性)
 */
// @WebServlet(name = "BaiduProcessor", value =
// "/js/lib/ueditor/control/controller*")
@RequestProcessor
public class BaiduProcessor {
	// 百度
	@RequestProcessing(value = "/js/lib/ueditor/control/controller*", method = HTTPRequestMethod.GET)
	public void getController(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-Type" , "text/html");
		PrintWriter out = response.getWriter();
	  String rootPath = request.getSession().getServletContext()
				.getRealPath("/"); 
		String action = request.getParameter("action");
		String result = new ActionEnter( request, rootPath ).exec();
		//避免在线管理图片，文件路径错误
		if( action!=null && 
		   (action.equals("listfile") || action.equals("listimage") ) ){
		    	rootPath = rootPath.replace("\\", "/");
		    result = result.replaceAll(rootPath, "/");//把返回路径中的物理路径替换为 '/'
		}
		out.write( result ); 

		// final JSONRenderer renderer = new JSONRenderer(); //
	 
		final DoNothingRenderer renderer=new DoNothingRenderer(); 
		context.setRenderer(renderer);  
		//System.out.println("======renderer===" + renderer);
	}
	
	
	@RequestProcessing(value = "/js/lib/ueditor/control/controller*", method = HTTPRequestMethod.POST)
	public void getController2(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-Type" , "text/html");
		PrintWriter out = response.getWriter();
	    String rootPath = request.getSession().getServletContext()
				.getRealPath("/");
		
		String action = request.getParameter("action");
		String result = new ActionEnter( request, rootPath ).exec();
		//避免在线管理图片，文件路径错误
		if( action!=null && 
		   (action.equals("listfile") || action.equals("listimage") ) ){
		    	rootPath = rootPath.replace("\\", "/");
		    result = result.replaceAll(rootPath, "/");//把返回路径中的物理路径替换为 '/'
		} 
		out.write(result);

		// final JSONRenderer renderer = new JSONRenderer(); //
	 
		final DoNothingRenderer renderer=new DoNothingRenderer(); 
		context.setRenderer(renderer);  
		//System.out.println("======renderer===" + renderer);
	}
	 
	 
 
	/*
	 * public void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { PrintWriter out =
	 * response.getWriter(); final String rootPath =
	 * request.getSession().getServletContext() .getRealPath("/"); out.write(new
	 * ActionEnter(request, rootPath).exec());
	 * System.out.println("======renderer===" + new ActionEnter(request,
	 * rootPath).exec());
	 * 
	 * }
	 * 
	 * public void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { this.doGet(request,
	 * response); }
	 */

	/*
	 * 完成了一个使用注解描述的Servlet程序开发。
	 * 　使用@WebServlet将一个继承于javax.servlet.http.HttpServlet的类定义为Servlet组件。
	 * 　　@WebServlet有很多的属性： 　　1、asyncSupported： 声明Servlet是否支持异步操作模式。
	 * 　　2、description：　　 Servlet的描述。 　　3、displayName： Servlet的显示名称。
	 * 　　4、initParams： Servlet的init参数。 　　5、name：　　　　 Servlet的名称。
	 * 　　6、urlPatterns：　　 Servlet的访问URL。 　　7、value：　　　 Servlet的访问URL。
	 * 　　Servlet的访问URL是Servlet的必选属性，可以选择使用urlPatterns或者value定义。
	 * 　　像上面的Servlet3Demo可以描述成
	 * 
	 * @WebServlet(name="Servlet3Demo",value="/Servlet3Demo")。 　　也定义多个URL访问：
	 * 　　如@
	 * WebServlet(name="Servlet3Demo",urlPatterns={"/Servlet3Demo","/Servlet3Demo2"
	 * }) 　　或者@WebServlet(name="AnnotationServlet",value={"/Servlet3Demo",
	 * "/Servlet3Demo2"})
	 */

	/*
	 * @RequestProcessing(value = "/js/lib/ueditor/control/controller*", method
	 * = HTTPRequestMethod.POST) public void getController2(final
	 * HttpServletRequest request, final HttpServletResponse response) throws
	 * Exception { request.setCharacterEncoding("utf-8");
	 * response.setContentType("text/html"); PrintWriter out =
	 * response.getWriter(); final String rootPath =
	 * request.getSession().getServletContext() .getRealPath("/");
	 * System.out.println("====post==root==" + rootPath); System.out
	 * .println("=post=" + new ActionEnter(request, rootPath).exec());
	 * out.write(new ActionEnter(request, rootPath).exec());
	 * 
	 * }
	 */

	/*
	 * var str=(r.responseText); var c=str.trim().slice(0, -2);
	 */
}

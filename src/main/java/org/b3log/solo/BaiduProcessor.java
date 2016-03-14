package org.b3log.solo;
 
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.b3log.latke.servlet.HTTPRequestContext;
import org.b3log.latke.servlet.HTTPRequestMethod;
import org.b3log.latke.servlet.annotation.RequestProcessing;
import org.b3log.latke.servlet.annotation.RequestProcessor;
import org.b3log.latke.servlet.renderer.DoNothingRenderer;
import org.b3log.solo.service.ArticleQueryService;
import org.json.JSONObject;

import com.baidu.ueditor.ActionEnter;

import freemarker.log.Logger;  
/**
 * 注解WebServlet用来描述一个Servlet 属性name描述Servlet的名字,可选
 * 属性urlPatterns定义访问的URL,或者使用属性value定义访问的URL.(定义访问的URL是必选属性)
 */
// @WebServlet(name = "BaiduProcessor", value =
// "/js/lib/ueditor/control/controller*")
@RequestProcessor
public class BaiduProcessor {
	 @Inject
      private ArticleQueryService articleQueryService;
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
	//百度实时推送
	@RequestProcessing(value = "/articles/toPull*", method = HTTPRequestMethod.GET)
	public void toPull(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-Type" , "text/html");
		    String url = " http://data.zz.baidu.com/urls?site=istarvip.cn&token=    ";//网站的服务器连接  
	        String articleId = request.getParameter("articleId");
	        String path = request.getParameter("path");
	        final JSONObject article =articleQueryService.getArticleById(articleId);
	         String param=path+article.getString("articlePermalink");
	          
	            
	        System.out.println("==========================0"+param);
	        System.out.println("=GET=====param===" + param);
	        String result=Post(url, param);
	        PrintWriter outp = response.getWriter();
	        outp.write(result); 
			final DoNothingRenderer renderer=new DoNothingRenderer(); 
			context.setRenderer(renderer);    
	}
	
	//百度实时推送
	@RequestProcessing(value = "/articles/toPull*", method = HTTPRequestMethod.POST)
	public void toPulls(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
	    	request.setCharacterEncoding("utf-8");
		    response.setHeader("Content-Type" , "text/html");
		    String url = " http://data.zz.baidu.com/urls?site=istarvip.cn&token=  ";//网站的服务器连接  
		    String path = request.getParameter("path");
		    String articleId = request.getParameter("articleId");
		    final JSONObject article =articleQueryService.getArticleById(articleId);
	        String param=path+article.getString("articlePermalink"); 
	        System.out.println("=POST=====param===" + param); 
	        String result=Post(url, param);
	        PrintWriter outp = response.getWriter();
	        outp.write(result); 
			final DoNothingRenderer renderer=new DoNothingRenderer(); 
			context.setRenderer(renderer);    
	}
	/** 
     * 百度链接实时推送 
     * @param PostUrl 
     * @param Parameters 
     * @return 
     */  
    public static String Post(String PostUrl,String  Parameters){  
        if(null == PostUrl || null == Parameters){  
            return null;  
        }   
        String result="";  
        PrintWriter out=null;  
        BufferedReader in=null;  
        try {  
            //建立URL之间的连接  
            URLConnection conn=new URL(PostUrl).openConnection();  
            //设置通用的请求属性  
            conn.setRequestProperty("Host","data.zz.baidu.com");  
            conn.setRequestProperty("User-Agent", "curl/7.12.1");  
            conn.setRequestProperty("Content-Length", "83");  
            conn.setRequestProperty("Content-Type", "text/plain");  
               
            //发送POST请求必须设置如下两行  
            conn.setDoInput(true);  
            conn.setDoOutput(true);   
            //获取conn对应的输出流  
            out=new PrintWriter(conn.getOutputStream());  
            //发送请求参数   
            out.print(Parameters.trim());  
            //进行输出流的缓冲  
            out.flush();  
            //通过BufferedReader输入流来读取Url的响应  
            in=new BufferedReader(new InputStreamReader(conn.getInputStream()));  
            String line;  
            while((line=in.readLine())!= null){  
                result += line;  
            }   
        } catch (Exception e) {  
            System.out.println("发送post请求出现异常！"+e);  
            e.printStackTrace();  
        } finally{  
            try{  
                if(out != null){  
                    out.close();  
                }  
                if(in!= null){  
                    in.close();  
                }   
            }catch(IOException ex){  
                ex.printStackTrace();  
            }  
        }  
        return result;  
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

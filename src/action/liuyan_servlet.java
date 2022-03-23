package action;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DB;

import orm.TLiuyan;
import orm.Tuser;
import orm.Tyisheng;
import service.liuService;


public class liuyan_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
        if(type.endsWith("liuyanAdd"))
		{
			liuyanAdd(req, res);
		}
        if(type.endsWith("liuyanMine"))
		{
        	liuyanMine(req, res);
		}
		if(type.endsWith("liuyanDel"))
		{
			liuyanDel(req, res);
		}
		if(type.endsWith("liuyanMana"))
		{
			liuyanMana(req, res);
		}
		if(type.endsWith("liuyanHuifu"))
		{
			liuyanHuifu(req, res);
		}
	}
	
	
	public void liuyanAdd(HttpServletRequest req,HttpServletResponse res)
	{
		
		HttpSession session=req.getSession();
		Tuser user=(Tuser)session.getAttribute("user");
		
		String id=String.valueOf(new Date().getTime());
		String yisheng_id=req.getParameter("yisheng_id");
		String neirong=req.getParameter("neirong");
		String liuyanshi=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		
		String user_id=user.getId();
		String huifu="";
		String huifushi="";
		
		String sql="insert into t_liuyan() values(?,?,?,?,?,?,?)";
		Object[] params={id,yisheng_id,neirong,liuyanshi,user_id,huifu,huifushi};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		/*req.setAttribute("msg", "留言完毕");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);*/
		
		req.setAttribute("message", "留言完毕");
		req.setAttribute("path", "qiantai/default.jsp");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void liuyanMine(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session=req.getSession();
		Tuser user=(Tuser)session.getAttribute("user");
		
		List liuyanList=new ArrayList();
		String sql="select * from t_liuyan where user_id=?";
		Object[] params={user.getId()};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TLiuyan liuyan=new TLiuyan();
				
				liuyan.setId(rs.getString("id"));
				liuyan.setYisheng_id(rs.getString("yisheng_id"));
				liuyan.setNeirong(rs.getString("neirong"));
				liuyan.setLiuyanshi(rs.getString("liuyanshi"));
				
				liuyan.setUser_id(rs.getString("user_id"));
				liuyan.setHuifu(rs.getString("huifu"));
				liuyan.setHuifushi(rs.getString("huifushi"));
				
				liuyan.setYisheng(liuService.getYisheng(rs.getString("yisheng_id")));
				liuyan.setUser(liuService.getUser(rs.getString("user_id")));
			
				liuyanList.add(liuyan);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("liuyanList", liuyanList);
		req.getRequestDispatcher("admin/liuyan/liuyanMine.jsp").forward(req, res);
	}
	
	public void liuyanDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String sql="delete from t_liuyan where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void liuyanMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session=req.getSession();
		Tyisheng yisheng=(Tyisheng)session.getAttribute("yisheng");
		
		List liuyanList=new ArrayList();
		String sql="select * from t_liuyan where yisheng_id=?";
		Object[] params={yisheng.getId()};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TLiuyan liuyan=new TLiuyan();
				
				liuyan.setId(rs.getString("id"));
				liuyan.setYisheng_id(rs.getString("yisheng_id"));
				liuyan.setNeirong(rs.getString("neirong"));
				liuyan.setLiuyanshi(rs.getString("liuyanshi"));
				
				liuyan.setUser_id(rs.getString("user_id"));
				liuyan.setHuifu(rs.getString("huifu"));
				liuyan.setHuifushi(rs.getString("huifushi"));
				
				liuyan.setYisheng(liuService.getYisheng(rs.getString("yisheng_id")));
				liuyan.setUser(liuService.getUser(rs.getString("user_id")));
			
				liuyanList.add(liuyan);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("liuyanList", liuyanList);
		req.getRequestDispatcher("admin/liuyan/liuyanMana.jsp").forward(req, res);
	}
	
	
	public void liuyanHuifu(HttpServletRequest req,HttpServletResponse res)
	{
		String huifu=req.getParameter("huifu");
		String huifushi=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		String id=req.getParameter("id");
		
		String sql="update t_liuyan set huifu=?,huifushi=? where id=?";
		Object[] params={huifu,huifushi,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}

	
	
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (ServletException e) 
		{
                    e.printStackTrace();
		} 
		catch (IOException e) 
		{
			
		    e.printStackTrace();
		}
	}
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
	}
	
	public void destroy() 
	{
		
	}
}

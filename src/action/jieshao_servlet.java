package action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DB;

import orm.Tjieshao;

public class jieshao_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		
		if(type.endsWith("jieshaoMana"))
		{
			jieshaoMana(req, res);
		}
		
		if(type.endsWith("jieshaoEdit"))
		{
			jieshaoEdit(req, res);
		}
		if(type.endsWith("jieshaoShow"))
		{
			jieshaoShow(req, res);
		}
	}

	public void jieshaoMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
        Tjieshao jieshao=new Tjieshao();
		
		String sql="select * from t_jieshao where id=?";
		Object[] params={1};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			jieshao.setId(rs.getInt("id"));
			jieshao.setContent(rs.getString("content"));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("jieshao", jieshao);
		req.getRequestDispatcher("admin/jieshao/jieshaoMana.jsp").forward(req, res);
	}
	
	public void jieshaoEdit(HttpServletRequest req,HttpServletResponse res)
	{
		String content=req.getParameter("content");
		
		
		String sql="update t_jieshao set content=? where id=?";
		Object[] params={content,1};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "²Ù×÷³É¹¦");
		req.setAttribute("path", "jieshao?type=jieshaoMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void jieshaoShow(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
        Tjieshao jieshao=new Tjieshao();
		
		String sql="select * from t_jieshao where id=?";
		Object[] params={1};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			jieshao.setId(rs.getInt("id"));
			jieshao.setContent(rs.getString("content"));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("jieshao", jieshao);
		req.getRequestDispatcher("qiantai/jieshao/jieshaoShow.jsp").forward(req, res);
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

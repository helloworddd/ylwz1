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

import orm.Tke;

import dao.DB;


public class ke_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
        if(type.endsWith("keAdd"))
		{
			keAdd(req, res);
		}
		if(type.endsWith("keMana"))
		{
			keMana(req, res);
		}
		if(type.endsWith("keDel"))
		{
			keDel(req, res);
		}
	}
	
	
	public void keAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String id=String.valueOf(new Date().getTime());
		String mingcheng=req.getParameter("mingcheng").trim();
		String del="no";
		
		String sql="insert into t_ke(id,mingcheng,del) values(?,?,?)";
		Object[] params={id,mingcheng,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
		
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	

	public void keMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List keList=new ArrayList();
		String sql="select * from t_ke where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tke ke=new Tke();
				
				ke.setId(rs.getString("id"));
				ke.setMingcheng(rs.getString("mingcheng"));
				ke.setDel(rs.getString("del"));
				
				keList.add(ke);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		
		req.setAttribute("keList", keList);
		req.getRequestDispatcher("admin/ke/keMana.jsp").forward(req, res);
	}
	
	public void keDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String sql="update t_ke set del='yes' where id=?";
		Object[] params={id};
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

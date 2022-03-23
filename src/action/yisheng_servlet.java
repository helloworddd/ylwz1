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

import orm.Tyisheng;
import service.liuService;

import dao.DB;





public class yisheng_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		
		if(type.endsWith("yishengAdd"))
		{
			yishengAdd(req, res);
		}
		if(type.endsWith("yishengMana"))
		{
			yishengMana(req, res);
		}
		if(type.endsWith("yishengDel"))
		{
			yishengDel(req, res);
		}
		if(type.endsWith("yishengEditMe"))
		{
			yishengEditMe(req, res);
		}
		if(type.endsWith("yishengByKe"))
		{
			yishengByKe(req, res);
		}
		if(type.endsWith("yishengDetailQian"))
		{
			yishengDetailQian(req, res);
		}
		if(type.endsWith("yishengRes"))
		{
			yishengRes(req, res);
		}
	}
	
	
	public void yishengAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String id=String.valueOf(new Date().getTime());
		String xingming=req.getParameter("xingming");
		String xingbie=req.getParameter("xingbie");
		String nianling=req.getParameter("nianling");
		
		String ke_id=req.getParameter("ke_id");
		String shanchang=req.getParameter("shanchang");
		String fujian=req.getParameter("fujian");if(fujian.equals("")){fujian="/img/zanwu.jpg";}
		String leixing=req.getParameter("leixing");
		
		String loginname=req.getParameter("loginname").trim();
		String loginpw=req.getParameter("loginpw").trim();
		String del="no";
		
		
		String sql="insert into t_yisheng values(?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params={id,xingming,xingbie,nianling,ke_id,shanchang,fujian,leixing,loginname,loginpw,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
        
	}
	
	

	public void yishengMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List yishengList=new ArrayList();
		String sql="select * from t_yisheng where del='no' order by ke_id";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tyisheng yisheng=new Tyisheng();
				
				yisheng.setId(rs.getString("id"));
				yisheng.setXingming(rs.getString("xingming"));
				yisheng.setXingbie(rs.getString("xingbie"));
				yisheng.setNianling(rs.getInt("nianling"));
				
				yisheng.setKe_id(rs.getString("ke_id"));
				yisheng.setShanchang(rs.getString("shanchang"));
				yisheng.setFujian(rs.getString("fujian"));
				yisheng.setLeixing(rs.getString("leixing"));
				
				yisheng.setLoginname(rs.getString("loginname"));
				yisheng.setLoginpw(rs.getString("loginpw"));
				yisheng.setDel(rs.getString("del"));
				
				yisheng.setKe(liuService.get_ke(rs.getString("ke_id")));
				
				yishengList.add(yisheng);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("yishengList", yishengList);
		req.getRequestDispatcher("admin/yisheng/yishengMana.jsp").forward(req, res);
	}
	
	
	public void yishengDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="update t_yisheng set del='yes' where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void yishengEditMe(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String xingming=req.getParameter("xingming");
		String xingbie=req.getParameter("xingbie");
		String nianling=req.getParameter("nianling");
		
		String ke_id=req.getParameter("ke_id");
		String shanchang=req.getParameter("shanchang");
		String fujian=req.getParameter("fujian");if(fujian.equals("")){fujian="/img/zanwu.jpg";}
		String leixing=req.getParameter("leixing");
		
		String loginname=req.getParameter("loginname").trim();
		String loginpw=req.getParameter("loginpw").trim();
		//String del="no";
		
		String sql="update t_yisheng set xingming=?,xingbie=?,nianling=?,ke_id=?,shanchang=?,fujian=?,leixing=?,loginname=?,loginpw=? where id=?";
		Object[] params={xingming,xingbie,nianling,ke_id,shanchang,fujian,leixing,loginname,loginpw,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "修改成功，重新登陆后生效");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	
	public void yishengByKe(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String ke_id=req.getParameter("ke_id");
		List yishengList=new ArrayList();
		String sql="select * from t_yisheng where del='no' and ke_id=?";
		Object[] params={ke_id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tyisheng yisheng=new Tyisheng();
				
				yisheng.setId(rs.getString("id"));
				yisheng.setXingming(rs.getString("xingming"));
				yisheng.setXingbie(rs.getString("xingbie"));
				yisheng.setNianling(rs.getInt("nianling"));
				
				yisheng.setKe_id(rs.getString("ke_id"));
				yisheng.setShanchang(rs.getString("shanchang"));
				yisheng.setFujian(rs.getString("fujian"));
				yisheng.setLeixing(rs.getString("leixing"));
				
				yisheng.setLoginname(rs.getString("loginname"));
				yisheng.setLoginpw(rs.getString("loginpw"));
				yisheng.setDel(rs.getString("del"));
				
				yishengList.add(yisheng);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("yishengList", yishengList);
		req.getRequestDispatcher("qiantai/yisheng/yishengByKe.jsp").forward(req, res);
	}
	
	
	public void yishengDetailQian(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		Tyisheng yisheng=new Tyisheng();
		
		String sql="select * from t_yisheng where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			yisheng.setId(rs.getString("id"));
			yisheng.setXingming(rs.getString("xingming"));
			yisheng.setXingbie(rs.getString("xingbie"));
			yisheng.setNianling(rs.getInt("nianling"));
			
			yisheng.setKe_id(rs.getString("ke_id"));
			yisheng.setShanchang(rs.getString("shanchang"));
			yisheng.setFujian(rs.getString("fujian"));
			yisheng.setLeixing(rs.getString("leixing"));
			
			yisheng.setLoginname(rs.getString("loginname"));
			yisheng.setLoginpw(rs.getString("loginpw"));
			yisheng.setDel(rs.getString("del"));
			
			yisheng.setKe(liuService.get_ke(rs.getString("ke_id")));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		
		
		req.setAttribute("yisheng", yisheng);
		req.getRequestDispatcher("qiantai/yisheng/yishengDetailQian.jsp").forward(req, res);
	}
	
	public void yishengRes(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String xingming=req.getParameter("xingming");
		List yishengList=new ArrayList();
		String sql="select * from t_yisheng where del='no' and xingming like '%"+xingming.trim()+"%'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tyisheng yisheng=new Tyisheng();
				
				yisheng.setId(rs.getString("id"));
				yisheng.setXingming(rs.getString("xingming"));
				yisheng.setXingbie(rs.getString("xingbie"));
				yisheng.setNianling(rs.getInt("nianling"));
				
				yisheng.setKe_id(rs.getString("ke_id"));
				yisheng.setShanchang(rs.getString("shanchang"));
				yisheng.setFujian(rs.getString("fujian"));
				yisheng.setLeixing(rs.getString("leixing"));
				
				yisheng.setLoginname(rs.getString("loginname"));
				yisheng.setLoginpw(rs.getString("loginpw"));
				yisheng.setDel(rs.getString("del"));
				
				yishengList.add(yisheng);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("yishengList", yishengList);
		req.getRequestDispatcher("qiantai/yisheng/yishengRes.jsp").forward(req, res);
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

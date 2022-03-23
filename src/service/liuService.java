package service;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orm.Tjieshao;
import orm.Tke;
import orm.Tuser;
import orm.Tyisheng;


import dao.DB;

public class liuService
{
	public static List keList()
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
		return keList;
	}
	
	
	
	
	
	public static Tke get_ke(String id)
	{
		Tke ke=new Tke();
		String sql="select * from t_ke where id=?";
		Object[] params={id.trim()};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				ke.setId(rs.getString("id"));
				ke.setMingcheng(rs.getString("mingcheng"));
				ke.setDel(rs.getString("del"));
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return ke;
	}
	
	
	public static Tjieshao jieshaoShow()
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
		return jieshao;
	}
	
	public static String panduan_zhanghao(String loginname)
	{
		String s="meizhan";
		
		String sql="select * from t_user where del='no' and loginname=?";
		Object[] params={loginname.trim()};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				s="yizhan";
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return s;
	}
	
	
	public static void update_jineng_dianji(String id)
	{
		String sql="update t_jineng set dianji=dianji+1 where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	
	
	public static Tuser getUser(String id)
	{
		Tuser user=new Tuser();
		
		String sql="select * from t_user where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				user.setId(rs.getString("id"));
				user.setLoginname(rs.getString("loginname"));
				user.setLoginpw(rs.getString("loginpw"));
				user.setXingming(rs.getString("xingming"));
				
				user.setXingbie(rs.getString("xingbie"));
				user.setNianling(rs.getInt("nianling"));
				user.setZhuzhi(rs.getString("zhuzhi"));
				user.setZhiye(rs.getString("zhiye"));
				
				user.setDel(rs.getString("del"));
				
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return user;
	}
	
	
	
	
	public static Tyisheng getYisheng(String id)
	{
		Tyisheng yisheng=new Tyisheng();
		
		String sql="select * from t_yisheng where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
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
				
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return yisheng;
	}
}

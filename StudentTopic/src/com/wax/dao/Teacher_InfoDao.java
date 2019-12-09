package com.wax.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import com.neu.dao.BaseDao;
import com.wax.JavaBeen.Teacher_info;
import com.wax.service.DBCPUtilsService;

public class Teacher_InfoDao{
	public static Connection con;
	static {
		con=DBCPUtilsService.getConnection();
	}
	public int insert(Object[] ob)
	{
		int row = 0;
		String sql = "insert into t_tea_info(tea_id, tea_name, tea_grade, tea_sex,tea_phone,tea_email,tea_pwd) values(?,?,?,?,?,?,?)";
		QueryRunner qr=new QueryRunner(DBCPUtilsService.getDataSource());
		try {
			row = qr.update(sql,ob);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return row;
	}
	public int update(Teacher_info tea)
	{
		int row = 0;
		String sql = "UPDATE teacher_info SET tea_name=?,tea_sex =?,tea_academy=? ,tea_title=?,tea_phone=?,tea_email=?,tea_pwd=? where tea_id=?";
		QueryRunner qr=new QueryRunner(DBCPUtilsService.getDataSource());
		try {
			Object[] param={tea.getTea_name(),tea.getTea_sex(),tea.getTea_academy(),tea.getTea_title(),tea.getTea_phone(),tea.getTea_email(),tea.getTea_pwd(),tea.getTea_id()};
			row = qr.update(sql,param);
		} catch (SQLException e) {
			e.printStackTrace();
		}		return row;
	}
	public int delete(String no)
	{
		int row = 0;
		String sql = "delete from teacher_info where tea_id = ?";
		QueryRunner qr=new QueryRunner(DBCPUtilsService.getDataSource());
		try {
			row = qr.update(sql,no);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return row;
	}
	public List<Map<String, Object>> select()
	{
		List<Map<String, Object>> list = null;
		String sql = "select * from t_tea_info";
		QueryRunner qr=new QueryRunner();
		try {
			list = qr.query(con,sql,new MapListHandler());
		} catch (SQLException e) {
			e.printStackTrace();
		}		return list;
	}
	public List<Map<String, Object>> checkLogin(String no,String pwd)
	{
		List<Map<String, Object>> list = null;
		String sql = "select * from teacher_info where tea_id=? and tea_pwd = ? ";
		QueryRunner qr=new QueryRunner(DBCPUtilsService.getDataSource());
		Object[] ob ={no,pwd};
		try {
			list = qr.query(con,sql,new MapListHandler(),ob);
		} catch (SQLException e) {
			e.printStackTrace();
		}		return list;
	}
	public List<Map<String, Object>> findall()
	{
		List<Map<String, Object>> list = null;
		String sql="select *from teacher_info";
		QueryRunner qr=new QueryRunner();
		try {
			list = qr.query(con,sql,new MapListHandler());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Map<String, Object>> findteano(String name)
	{
		List<Map<String, Object>> list = null;
		String sql="select tea_no from t_tea_info where tea_name=?";
		QueryRunner qr=new QueryRunner();
		try {
			list = qr.query(con,sql,new MapListHandler());
		} catch (SQLException e) {
			e.printStackTrace();
		}		return list;
	}
	
}
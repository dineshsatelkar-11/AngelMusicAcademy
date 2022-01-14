package com.angel.musicacademy.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.angel.musicacademy.model.User;
import com.angel.musicacademy.service.UserService;

public class test {
	@Autowired
    private SessionFactory sessionFactory;
	@Autowired
	    private UserService userService;

	public List<String> getAllExestingJRnumbers() {
		// TODO Auto-generated method stub
		List<String> jrNos = userService.getAllExestingJRnumbers();
    	return jrNos;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try{
			List<String> users = new test().getAllExestingJRnumbers();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}

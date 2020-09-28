package com.depot.ex.admin.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.depot.ex.admin.dao.EmailDao;
import com.depot.ex.admin.dto.EmailData;
import com.depot.ex.admin.entity.Email;
import com.depot.ex.admin.service.EmailService;


@Service()
public class EmailServiceImpl implements EmailService{

	@Autowired
	private EmailDao emailDao;
	public void addEmail(Email email) {
		emailDao.addEmial(email);
	}
	public Email findById(int id) {
		return emailDao.findById(id);
	}
	public void updateManReadById(int id) {
		emailDao.updateManReadById(id);
	}
	public List<EmailData> findByUserId(int page,int size,int id,int role,String content,Integer tag) {
		return emailDao.findByUserId(page,size,id,role,content,tag);
	}
	public int findAllEmailCountByUser(int uid,int role) {
		return emailDao.findAllEmailCountByUser(uid,role);
	}
	public void updateEmail(Email email) {
		emailDao.updateEmail(email);
	}

}

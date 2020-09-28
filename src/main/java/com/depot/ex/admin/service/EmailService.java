package com.depot.ex.admin.service;

import java.util.List;

import com.depot.ex.admin.dto.EmailData;
import com.depot.ex.admin.entity.Email;


public interface EmailService {

	void addEmail(Email email);

	Email findById(int id);

	void updateManReadById(int id);

	List<EmailData> findByUserId(int page,int size,int id,int role,String content,Integer tag);

	int findAllEmailCountByUser(int uid,int role);

	void updateEmail(Email email1);


}

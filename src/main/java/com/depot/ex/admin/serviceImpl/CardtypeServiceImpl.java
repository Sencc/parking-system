package com.depot.ex.admin.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.depot.ex.admin.dao.CardtypeDao;
import com.depot.ex.admin.entity.CardType;
import com.depot.ex.admin.service.CardtypeService;


@Service()
public class CardtypeServiceImpl implements CardtypeService {

	@Autowired
	private CardtypeDao cardtypeDao;
	
	public List<CardType> findAllCardType() {
		List<CardType> cardTypes=cardtypeDao.findAllCardType();
		return cardTypes;
	}

	public CardType findCardTypeByid(int typeid) {
		return cardtypeDao.findCardTypeByid(typeid);
	}

}

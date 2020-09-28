package com.depot.ex.admin.service;

import java.util.List;

import com.depot.ex.admin.entity.CardType;


public interface CardtypeService {

	List<CardType> findAllCardType();

	CardType findCardTypeByid(int typeid);

}

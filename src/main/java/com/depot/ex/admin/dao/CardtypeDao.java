package com.depot.ex.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.depot.ex.admin.entity.CardType;


public interface CardtypeDao extends BaseDao<CardType>{

	List<CardType> findAllCardType();

	CardType findCardTypeByid(@Param("typeid")int typeid);
	
}

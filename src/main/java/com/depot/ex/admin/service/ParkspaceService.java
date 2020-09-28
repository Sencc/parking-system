package com.depot.ex.admin.service;

import java.util.List;

import com.depot.ex.admin.entity.ParkSpace;


public interface ParkspaceService {
	public void addParkspace(int count);
	
	public List<ParkSpace> findAllParkspace(int page,int size);
	public void changeStatus(int id,int status);
	public void changeStatusByParkNum(int parkNum, int status);
	public List<ParkSpace> findParkspaceByTag(int tag,int page,int size);

	public int findAllParkspaceCount(int tag);
}

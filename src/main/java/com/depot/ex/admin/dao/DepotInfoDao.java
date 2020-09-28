package com.depot.ex.admin.dao;

import com.depot.ex.admin.dto.ChargeData;
import com.depot.ex.admin.entity.DepotInfo;


public interface DepotInfoDao extends BaseDao<DepotInfo>{
	public void update(ChargeData chargeData);
	public DepotInfo findById(int id);
}

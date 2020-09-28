package com.depot.ex.admin.service;

import com.depot.ex.admin.dto.ChargeData;
import com.depot.ex.admin.entity.DepotInfo;

public interface DepotInfoService {

	void update(ChargeData chargeData);

	DepotInfo findById(int i);

}

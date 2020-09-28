package com.depot.ex.admin.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.depot.ex.admin.dao.ParkinfoDao;
import com.depot.ex.admin.dao.ParkspaceDao;
import com.depot.ex.admin.dto.FormData;
import com.depot.ex.admin.entity.ParkInfo;
import com.depot.ex.admin.entity.ParkSpace;
import com.depot.ex.admin.service.ParkinfoService;


@Service
public class ParkinfoServiceImpl implements ParkinfoService {

	@Autowired
	private ParkinfoDao parkinfoDao;
	public void saveParkinfo(FormData data) {
		Date parkin=new Date();
		ParkInfo parkInfo=new ParkInfo();
		parkInfo.setParknum(data.getParkNum());
		parkInfo.setCarnum(data.getCarNum());
		parkInfo.setCardnum(data.getCardNum());
		parkInfo.setParktem(data.getParkTem());
		parkInfo.setParkin(parkin);
		parkinfoDao.save(parkInfo);
	}
	public ParkInfo findParkinfoByParknum(int parknum) {
		return parkinfoDao.findParkinfoByParknum(parknum);
	}
	public void deleteParkinfoByParkNum(int parkNum) {
		parkinfoDao.deleteParkinfoByParkNum(parkNum);
	}
	public ParkInfo findParkinfoByCardnum(String cardnum) {
		return parkinfoDao.findParkinfoByCardnum(cardnum);
	}
	public void updateCardnum(String cardnum, String cardnumNew) {
		parkinfoDao.updateCardnum(cardnum,cardnumNew);
	}
}

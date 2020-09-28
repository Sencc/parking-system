package com.depot.ex.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.depot.ex.admin.dto.CouponData;
import com.depot.ex.admin.dto.DepotcardManagerData;
import com.depot.ex.admin.entity.CardType;
import com.depot.ex.admin.entity.Coupon;
import com.depot.ex.admin.entity.Depotcard;
import com.depot.ex.admin.entity.Income;
import com.depot.ex.admin.entity.ParkInfo;
import com.depot.ex.admin.entity.User;
import com.depot.ex.admin.service.CardtypeService;
import com.depot.ex.admin.service.CouponService;
import com.depot.ex.admin.service.DepotcardService;
import com.depot.ex.admin.service.IllegalInfoService;
import com.depot.ex.admin.service.IncomeService;
import com.depot.ex.admin.service.ParkinfoService;
import com.depot.ex.admin.service.ParkinfoallService;
import com.depot.ex.admin.service.UserService;
import com.depot.ex.utils.Constants;
import com.depot.ex.utils.Msg;


@Controller
public class CardController {

	@Autowired
	private DepotcardService depotcardService;
	@Autowired 
	private CardtypeService cardtypeService;
	@Autowired
	private UserService userService;
	@Autowired
	private ParkinfoService parkinfoService;
	@Autowired
	private IncomeService incomeService;
	@Autowired
	private CouponService couponService;
	@Autowired
	private IllegalInfoService illegalInfoService;
	@Autowired
	private ParkinfoallService parkinfoallService;
	
	@ResponseBody
	@RequestMapping("/index/card/findAllCardType")
	public Msg findAllCardType()
	{
		List<CardType> cardTypes=cardtypeService.findAllCardType();
		return Msg.success().add("cardTypes", cardTypes);
	}
	@ResponseBody
	@RequestMapping("/index/card/addDepotCard")
	@Transactional
	public Msg addDepotCard(DepotcardManagerData depotcardManagerData)
	{
		if(Integer.parseInt(depotcardManagerData.getType())!=1)
		{
			depotcardManagerData.setDeductedtime(new Date());
		}
		Depotcard depotcard=depotcardService.save(depotcardManagerData);
		double money=0;
		Income income=new Income();
		if(depotcard==null)
		{
			 return Msg.fail().add("va_msg", "账号已存在！");
		}
		int type=Integer.parseInt(depotcardManagerData.getType());
		/*if(type==1)
		{
			income.setTrueincome(0);
		}else{
			income.setTrueincome(1);
		}*/
		if(type==2)
		{
			money=depotcard.getMoney();
			money-=Constants.MONTHCARD;
			depotcard.setMoney(money);
			depotcardService.updateDepotcardBycardnum(depotcard);
			income.setMoney(Constants.MONTHCARD);
		}
		if(type==3)
		{
			money=depotcard.getMoney();
			money-=Constants.YEARCARD;
			depotcard.setMoney(money);
			depotcardService.updateDepotcardBycardnum(depotcard);
			income.setMoney(Constants.YEARCARD);
		}
		income.setCardnum(depotcard.getCardnum());
		income.setType(type);
		income.setMethod(depotcardManagerData.getPayid());
		income.setSource(0);
		income.setTime(new Date());
		incomeService.save(income);
		userService.saveByaddDepotCard(depotcardManagerData.getUsername(),depotcardManagerData.getName(),depotcard.getId());
		 return Msg.success().add("depotcard", depotcard).add("username", depotcardManagerData.getUsername());
	}
	
	@ResponseBody
	@RequestMapping("/index/card/findDepotCardByCardnum")
	public Msg findDepotCardByCardnum(@RequestParam("cardnum")String cardnum,HttpSession session)
	{
		User currentUser=(User) session.getAttribute("user");
		Depotcard depotcard=depotcardService.findByCardnum(cardnum);
		if(depotcard==null)
		{
			return Msg.fail();
		}
		int typeid=depotcard.getType();
		int cardid=depotcard.getId();
		User user=userService.findUserByCardid(cardid);
		CardType cardType=cardtypeService.findCardTypeByid(typeid);
		List<CardType> cardTypes=cardtypeService.findAllCardType();
		return Msg.success().add("depotcard", depotcard).add("cardType", cardType)
				.add("cardTypes", cardTypes).add("user", user).add("user_role", currentUser.getRole());
	}
	@ResponseBody
	@RequestMapping("/index/card/alertDepotCard")
	public Msg alertDepotCard(DepotcardManagerData depotcardManagerData)
	{
			
		Depotcard depotcard=depotcardService.findByCardnum(depotcardManagerData.getCardnum());
		if(depotcardManagerData.getType()==null)
		{
			depotcardManagerData.setType(Integer.toString(depotcard.getType()));
		}
		if(depotcardManagerData.getIslose()!=depotcard.getIslose()
				||Integer.parseInt(depotcardManagerData.getType())!=depotcard.getType())
		{
			depotcard.setIslose(depotcardManagerData.getIslose());
			depotcard.setType(Integer.parseInt(depotcardManagerData.getType()));
			depotcardService.updateDepotcardBycardnum(depotcard);
		}else{
			return Msg.fail();
		}
		return Msg.success();
	}
	@ResponseBody
	@RequestMapping("/index/card/deleteDepotCard")
	@Transactional
	public Msg deleteDepotCard(@RequestParam("cardnum")String cardnum)
	{
		Depotcard depotcard=depotcardService.findByCardnum(cardnum);
		int cardid=depotcard.getId();
		ParkInfo parkInfo=parkinfoService.findParkinfoByCardnum(cardnum);
		//正在停车不能删
		if(parkInfo!=null)
		{
			return Msg.fail().add("va_msg", "有车辆在停车，不能删除！");
		}
		userService.deleteUserByCardid(cardid);
		depotcardService.deleteDepotCard(cardnum);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("/index/card/findCoupon")
	public Msg findCoupon(@RequestParam("cardnum")String cardnum)
	{
		List<CouponData> list=couponService.findAllCouponByCardNum(cardnum, "");
		if(list!=null&&list.size()>0)
		{
			return Msg.success().add("val", list.get(0).getMoney());
		}
		return Msg.fail();
	}
	
	
	/**
	 * 充值提交
	 */
	@ResponseBody
	@RequestMapping("/index/card/rechargeDepotCardSubmit")
	public Msg rechargeDepotCardSubmit(DepotcardManagerData depotcardManagerData){
		Depotcard depotcard=depotcardService.findByCardnum(depotcardManagerData.getCardnum());
		Income income=new Income();
		if(depotcard==null)
		{
			return Msg.fail().add("va_msg", "该停车卡不存在，请重新输入！");
		}
		double money=depotcard.getMoney()+depotcardManagerData.getMoney();
		List<CouponData> list=couponService.findAllCouponByCardNum(depotcardManagerData.getCardnum(), "");
		if(list!=null&&list.size()>0)
		{
			couponService.deleteCoupon(list.get(0).getId());
		}
		try {
			depotcardService.addMoney(depotcardManagerData.getCardnum(),money);
		} catch (Exception e) {
			return Msg.fail().add("va_msg", "出现错误！");
		}
		income.setCardnum(depotcardManagerData.getCardnum());
		income.setType(depotcard.getType());
		income.setSource(0);
		income.setMethod(depotcardManagerData.getPayid());
		income.setMoney(money);
		income.setTime(new Date());
		incomeService.save(income);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("/index/card/changeLoseCard")
	@Transactional
	public Msg changeLoseCard(DepotcardManagerData depotcardManagerData)
	{
		String cardnum=depotcardManagerData.getCardnum();
		Depotcard depotcard=depotcardService.findByCardnum(cardnum);
		User user=userService.findUserByCardid(depotcard.getId());
		if(StringUtils.isEmpty(cardnum))
		{
			return Msg.fail();
		}
		Date date=new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String trans=formatter.format(date);
		String dateStr=trans.replaceAll(" ", "").replaceAll("-", "");
		String cardnumNew=user.getUsername()+dateStr;
		Depotcard depotcardNew=depotcardService.findByCardnum(cardnumNew);
		if(depotcardNew!=null)
		{
			return Msg.fail();
		}
		depotcardService.updateCardnum(cardnum,cardnumNew);
		couponService.updateCardnum(cardnum,cardnumNew);
		illegalInfoService.updateCardnum(cardnum,cardnumNew);
		incomeService.updateCardnum(cardnum,cardnumNew);
		parkinfoService.updateCardnum(cardnum,cardnumNew);
		parkinfoallService.updateCardnum(cardnum,cardnumNew);
		depotcardNew=depotcardService.findByCardnum(cardnumNew);
		depotcardNew.setIslose(0);
		depotcardService.updateDepotcardBycardnum(depotcardNew);
		return Msg.success();
	}
	@ResponseBody
	@RequestMapping("/index/card/isAlertType")
	public Msg isAlertType(DepotcardManagerData depotcardManagerData)
	{
		Depotcard depotcard=depotcardService.findByCardnum(depotcardManagerData.getCardnum());
		if(depotcardManagerData.getType()==null)
		{
			depotcardManagerData.setType(Integer.toString(depotcard.getType()));
		}
		if(depotcard.getType()!=Integer.parseInt(depotcardManagerData.getType()))
		{
			if(Integer.parseInt(depotcardManagerData.getType())>1)
			{
				double money=depotcard.getMoney();
				List<CouponData> listCou=couponService.findAllCouponByCardNum(depotcard.getCardnum(), "");
				if(listCou!=null&&listCou.size()>0)
				{
					money+=listCou.get(0).getMoney();
				}
				//假如是月卡
				if(Integer.parseInt(depotcardManagerData.getType())==2)
				{
					
					if(money<Constants.MONTHCARD)
					{
						return Msg.fail().add("money_pay", Constants.MONTHCARD-money);
					}else{
						return Msg.success().add("money_pay", Constants.MONTHCARD);
					}
				}else{
					if(money<Constants.YEARCARD)
					{
						return Msg.fail().add("money_pay", Constants.YEARCARD-money);
					}else{
						return Msg.success().add("money_pay", Constants.MONTHCARD);
					}
				}
			}
		}
		return Msg.success().add("money_pay", 0);
	}
	
}

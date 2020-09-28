package com.depot.ex.admin.controller;

import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.depot.ex.admin.dto.CouponData;
import com.depot.ex.admin.entity.Coupon;
import com.depot.ex.admin.entity.Depotcard;
import com.depot.ex.admin.entity.Income;
import com.depot.ex.admin.entity.User;
import com.depot.ex.admin.service.CouponService;
import com.depot.ex.admin.service.DepotcardService;
import com.depot.ex.admin.service.IncomeService;
import com.depot.ex.admin.service.UserService;
import com.depot.ex.utils.Msg;


@Controller
public class CouponController {
	
	@Autowired
	private CouponService couponService;
	@Autowired
	private UserService userService;
	@Autowired
	private DepotcardService depotcardService;
	
	@ResponseBody
	@RequestMapping("/index/coupon/findCouponById")
	public Msg findCouponById(@RequestParam("id") Integer id)
	{
		Coupon coupon=couponService.findCouponById(id.intValue());
		if(coupon==null)
		{
			return Msg.fail().add("va_msg", "查询出错，请刷新页面！");
		}
		return Msg.success().add("coupon", coupon);
	}
	@ResponseBody
	@RequestMapping("/index/coupon/deleteCoupon")
	public Msg deleteCoupon(@RequestParam("id") Integer id)
	{
		Coupon coupon=couponService.findCouponById(id.intValue());
		if(coupon==null)
		{
			return Msg.fail().add("va_msg", "删除出错，请刷新页面！");
		}else{
			couponService.deleteCoupon(id);
			return Msg.success().add("va_msg", "删除成功！");
		}
	}
	
	//生成优惠券
	@ResponseBody
	@RequestMapping("/index/coupon/setCoupon")
	public Msg setCoupon(CouponData couponData)
	{
		int money=couponData.getMoney();
		int count=couponData.getCount();
		if(userService.findAllUserCount(3)<count)
		{
			return Msg.fail().add("va_msg", "超过用户数量，请重新输入！");
		}
		List<User> list=userService.finAllUserByRole(3); 
		Set<User> userSet=new HashSet<User>();
		for(User user:list)
		{
			userSet.add(user);
		}
		Iterator<User> it = userSet.iterator();  
		int c=0;
		try {
			while (it.hasNext()) {  
				if(c>=count)
				{
					break;
				}
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");
				User user = it.next();
				Depotcard depotcard=depotcardService.findByCardid(user.getCardid());
				Coupon coupon=new Coupon();
				coupon.setCouponNum(uuid);
				coupon.setCardnum(depotcard.getCardnum());
				coupon.setMoney(money);
				coupon.setTime(new Date());
				couponService.addCoupon(coupon);
				c++;
			}  
		} catch (Exception e) {
			return Msg.fail().add("va_msg", "系统出错！");
		}
		return Msg.success();
	}
}

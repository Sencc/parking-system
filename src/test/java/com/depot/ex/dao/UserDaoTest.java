package com.depot.ex.dao;

import org.apache.ibatis.annotations.Param;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.depot.ex.admin.dao.UserDao;
import com.depot.ex.admin.entity.User;

/**
 * *
 * 
 * @author ???? E-mail: *
 * @date ???????2017??10??6?? ????4:46:06 *
 * @version 1.0 *
 * @parameter *
 * @since *
 * @return
 */
public class UserDaoTest extends BaseTest {

	@Autowired
	private UserDao userDao;
	/*@Test
	public void addUserTest() {
		String username="zhangsan";
		String name="????";
		String password="abcisme123";
		String sex="??";
		String tel="13149382427";
		int role=1;
		int result=userDao.addUser(username, name, password, sex, tel, role);
		System.out.println(result);
	}
	@Test
	public void findUserByIdTest() {
		User user=userDao.findUserById(1);
		System.out.println(user.toString());
	}*/
}

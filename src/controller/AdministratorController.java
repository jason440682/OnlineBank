package controller;

import model.Administrator;

import com.jfinal.core.Controller;

public class AdministratorController extends Controller {

		public void login(){
			String name=getPara("name");
			String password=getPara("password");

			Administrator administrator=Administrator.dao.findById(name);

			if(administrator==null){
				setAttr("msg","用户名不存在");
				render("/index.jsp");
			}else if(!password.equals(administrator.getStr("password"))){
				setAttr("msg","密码错误");
				render("/index.jsp");
			}else{
				
				this.setSessionAttr("admin", name);
				
				render("/admin/administrator.jsp");
			}
			
		}
		
		public void back(){
			render("/admin/administrator.jsp");
		}
}

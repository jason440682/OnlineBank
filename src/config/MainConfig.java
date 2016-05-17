package config;

import intercepter.I18NInterceptor;
import model.Administrator;
import model.Customer;
import model.DebitCard;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;

import controller.AdministratorController;
import controller.DebitCardController;
import controller.IndexController;


public class MainConfig extends JFinalConfig {

	@Override
	public void configConstant(Constants con) {
		con.setDevMode(true);
		con.setViewType(ViewType.JSP);
		
	}

	@Override
	public void configHandler(Handlers arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void configInterceptor(Interceptors me) {
		  //me.add(new I18nInterceptor("_locale", "_res", true)); 
		 me.addGlobalActionInterceptor(new I18NInterceptor()); 
	}

	@Override
	public void configPlugin(Plugins plugin) {
		
		C3p0Plugin cp = new C3p0Plugin("jdbc:mysql://127.0.0.1:3307/online_bank", "root","liangjia1994");
		plugin.add(cp);		
		ActiveRecordPlugin arp = new ActiveRecordPlugin(cp);
		plugin.add(arp);
		arp.addMapping("adminstrator","admin_account",Administrator.class);
		arp.addMapping("customer", " customer_id",Customer.class);
		arp.addMapping("debit_card", "card_num",DebitCard.class);
	
	}

	@Override
	public void configRoute(Routes route) {
		route.add("/",IndexController.class);
		route.add("/administrator",AdministratorController.class);
		route.add("/debitCard",DebitCardController.class);
	
	}

}
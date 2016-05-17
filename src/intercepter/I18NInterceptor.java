package intercepter;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Const;
import com.jfinal.core.Controller;
import com.jfinal.render.Render;

public class I18NInterceptor  implements Interceptor {	
	@Override
	public void intercept(Invocation inv) {
		 
		 
		 inv.invoke();
		 String locale=  inv.getController().getCookie("_locale");
		 Render render = inv.getController().getRender();
		
		 System.out.println("_locale："+locale);
		 
		 if(locale==null){
			 
			inv.getController().setCookie("_locale", "en_US",86400);
		 }
		 if("zh_CN".equals(locale)){
			  render.setView("/zh_CN/" + render.getView());  
		  }
		  else {
			  render.setView("/en_US/" + render.getView());			   
		  }
		    
	
		System.out.println("After method invoking"); 
	}

}

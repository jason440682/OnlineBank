package controller;

import java.util.List;

import model.Administrator;
import model.Customer;
import model.DebitCard;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class DebitCardController extends Controller{
	
	public void show(){
		render("debitCard/"+getPara(0)+".jsp");
	}
		
	
	public void open(){
		String customer_name=getPara("customer_name");
		String customer_id=getPara("customer_id");
		String PIN1=getPara("PIN1");
		String PIN2=getPara("PIN2");
		
		Customer customer=Customer.dao.findById(customer_id);
		
		
		if(customer==null){
			if(PIN1.equals(PIN2)){
				
				Record cus =new Record();
				cus.set("customer_id",customer_id).set("customer_name",customer_name);
				Db.save("customer", cus);
				
				String card_num=generateCardNum();
				Record card=new Record();
				card.set("customer_id",customer_id )
				        .set("card_num",card_num)
				        .set("PIN", PIN1)
				        .set("status","Normal")
				        .set("amount",0);
				Db.save("debit_card",card);
				
				setAttr("customer_name",customer_name);
				setAttr("card_num",card_num);
				render("debitCard/open_success.jsp");
				
			}else{
				render("debitCard/open.jsp");
				setAttr("msg1","The two PINs are not the same!");
			}
		}else{
			render("debitCard/open.jsp");
			setAttr("msg2","The customer id number has been occupied!");
		}

		
	}
	
	public void inquiry(){
		String customer_id = getPara("customer_id");
		String sql="select * from debit_card where customer_id='"+customer_id+"'";
		List<DebitCard> cards = DebitCard.dao.find(sql);
		
		if(cards==null){
			setAttr("msg","no record match the customer_id");
			render("debitCard/inquiry.jsp");
		}
		
		Customer cus=Customer.dao.findById(customer_id);
		
		setAttr("customer_name",cus.getStr("customer_name"));
		setAttr("cards",cards);
		render("debitCard/card_status.jsp");
	}
	
	public void withdrawal(){
		String card_num=getPara("card_num");
		double amount=Double.valueOf(getPara("amount"));
		double balance;
		boolean canUpdate=true;
		
		DebitCard debit_card=DebitCard.dao.findById(card_num);
		
		if(debit_card==null){
				setAttr("msg","This account is not exit");
				render("debitCard/withdrawal.jsp");	
		}else{
			if(!debit_card.getStr("status").equals("Normal")){
				setAttr("msg","The account can not use");
				render("debitCard/withdrawal.jsp");
				canUpdate=false;
			}
		    
			if(amount>debit_card.getDouble("amount")){
				System.out.println("more:");
				setAttr("msg","There is not enough to withdrawal");
				render("debitCard/withdrawal.jsp");
				canUpdate=false;
			}
			
			balance=debit_card.getDouble("amount")-amount;
			debit_card.set("amount", amount);
			
			if(canUpdate){
				if(!debit_card.update()){
					setAttr("msg","fail");
					render("debitCard/withdrawal.jsp");
				}else{
					setAttr("type","deposit");
					setAttr("card_num",card_num);
					setAttr("balance",balance);;
					render("debitCard/amount_change_success.jsp");
				}	
			}		
		}
		
				
	}
	
	public void deposit(){
		String card_num=getPara("card_num");
		double amount=Double.valueOf(getPara("amount"));
		double balance;
		System.out.println("card_num:"+card_num);
		System.out.println("amout:"+amount);
	
		DebitCard debit_card=DebitCard.dao.findById(card_num);
		
		if(debit_card==null){
				setAttr("msg","This account is not exit");
				render("debitCard/deposit.jsp");
		
		}else{
			if(!debit_card.getStr("status").equals("Normal")){
				setAttr("msg","The account can not use");
				render("debitCard/deposit.jsp");
			}
			balance=amount+debit_card.getDouble("amount");
			debit_card.set("amount", amount);
			if(!debit_card.update()){
				setAttr("msg","fail");
				render("debitCard/deposit.jsp");
			}else{
				setAttr("type","deposit");
				setAttr("card_num",card_num);
				setAttr("balance",balance);;
				render("debitCard/amount_change_success.jsp");
			}			
		
		}
	}
	
	public void auth_code(){
		
		String auth_code=getPara(0);
		String name = this.getSessionAttr("admin");
	    Administrator admin=Administrator.dao.findById(name);
		
	    System.out.println("au_co"+auth_code);
	    
		if(auth_code.equals(admin.getStr("auth_code"))){
			System.out.println("right");		
			renderText("1");
		}else{
			System.out.println("here");
			renderText("0");
		}
	}
	
	private String generateCardNum(){
		
		String num="0123456789";
		String card_num="";
		int index;
		for(int i=0;i<16;i++){
			index=(int)(Math.random()*10);
			card_num = card_num+num.charAt(index);
		}

		return card_num;
		
	}
	
	
}

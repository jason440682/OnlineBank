package test;

public class Test1 {

	public static void main(String[] args) {

		String card_num="";
		for(int i=0;i<16;i++){
			int a=(int)(Math.random()*10);		
			card_num=card_num+ String.valueOf(a);			
		}

		System.out.println(card_num);
		
		
		
	}
	
	

}

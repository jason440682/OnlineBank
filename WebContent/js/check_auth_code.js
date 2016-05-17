function check(){
			var amount=document.getElementById("amount").value;
			if(!isNaN(amount)&&amount>0){
	                
				if(amount>5000){
				    
				    var auth_code=prompt("please input the authentication code ","");
					 
					var xmlhttp=new XMLHttpRequest();
					xmlhttp.open("GET","/OnlineBank/debitCard/auth_code/"+auth_code,true);
					xmlhttp.send();
	                
	                xmlhttp.onreadystatechange=function(){
	                		if (xmlhttp.readyState==4 && xmlhttp.status==200)
	                  		{
	                			var res=xmlhttp.responseText;
	                			if(res=="1"){
	        						document.getElementById('form').submit();	
	        					}else{
	        						alert(" the authentication code is not correct :");
	        					}	                
	                  		}
	                }
				
				}else{
				 	document.getElementById('form').submit();
				}
			}else{
				   alert("please input the right amout of money");
			}
		
			
}
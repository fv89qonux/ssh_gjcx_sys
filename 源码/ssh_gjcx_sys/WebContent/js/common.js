	
	/**
	 * 去掉前后空格
	 * @param {Object} m
	 * @return {TypeName} 
	 */
 	function trim(s)   
	{   
		    try  
		    {   
		        return s.replace(/^\s+|\s+$/g,"");   
		    }   
		    catch(e)   
		    {   
		        return s;   
		    }   
	}  



//判断值是否为空
	function IsNotNull(value) {
		if(value =="" || value == null || value =="null" || value =="undefined" ||trim(value)==""){
			return false;
		}
		return true;
	}
	
	//只能是数字
	function IsNum(value){
	    var pattern=/^[\d]+$/;
	    var gotIt = pattern.exec(value); 
	    if(!gotIt){
	        return false;
	    }
	    else{
	    	return true;
	    }
	}
	
	//只能是数字，常规标点，,、
	function IsMobile(value){
	    var pattern=/^[\d，,、]+$/;
	    var gotIt = pattern.exec(value); 
	    if(!gotIt){
	        return false;
	    }
	    else{
	    	return true;
	    }
	}
	
	//只能含有数字、英文或中文
	function IsWordNumOrChinese(value){
	    var pattern=/^[\dA-Za-z,、\u0391-\uFFE5]+$/;
	    var gotIt = pattern.test(value); 
	    if(!gotIt){
	        return false;
	    }
	    else{
	    	return true;
	    }
	}
	
	//只能含有数字、英文
	function IsWordNum(value){
	    var pattern=/^[\dA-Za-z,、]+$/;
	    var gotIt = pattern.test(value); 
	    if(!gotIt){
	        return false;
	    }
	    else{
	    	return true;
	    }
	}
	
	
	function IsWordOrChinese(value){
	    var pattern=/^[A-Za-z,、\u0391-\uFFE5]+$/;
	    var gotIt = pattern.test(value); 
	    if(!gotIt){
	        return false;
	    }
	    else{
	    	return true;
	    }
	}
	
	//验证工商注册号
 	function CheckRegNO(obj) {
 		//_error = document.getElementById("errorId");
 		var value = obj.value;   
 		if( !IsNotNull(value)){
 			//_error.innerHTML = "注册号 不能为空，请输入!";
 			alert( "工商注册号 不能为空，请输入!");
 		} else if(!IsWordNumOrChinese(value)) {
 			alert("工商注册号 含非法字符，请重新输入!");
 			
 		}else if(value.length!=15){
 			alert("工商注册号 长度非法，注册号为长度固定15位，请重新输入!");
 		} else {
 			//_error.innerHTML ="";
 			return true;
 		}
 		return false;
	}
	
	var firstInputs  = document.getElementsByTagName("input");
	var firstLength = firstInputs.length;
	var firstValues = new Array();
	var lastValues = new Array();
	var flag = false;
	for(var i=0;i<firstLength;i++) {
		firstValues[i] = trim(firstInputs[i].value)
	}
	/**
	 *如果页面值有改动则返回true
	 * @return {TypeName} 
	 */
	function CheckValueIsUpdate() {
		var lastInputs  = document.getElementsByTagName("input");
		var lastLength = firstInputs.length
		for(var i=0;i<lastLength;i++) {
			lastValues[i] = trim(lastInputs[i].value);
			if(lastValues[i] != firstValues[i] ) {
				flag = true;
				break;
			}
			//alert(firstValues[i] +"*"+lastValues[i]);
		}
		if(flag==false) {
			alert("该页面没有任何改动!");
			return false;
		}
		return true;
	}
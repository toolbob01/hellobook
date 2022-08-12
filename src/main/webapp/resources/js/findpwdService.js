var findPwdService = (function() {
	function checkEmail(email, callback, err) {
		var data = {
				email:email
		} 
		$.ajax({
			type:"post",
			url:"/findpwd/checkemail",
			data:JSON.stringify(data),
			contentType:'application/json; charset = utf-8',
			success: function(result,status,xhr) {
				if(callback){
					callback(result);
				}
			},error: function(xhr,status,er){
				if(err){
					err();
				}
			}
		})
	}
	
	function getCode(email,callback,err) {
		$.ajax({
			type : "get",
			url : "/findpwd/getcode?email=" + email,
			success : function(result){
				if(callback){
					callback(result);
				}
			},error: function(xhr,status,er){
				if(err){
					err();
				}
			}
		})
	}
	
	function changePwd(userData,callback,err) {
		$.ajax({
			type:'post',
			url:'/findpwd/changePwd',
			data:JSON.stringify(userData),
			contentType : "application/json",
			success:function(result){
				if(callback){
					callback(result);
				}
			},error: function(xhr,status,er){
				if(err){
					err();
				}
			}
		})
	}

	return {checkEmail:checkEmail, getCode:getCode, changePwd:changePwd};
})();
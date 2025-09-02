// 전체메뉴만들기 js

//<![CDATA[
$(function(){
		$(".total_btn>a").bind("mouseover click focus",function(){	
			$("#total_box").slideDown("fast");
		});
	
		var tot1_val=true;
		var tot2_val=true;

		$(".total_btn").mouseenter(function(){
			tot1_val=false;
		});
		$("#total_box").mouseenter(function(){
			tot2_val=false;		
		});

		$(".total_btn").mouseleave(function(){
			tot1_val=true;
			setTimeout(function(){if(tot1_val && tot2_val) $("#total_box").slideUp("fast");},200)		
		});
		$("#total_box").mouseleave(function(){
			tot2_val=true;
			setTimeout(function(){if(tot1_val && tot2_val) $("#total_box").slideUp("fast");},200)		
		});

		$(".total_btn_close a").click(function(){
			$("#total_box").slideUp("fast");
		})
});
  //]]>


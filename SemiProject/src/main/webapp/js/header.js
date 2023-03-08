$(".sub-navi").hide();
$(".category").on("mouseenter", function(){
    $(".sub-navi").show();
    $(".sub-navi-background").show();
    $("nav").css("border-bottom", "none");
});
$(".sub-navi").on("mouseenter", function(){
    $(".sub-navi").show();
    $("nav").css("border-bottom", "none");
});
$(".category").on("mouseleave", function(){
    $(".sub-navi").hide();
    $("nav").css("border-bottom", "1px solid #ccc");
});
$(".sub-navi").on("mouseleave", function(){
    $(".sub-navi").hide();
    $("nav").css("border-bottom", "1px solid #ccc");
});




$(".more-btn").on("click", function(event){
	    $(this).parent().parent().next().show();
	    // 버블링 막기
	    event.stopPropagation();
	});
function moreFunc(){
	$(".more-btn").on("click", function(event){
	    $(this).parent().parent().next().show();
	    // 버블링 막기
	    event.stopPropagation();
	});
}

$(document).on("click", function(){
    $(".comment-update").hide();
});
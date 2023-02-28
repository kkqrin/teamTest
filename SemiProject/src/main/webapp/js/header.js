$(".sub-navi").hide();
$(".category").on("mouseenter", function(){
    $(".sub-navi").show();
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
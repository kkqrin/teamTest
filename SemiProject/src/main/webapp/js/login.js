$(".long-input").on("focusin",function(event){
    $(this).css("border-bottom", "2px solid black");
});
$(".long-input").on("focusout",function(event){
    $(this).css("border-bottom", "1px solid #ccc");
});
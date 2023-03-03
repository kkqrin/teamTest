$(".mid-input").on("focusin",function(event){
    $(this).css("border-bottom", "2px solid black");
});
$(".mid-input").on("focusout",function(event){
    $(this).css("border-bottom", "1px solid #ccc");
});
$(".long-input").on("focusin",function(event){
    $(this).css("border-bottom", "2px solid black");
});
$(".long-input").on("focusout",function(event){
    $(this).css("border-bottom", "1px solid #ccc");
});

const necessarycheck = document.querySelector("#necessarycheck");
necessarycheck.addEventListener("change",function(){
    const status = this.checked;
    const subcheck = document.querySelectorAll("[name = subcheck]");
    for(let i = 0; i<subcheck.length; i++){
        subcheck[i].checked = status;
    }
});

const choicecheck = document.querySelector("#choicecheck");
choicecheck.addEventListener("change",function(){
    const status = this.checked;
    const subcheck2 = document.querySelectorAll("[name = subcheck2]");
    for(let i = 0; i<subcheck2.length; i++){
        subcheck2[i].checked = status;
    }
});

$(".plus").on("click",function(){
    const plus = "img/plus-math-24.png";
    const minus = "img/subtract-25.png";
    const current  = $(this).attr("src");
    if(current == plus){
        $(this).attr("src",minus); 
        $(".sub-agree-check").css("display","block");
    }else{
        $(this).attr("src",plus);        
        $(".sub-agree-check").css("display","none");
    }
});

$(".plus2").on("click",function(){
    const plus = "img/plus-math-24.png";
    const minus = "img/subtract-25.png";
    const current  = $(this).attr("src");
    if(current == plus){
        $(this).attr("src",minus); 
        $(".sub-agree-check2").css("display","block");
    }else{
        $(this).attr("src",plus);        
        $(".sub-agree-check2").css("display","none");
    }
});
$("[name = memberPw]").on("change",function(){
    const pwReg = /^[a-zA-Z0-9!@#$^]{8,16}$/;
    const inputPw = $(this).val();
    const check = pwReg.test(inputPw);
    if(check){
        $(this).next().text("안전한 비밀번호 입니다.");
        $(this).next().css("color","green");
    }else{
         $(this).next().text("비밀번호는 영어 소문자, 대문자, 숫자로 8~16글자 입니다.");
        $(this).next().css("color","red");
    }
});


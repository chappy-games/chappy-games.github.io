[_tb_system_call storage=system/_scene1.ks]

*start

[playse  volume="20"  time="1000"  buf="0"  storage="touch/head.mp3"  ]
[tb_image_hide  time="1000"  ]
[playbgm  volume="30"  time="1000"  loop="true"  storage="scene1.mp4"  ]
[bg  storage="bk001.png"  time="50"  ]
[chara_show  name="aaa"  time="1000"  wait="false"  left=""  top=""  width="640"  height="960"  reflect="false"  storage="chara/6/masiro001body.png"  ]
[chara_part  name="aaa"  time="1000"  a="masiro001a.png"  b="masiro001b.png"  z="none"  c="none"  z1="none"  z2="none"  g="none"  face="none"  d="none"  ]
[tb_start_tyrano_code]
;========================
; 初期化
;========================

[if exp="typeof f.ex === 'undefined'"]
[eval exp="f.ex = 0"]
[endif]

[if exp="typeof f.scene_stage === 'undefined'"]
[eval exp="f.scene_stage = 1"]
[endif]

[if exp="typeof f.last_touch === 'undefined'"]
[eval exp="f.last_touch = ''"]
[endif]

[if exp="typeof f.head_count === 'undefined'"]
[eval exp="f.head_count = 0"]
[endif]

[if exp="typeof f.shoulder_count === 'undefined'"]
[eval exp="f.shoulder_count = 0"]
[endif]


[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[iscript]

$("head").append(`
<style>

.event-setting-element{
cursor:url("./data/image/ui/hand.png") 16 16, pointer !important;
}

.event-setting-element:hover{
cursor:url("./data/image/ui/hand_hover.png") 24 24, pointer !important;
}

</style>
`);

[endscript]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[iscript]
f.love = 0;
f.excite = 0;

f.ex_cutin50 = false;
f.love_text = "LOVE:" + f.love;
f.love_box = Math.max(0, Math.min(Math.floor(f.love / 10),5));
f.love_bar = "■".repeat(f.love_box) + "□".repeat(5 - f.love_box);

f.excite_text = "EXCITE:" + f.excite;

f.excite_box =Math.max(0,Math.min(Math.floor(f.excite / 10),10));
f.excite_bar ="■".repeat(f.excite_box) +"□".repeat(10 - f.excite_box);
[endscript]


[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[iscript]

$(document).off("mouseenter.face_hover");
$(document).on("mouseenter.face_hover", ".event-setting-element.face_hover_area", function(){

var hover_msgs = ["……？","……見すぎ","……なに"];
f.msg = hover_msgs[Math.floor(Math.random() * hover_msgs.length)];

TYRANO.kag.ftag.startTag("chara_part", {"name":"aaa","part":"face","id":"look_away.png"});

TYRANO.kag.ftag.startTag("free", {"layer":"fix","name":"msg_ui"});
TYRANO.kag.ftag.startTag("ptext", {"name":"msg_ui","layer":"fix","x":"220","y":"460","size":"34","color":"0xffffff","edge":"4px #000000","text":f.msg});

});

$(document).off("mouseleave.face_hover");
$(document).on("mouseleave.face_hover", ".event-setting-element.face_hover_area", function(){

TYRANO.kag.ftag.startTag("chara_part", {"name":"aaa","part":"face","id":"normal.png"});

TYRANO.kag.ftag.startTag("free", {"layer":"fix","name":"msg_ui"});

});

[endscript]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
;==============================
; Scene1 ハート演出開始
; EX10～19：1個
; EX20～39：2個
;==============================

[iscript]
(function(){

// 二重起動防止
if(window.fhf_heart_timer){
clearInterval(window.fhf_heart_timer);
}
$("#fhf_heart_layer").remove();

// ハート表示レイヤー
var $layer = $('<div id="fhf_heart_layer"></div>');
$layer.css({
position:"absolute",
left:"0px",
top:"0px",
width:"100%",
height:"100%",
"z-index":9998,
"pointer-events":"none"
});
$("#tyrano_base").append($layer);

// Scene1用：640×960想定の固定位置
window.fhf_heart_pos_s1 = [
{x:230, y:150},
{x:405, y:160},
{x:185, y:300},
{x:450, y:315}
];

// ハート1個をふわっと出す
window.fhf_spawn_heart_s1 = function(pos){

var size = 28 + Math.random() * 14;

var $h = $('<img class="fhf_heart">');
$h.attr("src","./data/fgimage/mashiro/effect/heart.png");
$h.css({
position:"absolute",
left:pos.x+"px",
top:pos.y+"px",
width:size+"px",
height:"auto",
opacity:0,
"pointer-events":"none"
});

$("#fhf_heart_layer").append($h);

$h.animate({
opacity:1,
top:(pos.y-18)+"px"
},400)
.animate({
opacity:0,
top:(pos.y-65)+"px"
},1200,function(){
$(this).remove();
});
};

// 定期表示
window.fhf_heart_timer = setInterval(function(){

var ex = f.excite || 0;

// Scene1範囲のみ
if(ex >= 20 && ex <= 39){
fhf_spawn_heart_s1(fhf_heart_pos_s1[0]);
setTimeout(function(){
fhf_spawn_heart_s1(fhf_heart_pos_s1[1]);
},350);
}
else if(ex >= 10 && ex <= 19){
fhf_spawn_heart_s1(fhf_heart_pos_s1[0]);
}

},2200);

})();
[endscript]
[_tb_end_tyrano_code]

*main_loop

[tb_start_tyrano_code]
[if exp="f.excite >= 40"]

;==============================
; ハート演出停止
;==============================
[iscript]
if(window.fhf_heart_timer){
clearInterval(window.fhf_heart_timer);
window.fhf_heart_timer = null;
}
$("#fhf_heart_layer").remove();
[endscript]

[eval exp="f.scene_stage = 2"]

[jump storage="scene2.ks" target="*start"]

[endif]
[_tb_end_tyrano_code]

[clickable  storage="s1_head_touch.ks"  x="246"  y="60"  width="155"  height="108"  target="*head"  _clickable_img="masiro001a.png"  ]
[clickable  storage="s1_shoulder_touch.ks"  x="241"  y="204"  width="207"  height="55"  target="*shoulder"  _clickable_img=""  ]
[clickable  storage="s1_thighs_touch.ks"  x="235"  y="514"  width="131"  height="202"  target="*thighs1"  _clickable_img="masiro001a.png"  ]
[clickable  storage="eye.ks"  x="265"  y="127"  width="100"  height="100"  target="*eye"  _clickable_img=""  ]
[tb_start_tyrano_code]
[iscript]
$(".event-setting-element").last().addClass("face_hover_area");
[endscript]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[iscript]

if (f.excite < 20) {
f.wait_face = "normal";
} else {
f.wait_face = "soft_blush";
}

[endscript]

[if exp="f.wait_face == 'normal'"]
[_tb_end_tyrano_code]

[chara_part  name="aaa"  time="300"  目="aka001aa.png"  頬="none"  口="aka001h.png"  眉="aka003a.png"  感情="none"  aa="1.png"  腕="akac001.png"  頭="akad001.png"  c="none"  b="masiro001b.png"  a="masiro001a.png"  face="none"  z="none"  d="none"  z1="none"  z2="none"  g="none"  ]
[tb_start_tyrano_code]
[endif]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]

[if exp="f.wait_face == 'soft_blush'"]

[_tb_end_tyrano_code]

[chara_part  name="aaa"  time="1000"  目="aka001d.png"  頬="none"  口="aka002d.png"  眉="aka003a.png"  感情="none"  腕="akac001.png"  頭="akad001.png"  c="masiro001ba.png"  b="none"  a="masiro001a.png"  face="none"  z="none"  d="none"  z1="none"  z2="none"  g="none"  ]
[tb_start_tyrano_code]
[endif]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[iscript]

$(document).off("mouseenter.eyehover");

$(document).on("mouseenter.eyehover", ".event-setting-element", function(){

var pos = $(this).offset();

/* 目付近だけ反応 */
if(pos.left == 360 && pos.top == 320){

$(".eye_msg").remove();

$("body").append(`
<div class="eye_msg"
style="
position:absolute;
top:420px;
left:220px;
color:white;
background:rgba(0,0,0,0.8);
padding:8px 16px;
border-radius:10px;
z-index:999999;
font-size:32px;
">
そんなじっと……
</div>
`);

setTimeout(function(){

$(".eye_msg").fadeOut(200,function(){
$(this).remove();
});

},500);

}

});

[endscript]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[iscript]

$(document).off("mouseenter.lefteye");

$(document).on("mouseenter.lefteye", ".event-setting-element", function(){

var pos = $(this).offset();

/* 左目 */
if(pos.left == 196 && pos.top == 347){

$(".eye_msg").remove();

$("body").append(`
<div class="eye_msg"
style="
position:absolute;
top:420px;
left:220px;
color:white;
background:rgba(0,0,0,0.8);
padding:8px 16px;
border-radius:10px;
z-index:999999;
font-size:32px;
">
……っ
</div>
`);

setTimeout(function(){

$(".eye_msg").fadeOut(200,function(){
$(this).remove();
});

},500);

}

});


[endscript]
[_tb_end_tyrano_code]

[s  ]

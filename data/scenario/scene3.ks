[_tb_system_call storage=system/_scene3.ks]

[tb_start_tyrano_code]
*start


[_tb_end_tyrano_code]

[playbgm  volume="30"  time="1000"  loop="true"  storage="scene3.mp4"  ]
[chara_hide  name="bbb"  time="100"  wait="false"  pos_mode="false"  ]
[bg  time="1000"  method="crossfade"  storage="masiro003bk.png"  ]
[playse  volume="20"  time="1000"  buf="0"  storage="touch/可愛い動作.mp3"  ]
[tb_image_show  time="1000"  storage="default/s2a.png"  width="640"  height="960"  name="img_5"  ]
[wait  time="2000"  ]
[tb_image_hide  time="100"  ]
[playse  volume="20"  time="1000"  buf="0"  storage="touch/可愛い動作.mp3"  ]
[tb_image_show  time="1000"  storage="default/s2b.png"  width="640"  height="960"  name="img_9"  ]
[wait  time="2000"  ]
[tb_image_hide  time="100"  ]
[playse  volume="20"  time="1000"  buf="0"  storage="touch/可愛く座る.mp3"  ]
[tb_image_show  time="1000"  storage="default/s2c.png"  width="640"  height="960"  name="img_13"  ]
[wait  time="2000"  ]
[l  ]
[tb_image_hide  time="100"  ]
[chara_show  name="ccc1"  time="100"  wait="false"  storage="chara/9/masiro003bo.png"  width="640"  height="960"  ]
[chara_part  name="ccc1"  time="100"  z="masiro003z.png"  te="none"  wait="false"  ]
[tb_start_tyrano_code]
[free layer=fix name="msg_ui"]

[freeimage layer=2 name="s3_face"]
[image storage="chara/9/_parts/te/s3_wait.png" layer=2 page=fore name="s3_face" x=0 y=0]

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

// Scene3ホバーを一度解除
$(document).off(".s3hover");

// 表情差分を切り替える関数
function s3_set_face(storage){

TYRANO.kag.ftag.startTag("freeimage", {
layer:"2",
name:"s3_face"
});

TYRANO.kag.ftag.startTag("image", {
storage:storage,
layer:"2",
page:"fore",
name:"s3_face",
x:"0",
y:"0"
});
}

// 待機顔へ戻す
function s3_face_wait(){
s3_set_face("chara/9/_parts/te/s3_wait.png");
}

// 頭ホバー：0番
$(document).on("mouseenter.s3hover", ".event-setting-element:eq(0)", function(){
s3_set_face("chara/9/_parts/te/s3_head_hover.png");
});

// 頭からカーソルが外れたら待機へ戻す
$(document).on("mouseleave.s3hover", ".event-setting-element:eq(0)", function(){
s3_face_wait();
});

// 左目
$(document).on("mouseenter.s3hover",".event-setting-element:eq(1)",function(){
s3_set_face("chara/9/_parts/te/s3_eye_hover.png");
});

$(document).on("mouseleave.s3hover",
".event-setting-element:eq(1)",function(){
s3_face_wait();
});

// 右目
$(document).on("mouseenter.s3hover",".event-setting-element:eq(2)",function(){
s3_set_face("chara/9/_parts/te/s3_eye_hover.png"
);});

$(document).on("mouseleave.s3hover",".event-setting-element:eq(2)",function(){
s3_face_wait();
});

// 左ほほ
$(document).on("mouseenter.s3hover",".event-setting-element:eq(3)",function(){
s3_set_face("chara/9/_parts/te/s3_cheek_hover.png");
});

$(document).on("mouseleave.s3hover",
".event-setting-element:eq(3)",function(){
s3_face_wait();
});

// 右ほほ
$(document).on("mouseenter.s3hover",".event-setting-element:eq(4)",function(){
s3_set_face("chara/9/_parts/te/s3_cheek_hover.png"
);});

$(document).on("mouseleave.s3hover",".event-setting-element:eq(4)",function(){
s3_face_wait();
});

// 髪
$(document).on("mouseenter.s3hover",".event-setting-element:eq(5)",function(){
s3_set_face("chara/9/_parts/te/s3_hair_hover.png"
);});

$(document).on("mouseleave.s3hover",".event-setting-element:eq(5)",function(){
s3_face_wait();
});

// 手
$(document).on("mouseenter.s3hover",".event-setting-element:eq(6)",function(){
s3_set_face("chara/9/_parts/te/s3_hand_hover.png"
);});

$(document).on("mouseleave.s3hover",".event-setting-element:eq(6)",function(){
s3_face_wait();
});
[endscript]

[_tb_end_tyrano_code]

[tb_start_tyrano_code]
;==============================
; Scene3 ハート演出開始
; EX80～99：1個
;==============================

[iscript]
(function(){

// 二重起動防止
if(window.fhf_heart_timer){
clearInterval(window.fhf_heart_timer);
}
$("#fhf_heart_layer").remove();

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

// Scene3用座標 640×960想定
window.fhf_heart_pos_s3 = [

{x:420,y:120}, // 顔右上

{x:80,y:240},  // 左側

{x:480,y:500}  // 右下

];
window.fhf_spawn_heart_s3 = function(pos){

var size = 100 + Math.random()*14;

var $h = $('<img>');
$h.attr("src","./data/fgimage/mashiro/effect/heart3.png");

$h.css({
position:"absolute",
left:pos.x+"px",
top:pos.y+"px",
width:size+"px",
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

window.fhf_heart_timer = setInterval(function(){

var ex = f.excite || 80;

if(ex >= 80 && ex <= 99){

fhf_spawn_heart_s3(fhf_heart_pos_s3[0]);

setTimeout(function(){
fhf_spawn_heart_s3(fhf_heart_pos_s3[1]);
},250);

setTimeout(function(){
fhf_spawn_heart_s3(fhf_heart_pos_s3[2]);
},500);

}

},2200);
})();
[endscript]
[_tb_end_tyrano_code]

*main_loop

[tb_start_tyrano_code]
[if exp="f.excite >= 100"]

; Scene3のJavaScript処理を最初に停止
[iscript]

// Scene3ホバーを解除
$(document).off(".s3hover");

// LOVEタイマーを停止
if(window.fhf_love_timer){
clearInterval(window.fhf_love_timer);
window.fhf_love_timer = null;
}
f.love_timer_started = false;

// ハートタイマーを停止
if(window.fhf_heart_timer){
clearInterval(window.fhf_heart_timer);
window.fhf_heart_timer = null;
}

// ハート表示レイヤーを削除
$("#fhf_heart_layer").remove();

[endscript]

; Scene3のクリックマップを終了
[clearfix]

; Scene3のUIを消す
[free layer=fix name="msg_ui"]
[free layer=fix name="love_ui"]
[free layer=fix name="love_bar_ui"]
[free layer=fix name="excite_ui"]
[free layer=fix name="excite_bar_ui"]

; Scene3の画像を消す
[freeimage layer=2]

; Endingへ移動
[jump target="ending"]

[endif]
[_tb_end_tyrano_code]

[clickable  storage="s3_head_touch.ks"  x="159"  y="-6"  width="494"  height="157"  target="*head3"  _clickable_img="qqq3.png"  ]
[clickable  storage="s3_eye_touch.ks"  x="140"  y="322"  width="133"  height="98"  target="*eye3"  _clickable_img="qqq3.png"  ]
[clickable  storage="s3_eye_touch.ks"  x="359"  y="334"  width="133"  height="98"  target="*eye3"  _clickable_img="qqq3.png"  ]
[clickable  storage="s3_cheek_touch.ks"  x="155"  y="397"  width="104"  height="92"  target="*cheek3"  _clickable_img="qqq3.png"  ]
[clickable  storage="s3_cheek_touch.ks"  x="360"  y="409"  width="104"  height="92"  target="*cheek3"  _clickable_img="qqq3.png"  ]
[clickable  storage="s3_hair_touch.ks"  x="31"  y="94"  width="626"  height="184"  target=""  _clickable_img="qqq3.png"  ]
[clickable  storage="s3_hand_touch.ks"  x="215"  y="857"  width="104"  height="92"  target="*hand3"  _clickable_img="qqq3.png"  ]
[s  ]
*ending

[chara_hide  name="ccc1"  time="100"  wait="false"  pos_mode="false"  ]
[tb_start_tyrano_code]
; Scene3のクリックマップを終了
[clearfix]

; Scene3の画像を消す
[freeimage layer=2]

; Scene3のUIを個別に消す
[free layer=fix name="msg_ui"]
[free layer=fix name="love_ui"]
[free layer=fix name="excite_ui"]

; ハート処理を終了
[iscript]
if (window.fhf_heart_timer) {
clearInterval(window.fhf_heart_timer);
window.fhf_heart_timer = null;
}
$("#fhf_heart_layer").remove();
[endscript]
[_tb_end_tyrano_code]

[tb_image_hide  time="100"  ]
[bg  time="100"  method="crossfade"  storage="black.png"  cross="false"  ]
[tb_image_hide  time="100"  ]
[chara_show  name="ddd"  time="100"  wait="false"  storage="chara/11/masiro004aa1.png"  width="640"  height="960"  ]
[chara_move  name="ddd"  anim="true"  time="2000"  effect="linear"  wait="true"  left="-141"  top="-105"  width="953"  height="1432"  ]
[chara_hide  name="ddd"  time="1000"  wait="false"  pos_mode="false"  ]
[playse  volume="20"  time="1000"  buf="0"  storage="touch/可愛い動作.mp3"  ]
[tb_image_show  time="2000"  storage="default/masiro004aa.png"  width="640"  height="960"  name="img_43"  ]
[wait  time="3000"  ]
[playse  volume="20"  time="1000"  buf="0"  storage="touch/可愛い動作.mp3"  ]
[tb_image_show  time="2000"  storage="default/masiro004bb.png"  width="640"  height="960"  name="img_46"  ]
[wait  time="3000"  ]
[playse  volume="20"  time="1000"  buf="0"  storage="touch/可愛い動作.mp3"  ]
[tb_image_show  time="2000"  storage="default/masiro004cc.png"  width="640"  height="960"  name="img_50"  ]
[tb_start_tyrano_code]
; 「ありがとう」を表示
;==============================
; Ending セリフ1
;==============================

[free layer=fix name="msg_ui"]
[ptext name="msg_ui" layer=fix x=220 y=460 size=34 color=0xffffff edge="4px #000000" text="……ねえ。"]

[clickable width=640 height=960 x=0 y=0 target="ending_line2"]
[s]

;==============================
; Ending セリフ2
;==============================

*ending_line2

[clearfix]
[free layer=fix name="msg_ui"]
[ptext name="msg_ui" layer=fix x=180 y=460 size=34 color=0xffffff edge="4px #000000" text="今日は、ありがとう。"]

[clickable width=640 height=960 x=0 y=0 target="ending_line3"]
[s]

;==============================
; Ending セリフ3
;==============================

*ending_line3

[clearfix]
[free layer=fix name="msg_ui"]
[ptext name="msg_ui" layer=fix x=200 y=460 size=34 color=0xffffff edge="4px #000000" text="また、来てくれる？"]

[wait time=2000]

[clickable width=640 height=960 x=0 y=0 target="ending_black_start"]
[s]



[_tb_end_tyrano_code]

[tb_start_tyrano_code]
;==============================
; 暗転開始
;==============================

*ending_black_start

[clearfix]
[free layer=fix name="msg_ui"]

; layer=2を黒画像に置き換えて暗転
[freeimage layer=2]
[image storage="ending/black.png" layer=2 page=fore x=0 y=0]



; 黒画面の上に表示
[ptext name="msg_ui" layer=fix x=90 y=460 size=50 color=0xffffff edge="4px #000000" text="今度はもっとね……♡"]

[wait time=3000]

[clickable width=640 height=960 x=0 y=0 target="ending_to_title"]
[s]
*ending_to_title
[_tb_end_tyrano_code]

[tb_image_hide  time="100"  ]
[tb_start_tyrano_code]


; クリック領域を消す
[clearfix]

; Ending表示を消す
[free layer=fix name="msg_ui"]



; 念のため残留処理をもう一度掃除
[iscript]

$(document).off(".s3hover");

if(window.fhf_love_timer){
clearInterval(window.fhf_love_timer);
window.fhf_love_timer = null;
}

if(window.fhf_heart_timer){
clearInterval(window.fhf_heart_timer);
window.fhf_heart_timer = null;
}

$("#fhf_heart_layer").remove();

f.love_timer_started = false;

[endscript]

[free layer=fix name="love_ui"]
[free layer=fix name="love_bar_ui"]
[free layer=fix name="excite_ui"]
[free layer=fix name="excite_bar_ui"]


[stopbgm]



[jump storage="title_screen.ks" target="*rstart"]
[_tb_end_tyrano_code]


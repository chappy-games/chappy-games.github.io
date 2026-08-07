[_tb_system_call storage=system/_title_screen.ks]

[tb_start_tyrano_code]
*rstart
; 先にScene3のクリックマップを終了
[clearfix]

; その後にScene3のホバー画像を消す
[freeimage layer=2]

; ハート処理を終了
[iscript]
if (window.fhf_heart_timer) {
clearInterval(window.fhf_heart_timer);
window.fhf_heart_timer = null;
}
$("#fhf_heart_layer").remove();
[endscript]

[showmenubutton visible=false]

[iscript]
$(".button_menu").hide();
[endscript]

[free layer=fix name="msg_ui"]
[free layer=fix name="love_ui"]
[free layer=fix name="love_bar_ui"]
[free layer=fix name="excite_ui"]
[free layer=fix name="excite_bar_ui"]
[_tb_end_tyrano_code]

[bg  time="3000"  method="puffIn"  storage="chappy_sanpomichi.png"  cross="false"  ]
[playse  volume="20"  time="1000"  buf="0"  storage="touch/犬の鳴き声1.mp3"  fadein="false"  ]
[wait  time="2000"  ]
[tb_start_tyrano_code]
*start


[_tb_end_tyrano_code]

[chara_hide  name="ddd"  time="100"  wait="false"  pos_mode="false"  ]
[tb_image_hide  time="10"  ]
[tb_start_tyrano_code]


[iscript]
$("head").append(`
<style>
html, body, #tyrano_base, .tyrano_base, .layer, .message_outer, .button_menu{
cursor: url("./data/image/ui/hand.png") 16 16, pointer !important;
}
</style>
`);
[endscript]

[iscript]

$(document).on("click", function(e){

var ripple = $("<div></div>");

ripple.css({
position:"fixed",
width:"60px",
height:"60px",
left:e.clientX - 30,
top:e.clientY - 30,
background:"rgba(255,255,255,0)",

border:"3px solid rgba(255,255,255,0.8)",

boxShadow:"0 0 18px rgba(255,180,220,0.7)",
borderRadius:"50%",
opacity:1,
pointerEvents:"none",
zIndex:99999999
});

$("body").append(ripple);

ripple.animate({
width:"180px",
height:"180px",
left:e.clientX - 90,
top:e.clientY - 90,
opacity:0
},400,function(){
ripple.remove();
});

});

[endscript]
[_tb_end_tyrano_code]

[playbgm  volume="20"  time="1000"  loop="true"  storage="music.m4a"  ]
[bg  storage="room1.png"  method="fadeInDown"  time="2000"  ]
[tb_image_show  time="1000"  storage="default/masiro000aa1.png"  width="640"  height="960"  name="img_5"  ]
[tb_image_show  time="1000"  storage="default/masiro000d11ab.png"  width="640"  height="960"  x=""  y=""  _clickable_img=""  name="img_6"  ]
[glink  color="black"  storage="scene1.ks"  size="20"  text="ちょっといい？"  x="215"  y="571"  width=""  height=""  _clickable_img=""  target="*start"  ]
[glink  color="black"  storage="conf.ks"  size="20"  text="設定"  target="*start"  x="261"  y="645"  width=""  height=""  _clickable_img=""  ]
[glink  color="black"  storage="credit.ks"  size="20"  text="クレジット"  x="234"  y="737"  width="100"  height="16"  _clickable_img=""  target="*start"  ]
[tb_start_tyrano_code]
; スタート
[clickable x=180 y=650 width=280 height=80 target="*game_start"]

; 設定
[clickable x=220 y=750 width=200 height=60 target="*open_config"]

; クレジット
[clickable x=220 y=830 width=200 height=60 target="*open_credit"]

[s]


*game_start

[clearfix]
[jump storage="scene1.ks" target="*start"]


*open_config

[clearfix]

; 現在使っている設定画面への命令をここに入れる


*open_credit

[clearfix]
[jump storage="credit.ks" target="*start"]
[_tb_end_tyrano_code]

[s  ]

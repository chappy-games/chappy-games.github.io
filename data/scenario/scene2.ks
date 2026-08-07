[_tb_system_call storage=system/_scene2.ks]

[tb_start_tyrano_code]
*start
[cm]

[_tb_end_tyrano_code]

[chara_hide  name="aaa"  time="100"  wait="true"  pos_mode="true"  ]
[bg  time="1000"  method="fadeIn"  storage="bk002.png"  ]
[playse  volume="20"  time="1000"  buf="0"  storage="touch/可愛い動作.mp3"  ]
[tb_image_show  time="1000"  storage="default/s1a.png"  width="640"  height="960"  ]
[wait  time="2000"  ]
[tb_image_hide  time="100"  ]
[playse  volume="20"  time="1000"  buf="0"  storage="touch/可愛い動作.mp3"  ]
[tb_image_show  time="1000"  storage="default/s1b.png"  width="640"  height="960"  ]
[wait  time="2000"  ]
[tb_image_hide  time="100"  ]
[playse  volume="20"  time="1000"  buf="0"  storage="touch/可愛く座る.mp3"  ]
[tb_image_show  time="1000"  storage="default/s1c.png"  width="640"  height="960"  ]
[wait  time="2000"  ]
[tb_image_hide  time="100"  ]
[chara_show  name="bbb"  time="400"  wait="false"  storage="chara/7/masiro002aa.png"  width="640"  height="960"  ]
[chara_part  name="bbb"  time="150"  beni="masiro002e1.png"  mayu="masiro002d1.png"  kami="masiro002bb.png"  me="masiro002b1.png"  kuchi="masiro002c2.png"  wait="false"  ]
[chara_part  name="bbb"  time="150"  beni="masiro002e1.png"  mayu="masiro002d1.png"  kami="masiro002bb.png"  me="masiro002b1.png"  kuchi="masiro002c2.png"  wait="false"  ]
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
if(f.excite === undefined) f.excite = 0;
[endscript]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
;==============================
; Scene2 ハート演出開始
; EX40～59：1個
; EX60～79：2個
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

// Scene2専用座標
window.fhf_heart_pos_s2 = [
{x:320,y:260}, //中央胸元
{x:200,y:150}, //左上
{x:440,y:150}, //右上
{x:170,y:360}, //左肩
{x:470,y:360}  //右肩
];

window.fhf_spawn_heart_s2 = function(pos){

var size = 50 + Math.random()*14;

var $h = $('<img>');
$h.attr("src","./data/fgimage/mashiro/effect/heart2.png");

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

window.fhf_heart_timer=setInterval(function(){

var ex=f.excite||40;

if(ex>=60 && ex<=79){

fhf_spawn_heart_s2(fhf_heart_pos_s2[0]);

setTimeout(function(){
fhf_spawn_heart_s2(fhf_heart_pos_s2[1]);
},350);

}

else if(ex>=40 && ex<=59){

fhf_spawn_heart_s2(fhf_heart_pos_s2[0]);

}

},2200);

})();
[endscript]
[_tb_end_tyrano_code]

*main_loop

[tb_start_tyrano_code]
[if exp="f.excite >= 60"]
[_tb_end_tyrano_code]

[chara_part  name="bbb"  time="500"  beni="masiro002e2.png"  mayu="masiro002d1.png"  kami="masiro002bb.png"  me="masiro002b1.png"  kuchi="masiro002c1a.png"  汗="none"  あたまハート="none"  ]
[tb_start_tyrano_code]
[else]
[_tb_end_tyrano_code]

[chara_part  name="bbb"  time="150"  beni="masiro002e1.png"  mayu="masiro002d1.png"  kami="masiro002bb.png"  me="masiro002b1.png"  kuchi="masiro002c2.png"  wait="false"  ]
[tb_start_tyrano_code]
[endif]
[_tb_end_tyrano_code]

[clickable  storage="s2_head_touch.ks"  x="94"  y="15"  width="283"  height="98"  target="*head2"  _clickable_img="masiro002a2.png"  ]
[clickable  storage="s2_eye_touch.ks"  x="111"  y="268"  width="75"  height="54"  target="*eye2"  _clickable_img="masiro002a2.png"  ]
[clickable  storage="s2_eye_touch.ks"  x="237"  y="257"  width="75"  height="54"  target="*eye2"  _clickable_img="masiro002a2.png"  ]
[clickable  storage="s2_cheek_touch.ks"  x="121"  y="307"  width="78"  height="71"  target="*cheek2"  _clickable_img="masiro002a2.png"  ]
[clickable  storage="s2_cheek_touch.ks"  x="244"  y="302"  width="59"  height="64"  target="*cheek2"  _clickable_img="masiro002a2.png"  ]
[clickable  storage="s2_shoulder_touch.ks"  x="316"  y="350"  width="151"  height="116"  target="*shoulder2"  _clickable_img="masiro002a2.png"  ]
[clickable  storage="s2_thighs_touch.ks"  x="228"  y="794"  width="306"  height="136"  target="*thighs2"  _clickable_img=""  ]
[tb_start_tyrano_code]
; scene3移行判定
[if exp="f.excite >= 80"]

[iscript]
if(window.fhf_heart_timer){
clearInterval(window.fhf_heart_timer);
window.fhf_heart_timer=null;
}
$("#fhf_heart_layer").remove();
[endscript]

[jump storage="scene3.ks" target="*start"]

[endif]
[_tb_end_tyrano_code]

[s  ]

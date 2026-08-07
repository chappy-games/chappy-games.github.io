[_tb_system_call storage=system/_preview.ks ]

[mask time=10]
[bg  time="10"  method="crossfade"  storage="black.png"  cross="false"  ]
[playbgm  volume="30"  time="1000"  loop="true"  storage="scene3.mp4"  ]
[tb_show_message_window] 
[chara_move  name="ddd"  anim="true"  time="10"  effect="linear"  wait="false"  left="-141"  top="-105"  width="953"  height="1432"  ]
[chara_part  name="ccc1"  time="10"  z="masiro003z.png"  te="none"  wait="false"  ]
[tb_image_show  time="10"  storage="default/masiro004aa.png"  width="640"  height="960"  name="img_43"  ]
[tb_image_show  time="10"  storage="default/masiro004bb.png"  width="640"  height="960"  name="img_46"  ]
[mask_off time=10]
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


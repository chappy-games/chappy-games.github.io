[_tb_system_call storage=system/_s2_head_touch.ks]

*head2

[playse  volume="20"  time="1000"  buf="0"  storage="touch/head.mp3"  ]
[tb_start_tyrano_code]
;========================
; scene2 あたまクリック
;========================

[eval exp="f.excite += 3"]
[eval exp="f.head_count += 2"]
[eval exp="f.last_touch='head'"]



[_tb_end_tyrano_code]

[tb_image_show  time="300"  storage="default/heart.png"  width="640"  height="960"  x="-229"  y="152"  _clickable_img="masiro002a2.png"  ]
[chara_part  name="bbb"  time="300"  beni="masiro002e1.png"  mayu="masiro002d1.png"  kami="masiro002bb.png"  me="masiro002b3.png"  kuchi="masiro002c2.png"  ]
[tb_image_hide  time="1000"  ]
[tb_start_tyrano_code]
[iscript]
var msgs_high = ["……そんなに撫でる？","……もう、髪くずれる","……慣れてきたかも"];
var msgs_veryhigh = ["……ん","……落ち着く","……そんなに好きなんだ"];
if (f.excite < 60) {
f.msg = msgs_high[Math.floor(Math.random() * msgs_high.length)];
} else {
f.msg = msgs_veryhigh[Math.floor(Math.random() * msgs_veryhigh.length)];
}
[endscript]

[free layer=fix name="msg_ui"]
[ptext name="msg_ui" layer=fix x=120 y=460 size=40 color=0xffffff edge="4px #000000" text=&f.msg]

[wait time=700]

[free layer=fix name="msg_ui"]

[if exp="f.excite >= 80"]

[eval exp="f.scene_stage = 3"]

[jump storage="scene3.ks" target="*start"]

[endif]

[jump storage="scene2.ks" target="*main_loop"]
[_tb_end_tyrano_code]


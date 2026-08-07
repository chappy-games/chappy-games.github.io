[_tb_system_call storage=system/_s2_hip_touch.ks]

*hip2

[tb_start_tyrano_code]
;========================
; scene2 おしりクリック
;========================

[eval exp="f.excite += 1"]
[eval exp="f.thigh_count += 1"]
[eval exp="f.last_touch='hip'"]

[iscript]
f.excite_text = "EXCITE:" + f.excite;
f.excite_box = Math.max(0, Math.min(Math.floor(f.excite / 10), 10));
f.excite_bar = "■".repeat(f.excite_box) + "□".repeat(10 - f.excite_box);
[endscript]

[free layer=fix name="excite_ui"]
[free layer=fix name="excite_bar_ui"]

[ptext name="excite_ui" layer=fix x=20 y=200 size=30 color=0xff3333 text=&f.excite_text]
[ptext name="excite_bar_ui" layer=fix x=20 y=240 size=32 color=0xff0000 text=&f.excite_bar]

[_tb_end_tyrano_code]

[tb_image_show  time="300"  storage="default/heart2.png"  width="640"  height="960"  ]
[chara_part  name="bbb"  time="1000"  beni="masiro002e2.png"  mayu="masiro002d2.png"  kami="masiro002bb.png"  me="masiro002b3.png"  kuchi="masiro002c3a.png"  ]
[tb_image_hide  time="1000"  ]
[tb_start_tyrano_code]
[iscript]

var msgs_high = [
"……なに？",
"……そこ？",
"……ちょっと近い"
];

var msgs_veryhigh = [
"……っ",
"……そんなところ触るの？",
"……なんだか落ち着かない"
];

if (f.excite < 60) {
f.msg = msgs_high[Math.floor(Math.random() * msgs_high.length)];
} else {
f.msg = msgs_veryhigh[Math.floor(Math.random() * msgs_veryhigh.length)];
}

[endscript]

[free layer=fix name="msg_ui"]

[ptext name="msg_ui" layer=fix x=220 y=460 size=40 color=0xffffff edge="4px #000000" text=&f.msg]

[wait time=700]

[free layer=fix name="msg_ui"]

[if exp="f.excite >= 80"]
[eval exp="f.scene_stage = 3"]
[jump storage="scene3.ks" target="*start"]
[endif]

[jump storage="scene2.ks" target="*main_loop"]
[_tb_end_tyrano_code]


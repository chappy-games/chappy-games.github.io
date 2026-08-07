[_tb_system_call storage=system/_s1_shoulder_touch.ks]

*shoulder

[playse  volume="20"  time="1000"  buf="0"  storage="touch/shoulder.mp3"  ]
[tb_start_tyrano_code]
[eval exp="f.excite += 1"]
[eval exp="f.head_count += 1"]
[eval exp="f.last_touch='shoulder']


[_tb_end_tyrano_code]

[tb_image_show  time="50"  storage="default/heart.png"  width="330"  height="496"  x="87"  y="153"  _clickable_img="masiro001a.png"  ]
[chara_part  name="aaa"  time="300"  a="masiro001a.png"  b="masiro001b.png"  c="none"  d="none"  e="none"  f="none"  g="none"  g1="none"  aka1="aka001b.png"  aka2="none"  目="aka001aa.png"  口="aka002b.png"  眉="aka003a.png"  頬="none"  感情="none"  腕="akac001.png"  頭="akad001.png"  face="none"  z="none"  z1="none"  z2="none"  ]
[tb_image_hide  time="1000"  ]
[tb_start_tyrano_code]

[iscript]

var msgs_low = [
"……びっくりした",
"……近いよ",
"……どうしたの"
];

var msgs_mid = [
"……そんなに触る？",
"……ちょっと、恥ずかしい",
"……逃げないけど"
];

if (f.excite < 20) {

f.msg = msgs_low[Math.floor(Math.random() * msgs_low.length)];

} else {

f.msg = msgs_mid[Math.floor(Math.random() * msgs_mid.length)];

}

[endscript]

[free layer=fix name="msg_ui"]

[ptext name="msg_ui" layer=fix x=120 y=460 size=40 color=0xffffff edge="4px #000000" text=&f.msg]

[wait time=700]

[free layer=fix name="msg_ui"]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[if exp="f.excite >= 40"]

[eval exp="f.scene_stage = 2"]

[jump storage="scene2.ks" target="*start"]

[endif]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[if exp="f.excite >= 40"]

[eval exp="f.scene_stage = 2"]

[jump storage="scene2.ks" target="*start"]

[endif]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[jump storage="scene1.ks" target="*main_loop"]
[_tb_end_tyrano_code]


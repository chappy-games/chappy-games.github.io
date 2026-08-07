[_tb_system_call storage=system/_mouth_touch.ks]

*mouth

[tb_start_tyrano_code]
[iscript]

if(f.love >= 40){

f.excite = Math.min(f.excite + 3,100);

var msgs = [

"あんっ…",

"さわってる…",

"ドキドキしてる……"

];
f.msg = msgs[Math.floor(Math.random() * msgs.length)];

f.next_face = "blush";

}else{

f.love = Math.max(f.love - 5,0);

var msgs = [

"ひゃっ…",

"こ、こらっ…",

"んぅ……"

];
f.msg = msgs[Math.floor(Math.random() * msgs.length)];

f.next_face = "angry";

}

f.love_text = "LOVE:" + f.love;

f.love_box = Math.max(0,Math.min(Math.floor(f.love / 10),5));

f.love_bar = "■".repeat(f.love_box) + "□".repeat(5 - f.love_box);

f.excite_text = "EXCITE:" + f.excite;

f.excite_box = Math.max(0,Math.min(Math.floor(f.excite / 10),10));

f.excite_bar = "■".repeat(f.excite_box) + "□".repeat(10 - f.excite_box);

[endscript]

[if exp="f.next_face == 'blush'"]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[iscript]

if(f.excite >= 70){

var msgs = [
"んっ…",

"な、なに…？",

"そんなに見ないで…"

];

f.next_face = "doki";

}else{

var msgs = [
"……っ",

"もう、意識しちゃうから…",

"近いよ…その…"];

f.next_face = "blush";

}

f.msg = msgs[Math.floor(Math.random() * msgs.length)];

[endscript]
[_tb_end_tyrano_code]

[tb_image_show  time="50"  storage="default/heart2.png"  width="640"  height="960"  name="img_4"  ]
[chara_part  name="aka"  time="800"  a="none"  b="none"  c="none"  d="none"  e="none"  f="none"  g="none"  aka1="aka001b.png"  aka2="none"  g1="011a.png"  目="aka001d.png"  頬="aka1b.png"  口="aka002h.png"  wait="false"  眉="aka003a.png"  感情="none"  aa="none"  腕="akac001.png"  頭="akad001.png"  ]
[tb_image_hide  time="800"  ]
[tb_start_tyrano_code]
[endif]

[if exp="f.next_face == 'angry'"]
[_tb_end_tyrano_code]

[tb_image_show  time="50"  storage="default/sweat.png"  width="640"  height="960"  name="img_8"  ]
[chara_part  name="aka"  time="100"  a="none"  b="none"  c="none"  d="none"  e="008.png"  f="none"  g="none"  aka1="aka001b.png"  aka2="none"  g1="none"  目="aka001ca.png"  頬="none"  口="aka002c.png"  眉="aka003b.png"  感情="none"  aa="none"  ]
[tb_image_hide  time="500"  ]
[tb_start_tyrano_code]
[endif]

[free layer=fix name="love_ui"]
[free layer=fix name="love_bar_ui"]

[ptext name="love_ui" layer=fix x=40 y=40 size=30 color=0xff66aa text=&f.love_text]

[ptext name="love_bar_ui" layer=fix x=40 y=80 size=32 color=0xff99cc text=&f.love_bar]

[free layer=fix name="excite_ui"]
[free layer=fix name="excite_bar_ui"]

[ptext name="excite_ui" layer=fix x=40 y=140 size=30 color=0xff3333 text=&f.excite_text]

[ptext name="excite_bar_ui" layer=fix x=40 y=180 size=32 color=0xff0000 text=&f.excite_bar]

[free layer=fix name="msg_bg"]
[free layer=fix name="msg_ui"]

[image storage="msg_bg.png" layer=fix x=180 y=450 name="msg_bg"]

[if exp="f.excite >= 50 && f.ex_cutin50 != true"]




[_tb_end_tyrano_code]

[chara_show  name="cut"  time="1"  wait="true"  left="396"  top="-69"  width=""  height=""  reflect="false"  ]
[chara_move  name="cut"  anim="true"  time="300"  effect="linear"  wait="true"  left="-8"  top="3"  width="656"  height="992"  ]
[chara_hide  name="cut"  time="1000"  wait="true"  pos_mode="true"  ]
[tb_start_tyrano_code]
[iscript]
f.ex_cutin50 = true;
[endscript]

[endif]

[ptext name="msg_ui" layer=fix x=220 y=460 size=40 color=0xffffff edge="4px #000000" text=&f.msg]

[wait time=700]

[free layer=fix name="msg_bg"]
[free layer=fix name="msg_ui"]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[jump storage="scene1.ks" target="*main_loop"]
[_tb_end_tyrano_code]


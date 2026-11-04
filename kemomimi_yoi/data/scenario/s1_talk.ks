[_tb_system_call storage=system/_s1_talk.ks]

*start

[bg  time="1000"  method="crossfade"  storage="yoi1aa.png"  ]
[tb_start_tyrano_code]
[image layer=4 page=fore storage="kemomimi/scene1/gaide/guide_s1_color.png" x=270 y=180 visible=true name="s1_rule"]
[_tb_end_tyrano_code]

[clickable  storage="s1_talk.ks"  x="0"  y="0"  width="960"  height="640"  target="*s1_rule_01"  ]
[playse  volume="100"  time="1000"  buf="0"  storage="se_s2_start.mp3"  ]
[s  ]
*s1_rule_01

[tb_start_tyrano_code]
[image layer=4 page=fore storage="kemomimi/scene1/rule/s1_rule_01.png" x=0 y=0 visible=true name="s1_rule"]

[_tb_end_tyrano_code]

[clickable  storage="s1_talk.ks"  x="0"  y="0"  width="960"  height="640"  target="*s1_rule_02"  ]
[playse  volume="100"  time="1000"  buf="0"  storage="se_s2_start.mp3"  ]
[s  ]
*s1_rule_02

[tb_start_tyrano_code]
[image layer=4 page=fore storage="kemomimi/scene1/rule/s1_rule_02.png" x=0 y=0 visible=true name="s1_rule"]
[_tb_end_tyrano_code]

[playse  volume="100"  time="1000"  buf="0"  storage="se_s2_start.mp3"  ]
[clickable  storage="s1_talk.ks"  x="0"  y="0"  width="960"  height="640"  target="*s1_rule_03"  ]
[s  ]
*s1_rule_03

[tb_start_tyrano_code]
[image layer=4 page=fore storage="kemomimi/scene1/rule/s1_rule_03.png" x=0 y=0 visible=true name="s1_rule"]
[_tb_end_tyrano_code]

[playse  volume="100"  time="1000"  buf="0"  storage="se_s2_start.mp3"  ]
[clickable  storage="s1_talk.ks"  x="0"  y="0"  width="960"  height="640"  target="*s1_rule_end"  ]
[s  ]
*s1_rule_end

[tb_start_tyrano_code]
[cm]
[free layer=4 name="s1_rule"]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
; =========================
; 背景
; =========================
[bg storage="kemomimi/scene1/s1_bg_club.png" time=0]

; =========================
; 目パチ共通処理
; =========================
[iscript]

window.yoiStopBlink = function(){

if (window.yoi_blink_timer) {
clearTimeout(window.yoi_blink_timer);
window.yoi_blink_timer = null;
}

if (window.yoi_blink_open_timer) {
clearTimeout(window.yoi_blink_open_timer);
window.yoi_blink_open_timer = null;
}
};


window.yoiStartBlink = function(){

window.yoiStopBlink();

var face = $(".yoi_blink_face, [name='yoi_blink_face']").first();

if (!face.length) {
return;
}

var openSrc  = face.attr("src");
var closeSrc = openSrc.replace("_open.png", "_close.png");

function scheduleBlink(){

var wait = 2500 + Math.floor(Math.random() * 2501);

window.yoi_blink_timer = setTimeout(function(){

var face1 = $(".yoi_blink_face, [name='yoi_blink_face']").first();

if (!face1.length) {
return;
}

face1.attr("src", closeSrc);

window.yoi_blink_open_timer = setTimeout(function(){

var face2 = $(".yoi_blink_face, [name='yoi_blink_face']").first();

if (!face2.length) {
return;
}

face2.attr("src", openSrc);

scheduleBlink();

},120);

},wait);
}

scheduleBlink();
};

[endscript]

; =========================
; プレイヤー3ボタン
; 仮座標。あとで調整
; =========================
[image layer=4 page=fore storage="kemomimi/scene1/ui/player/btn_red_heart.png" x=30 y=530 visible=true]
[image layer=4 page=fore storage="kemomimi/scene1/ui/player/btn_yellow_star.png" x=335 y=530 visible=true]
[image layer=4 page=fore storage="kemomimi/scene1/ui/player/btn_green_leaf.png" x=640 y=530 visible=true]

[jump target="*talk_loop"]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
*talk_loop

[clearfix]

[if exp="f.talk_count >= f.talk_max"]
[jump target="*talk_end"]
[endif]

[if exp="f.talk_count == 6"]
[playse storage="se_s1_rulechange.mp3" volume="30"]
[image layer=4 name="mode_info" storage="kemomimi/scene1/gaide/guide_s1_mark.png" x=290 y=190 visible=true]
[l]
[free layer=4 name="mode_info"]
[endif]

; =========================
; LIKEによる待機ポーズ決定
; =========================

[iscript]

if (f.like <= 7) {

// 待機1：LIKE 0～7
f.wait_no = 1;

f.wait_body_storage =
"kemomimi/scene1/wait/s1_wait_01_body.png";

f.wait_face_open_storage =
"kemomimi/scene1/wait/s1_wait_01_face_open.png";

f.wait_face_close_storage =
"kemomimi/scene1/wait/s1_wait_01_face_close.png";

f.react_good_storage =
"kemomimi/scene1/wait/s1_wait_01_face_smile.png";

f.react_bad_storage =
"kemomimi/scene1/wait/s1_wait_01_face_musu.png";


} else if (f.like <= 15) {

// 待機2：LIKE 8～15
f.wait_no = 2;

f.wait_body_storage =
"kemomimi/scene1/wait/s1_wait_02_body.png";

f.wait_face_open_storage =
"kemomimi/scene1/wait/s1_wait_02_face_open.png";

f.wait_face_close_storage =
"kemomimi/scene1/wait/s1_wait_02_face_close.png";

f.react_good_storage =
"kemomimi/scene1/wait/s1_wait_02_face_tease.png";

f.react_bad_storage =
"kemomimi/scene1/wait/s1_wait_02_face_blush.png";


} else {

// 待機3：LIKE 16以上
f.wait_no = 3;

f.wait_body_storage =
"kemomimi/scene1/wait/s1_wait_03_body.png";

f.wait_face_open_storage =
"kemomimi/scene1/wait/s1_wait_03_face_open.png";

f.wait_face_close_storage =
"kemomimi/scene1/wait/s1_wait_03_face_close.png";

f.react_good_storage =
"kemomimi/scene1/wait/s1_wait_03_face_hype.png";

f.react_bad_storage =
"kemomimi/scene1/wait/s1_wait_03_face_overheat.png";
}

[endscript]

; =========================
; 待機絵を更新
; =========================

[iscript]
window.yoiStopBlink();
[endscript]

[freeimage layer=0 page=fore]
[freeimage layer=1 page=fore]

[image layer=0 page=fore storage=&f.wait_body_storage x=0 y=0 visible=true name="yoi_body"]
[image layer=1 page=fore storage=&f.wait_face_open_storage x=0 y=0 visible=true name="yoi_blink_face"]

[iscript]
window.yoiStartBlink();
[endscript]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
; =========================
; TALK / LIKE 表示テスト
; =========================

[image layer=4 page=fore storage="kemomimi/scene1/ui/text/text_talk.png" x=20 y=20 visible=true name="ui_text_talk"]
[image layer=4 page=fore storage="kemomimi/scene1/ui/text/text_like.png" x=20 y=70 visible=true name="ui_text_like"]
[image layer=4 page=fore storage="kemomimi/scene1/ui/number/num_0.png" x=190 y=20 visible=true name="ui_talk_ones"]
[image layer=4 page=fore storage="kemomimi/scene1/ui/number/num_slash.png" x=220 y=20 visible=true name="ui_talk_slash"]
[image layer=4 page=fore storage="kemomimi/scene1/ui/number/num_1.png" x=250 y=20 visible=true name="ui_talk_max1"]
[image layer=4 page=fore storage="kemomimi/scene1/ui/number/num_2.png" x=280 y=20 visible=true name="ui_talk_max2"]

; =========================
; Scene1 吹き出し＋アイコン選択
; 1～6回目：色とアイコン一致
; 7～12回目：色とアイコンをずらす
; 正解はアイコン側
; =========================

[iscript]

var bubbleList = [
"kemomimi/scene1/ui/prompt/bubble_red.png",
"kemomimi/scene1/ui/prompt/bubble_yellow.png",
"kemomimi/scene1/ui/prompt/bubble_green.png"
];

var iconList = [
"kemomimi/scene1/ui/icon/icon_heart.png",
"kemomimi/scene1/ui/icon/icon_star.png",
"kemomimi/scene1/ui/icon/icon_leaf.png"
];

var answerList = [
"red",
"yellow",
"green"
];

// 1～6回目
if (f.talk_count < 6) {

var n = Math.floor(Math.random() * 3);

f.prompt_bubble_storage = bubbleList[n];
f.prompt_icon_storage = iconList[n];
f.correct_choice = answerList[n];

f.prompt_mode = "match";


// 7～12回目
} else {

// まず正解になるアイコンを決める
var iconNo = Math.floor(Math.random() * 3);

// アイコンと違う色を必ず選ぶ
var bubbleNo;

do {
bubbleNo = Math.floor(Math.random() * 3);
} while (bubbleNo === iconNo);

f.prompt_bubble_storage = bubbleList[bubbleNo];
f.prompt_icon_storage = iconList[iconNo];

// 正解は外側の色ではなく、中のアイコン
f.correct_choice = answerList[iconNo];

f.prompt_mode = "icon";
}

[endscript]

; 前の吹き出しとアイコンを消す
[freeimage layer=2 page=fore]
[freeimage layer=3 page=fore]

; 新しい吹き出しとアイコンを表示
[image layer=2 page=fore storage=&f.prompt_bubble_storage x=680 y=120 visible=true name="prompt_bubble"]
[image layer=3 page=fore storage=&f.prompt_icon_storage x=705 y=190 visible=true name="prompt_icon"]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
; =========================
; TALK / LIKE 数字準備
; =========================

[iscript]
f.talk_tens = Math.floor(f.talk_count / 10);
f.talk_ones = f.talk_count % 10;

f.like_tens = Math.floor(f.like / 10);
f.like_ones = f.like % 10;

f.talk_tens_storage = "kemomimi/scene1/ui/number/num_" + f.talk_tens + ".png";
f.talk_ones_storage = "kemomimi/scene1/ui/number/num_" + f.talk_ones + ".png";

f.like_tens_storage = "kemomimi/scene1/ui/number/num_" + f.like_tens + ".png";
f.like_ones_storage = "kemomimi/scene1/ui/number/num_" + f.like_ones + ".png";
[endscript]

[free layer=4 name="ui_talk_tens"]
[free layer=4 name="ui_talk_ones"]
[free layer=4 name="ui_like_tens"]
[free layer=4 name="ui_like_ones"]

[if exp="f.talk_count >= 10"]
[image layer=4 page=fore storage=&f.talk_tens_storage x=160 y=20 visible=true name="ui_talk_tens"]
[endif]

[image layer=4 page=fore storage=&f.talk_ones_storage x=190 y=20 visible=true name="ui_talk_ones"]

[if exp="f.like >= 10"]
[image layer=4 page=fore storage=&f.like_tens_storage x=160 y=80 visible=true name="ui_like_tens"]
[endif]

[image layer=4 page=fore storage=&f.like_ones_storage x=190 y=80 visible=true name="ui_like_ones"]


[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[iscript]
f.talk_ones = f.talk_count % 10;
f.like_ones = f.like % 10;

f.talk_ones_storage = "kemomimi/scene1/ui/number/num_" + f.talk_ones + ".png";
f.like_ones_storage = "kemomimi/scene1/ui/number/num_" + f.like_ones + ".png";
[endscript]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[free layer=4 name="ui_talk_ones"]
[free layer=4 name="ui_like_ones"]

[image layer=4 page=fore storage=&f.talk_ones_storage x=190 y=20 visible=true name="ui_talk_ones"]
[image layer=4 page=fore storage=&f.like_ones_storage x=190 y=80 visible=true name="ui_like_ones"]
[_tb_end_tyrano_code]

[clickable  storage="s1_talk.ks"  x="30"  y="530"  width="285"  height="90"  target="*choose_red"  _clickable_img=""  ]
[clickable  storage="s1_talk.ks"  x="335"  y="530"  width="285"  height="90"  target="*choose_yellow"  ]
[clickable  storage="s1_talk.ks"  x="640"  y="530"  width="285"  height="90"  target="*choose_green"  _clickable_img=""  ]
[tb_start_tyrano_code]
[s]
[_tb_end_tyrano_code]

*choose_red

[tb_start_tyrano_code]
[cm]
[eval exp="f.player_choice='red'"]
[jump target="*judge"]
[_tb_end_tyrano_code]

*choose_yellow

[tb_start_tyrano_code]
[eval exp="f.player_choice='yellow'"]
[jump target="*judge"]
[_tb_end_tyrano_code]

*choose_green

[tb_start_tyrano_code]
[cm]
[eval exp="f.player_choice='green'"]
[jump target="*judge"]
[_tb_end_tyrano_code]

*judge

[tb_start_tyrano_code]
[if exp="f.player_choice == f.correct_choice"]
[playse storage="se_s1_correct.mp3" volume="30"]
[eval exp="f.like += 2"]
[eval exp="f.answer_correct = true"]
[eval exp="f.like_add_storage='kemomimi/scene1/ui/number/num_2.png'"]
[else]
[playse storage="se_s1_miss.mp3" volume="30"]
[eval exp="f.like += 1"]
[eval exp="f.answer_correct = false"]
[eval exp="f.like_add_storage='kemomimi/scene1/ui/number/num_1.png'"]
[endif]

; =========================
; 正解リアクション
; =========================

[if exp="f.answer_correct == true"]

[iscript]
window.yoiStopBlink();
[endscript]

[freeimage layer=1 page=fore]
[image layer=1 page=fore storage=&f.react_good_storage x=0 y=0 visible=true name="yoi_react_face"]

[wait time=700]

[freeimage layer=1 page=fore]
[image layer=1 page=fore storage=&f.wait_face_open_storage x=0 y=0 visible=true name="yoi_blink_face"]

[iscript]
window.yoiStartBlink();
[endscript]

[endif]

; =========================
; 不正解リアクション
; =========================

[if exp="f.answer_correct == false"]

[iscript]
window.yoiStopBlink();
[endscript]

[freeimage layer=1 page=fore]
[image layer=1 page=fore storage=&f.react_bad_storage x=0 y=0 visible=true name="yoi_react_face"]

[wait time=700]

[freeimage layer=1 page=fore]
[image layer=1 page=fore storage=&f.wait_face_open_storage x=0 y=0 visible=true name="yoi_blink_face"]

[iscript]
window.yoiStartBlink();
[endscript]

[endif]
; +1 / +2 をLIKEの下へ表示
[free layer=4 name="like_add_plus"]
[free layer=4 name="like_add_num"]

[image layer=4 page=fore storage="kemomimi/scene1/ui/number/num_plus.png" x=190 y=140 visible=true name="like_add_plus"]
[image layer=4 page=fore storage=&f.like_add_storage x=220 y=140 visible=true name="like_add_num"]

[wait time=500]

[free layer=4 name="like_add_plus"]
[free layer=4 name="like_add_num"]

[eval exp="f.talk_count += 1"]

[if exp="f.talk_count >= f.talk_max"]

; 最終回のTALK・LIKE表示を更新
[iscript]
f.talk_tens = Math.floor(f.talk_count / 10);
f.talk_ones = f.talk_count % 10;
f.like_tens = Math.floor(f.like / 10);
f.like_ones = f.like % 10;

f.talk_tens_storage = "kemomimi/scene1/ui/number/num_" + f.talk_tens + ".png";
f.talk_ones_storage = "kemomimi/scene1/ui/number/num_" + f.talk_ones + ".png";
f.like_tens_storage = "kemomimi/scene1/ui/number/num_" + f.like_tens + ".png";
f.like_ones_storage = "kemomimi/scene1/ui/number/num_" + f.like_ones + ".png";
[endscript]

[free layer=4 name="ui_talk_tens"]
[free layer=4 name="ui_talk_ones"]
[free layer=4 name="ui_like_tens"]
[free layer=4 name="ui_like_ones"]

[image layer=4 page=fore storage=&f.talk_tens_storage x=160 y=20 visible=true name="ui_talk_tens"]
[image layer=4 page=fore storage=&f.talk_ones_storage x=190 y=20 visible=true name="ui_talk_ones"]

[if exp="f.like >= 10"]
[image layer=4 page=fore storage=&f.like_tens_storage x=160 y=80 visible=true name="ui_like_tens"]
[endif]

[image layer=4 page=fore storage=&f.like_ones_storage x=190 y=80 visible=true name="ui_like_ones"]

; 最終結果を少し見せる
[wait time=500]

[jump target="*talk_end"]

[else]
[jump target="*talk_loop"]
[endif]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
*talk_end

[cm]

[iscript]
window.yoiStopBlink();
[endscript]

; 低LIKEはそのまま追い出しEND
[if exp="f.like <= 12"]
[jump storage="end_kick.ks" target="*start"]
[endif]


[_tb_end_tyrano_code]

[tb_start_tyrano_code]
; BGMを小さくする
[changevol target="bgm" volume=10 time=300]
[wait time=300]

; ファンファーレ再生
[playse storage="se_mofumofu_start.mp3" loop=false]

; ロゴを表示
[image layer=4 page=fore storage="kemomimi/scene2/bonus/s2_bonus_mofumofu.png" x=0 y=0 visible=true name="mofumofu_bonus"]

; ロゴのアニメーション
[iscript]

var logo = $(".mofumofu_bonus, [name='mofumofu_bonus']").first();

logo.css({
"opacity":"0",
"transform":"scale(0.3)",
"transform-origin":"center center"
});

setTimeout(function(){
logo.css({
"opacity":"1",
"transform":"scale(1.2)",
"transition":"all 0.25s ease-out"
});
},50);

setTimeout(function(){
logo.css({
"transform":"scale(0.9)",
"transition":"all 0.12s ease-in-out"
});
},300);

setTimeout(function(){
logo.css({
"transform":"scale(1.0)"
});
},450);

[endscript]

; ファンファーレ終了待ち
[wse]

; BGMを元の音量に戻す
[changevol target="bgm" volume=40 time=500]

[wait time=600]

[free layer=4 name="mofumofu_bonus"]

; Scene1を片付ける
[freeimage layer=0 page=fore]
[freeimage layer=1 page=fore]
[freeimage layer=2 page=fore]
[freeimage layer=3 page=fore]
[freeimage layer=4 page=fore]

[jump storage="s2_tail.ks" target="*start"]
[_tb_end_tyrano_code]


[_tb_system_call storage=system/_title_screen.ks]

*title

[tb_start_tyrano_code]
[cm]
[layopt layer=message0 visible=false]
[_tb_end_tyrano_code]

[hidemenubutton]

[tb_clear_images]

[tb_keyconfig  flag="0"  ]
[tb_hide_message_window  ]
[bg  time="1000"  method="crossfade"  storage="b.png"  ]
[playse  volume="50"  time="1000"  buf="0"  storage="data_sound_touch_犬の鳴き声1.mp3"  ]
[tb_start_tyrano_code]
[playbgm storage="bgm_main.mp3" loop="true" volume="25"]
[_tb_end_tyrano_code]

*title1

[tb_start_tyrano_code]
[cm]
[clearfix]

[freeimage layer=0 page=fore]
[freeimage layer=1 page=fore]
[freeimage layer=2 page=fore]
[freeimage layer=3 page=fore]
[freeimage layer=4 page=fore]
[_tb_end_tyrano_code]

[bg  storage="title_main.png"  method="puffIn"  ]
[glink  color="black"  text="START"  x="73"  y="348"  size="24"  target="*start"  width=""  height=""  _clickable_img=""  storage="scene1.ks"  ]
[glink  color="black"  storage="title_screen.ks"  size="20"  text="設定"  x="96"  y="416"  width=""  height=""  _clickable_img=""  target="*setting"  ]
[glink  color="black"  storage="title_screen.ks"  size="20"  text="クレジット"  x="75"  y="479"  width=""  height=""  _clickable_img=""  target="*credit"  ]
[glink  color="black"  storage="title_screen.ks"  size="20"  text="終了"  x="100"  y="542"  width=""  height=""  _clickable_img=""  target="*exit"  ]
[s  ]
*setting

[tb_start_tyrano_code]

[cm]
[clearfix]

[freeimage layer=0 page=fore]
[freeimage layer=1 page=fore]
[freeimage layer=2 page=fore]
[freeimage layer=3 page=fore]
[freeimage layer=4 page=fore]


[_tb_end_tyrano_code]

[bg  time="100"  method="crossfade"  storage="ku.png"  ]
[button  storage="title_screen.ks"  target="*title1"  graphic="setting_back.png"  width="300"  height="80"  x="328"  y="433"  _clickable_img=""  name="img_16"  ]
[tb_image_show  time="100"  storage="default/setting_bar_base.png"  width="308"  height="32"  x="462"  y="198"  _clickable_img=""  name="img_17"  ]
[tb_image_show  time="100"  storage="default/setting_knob.png"  width="23"  height="25"  x="462"  y="200"  _clickable_img=""  name="img_18"  ]
[tb_image_show  time="100"  storage="default/setting_bar_base.png"  width="308"  height="32"  x="460"  y="293"  _clickable_img=""  name="img_19"  ]
[tb_image_show  time="100"  storage="default/setting_knob.png"  width="23"  height="25"  x="494"  y="294"  _clickable_img=""  name="img_20"  ]
[tb_start_tyrano_code]
[iscript]
(function(){

function syncSlider(index, configName, dataName) {

var bar = $('img[src*="setting_bar_base.png"]').eq(index);
var knob = $('img[src*="setting_knob.png"]').eq(index);

if (!bar.length || !knob.length) return;

// 現在の音量を取得
var volume = Number(TYRANO.kag.config[configName]);

if (!isFinite(volume)) volume = 50;
volume = Math.max(0, Math.min(100, volume));

var b = bar[0].getBoundingClientRect();
var k = knob[0].getBoundingClientRect();

var scale = b.width / bar.width();
if (!scale) return;

// 音量に応じたつまみの位置
var targetX = b.left +
(b.width - k.width) * volume / 100;

var left = parseFloat(knob.css("left")) || 0;

left += (targetX - k.left) / scale;

knob.css("left", left + "px");
knob.data(dataName, Math.round(volume));
}

// BGMの位置を復元
syncSlider(0, "defaultBgmVolume", "lastBgmVolume");

// SEの位置を復元
syncSlider(1, "defaultSeVolume", "lastSeVolume");

})();
[endscript]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]

[iscript]
(function(){

// BGM用の画像を取得
var bar = $('img[src*="setting_bar_base.png"]').first();
var knob = $('img[src*="setting_knob.png"]').first();

if (!bar.length || !knob.length) return;

// 前回のイベントを解除
if (window.yoiSliderEnd) window.yoiSliderEnd();

var dragging = false;

// つまみを移動
function moveKnob(e) {

var b = bar[0].getBoundingClientRect();
var k = knob[0].getBoundingClientRect();

var x = Math.max(
b.left + k.width / 2,
Math.min(b.right - k.width / 2, e.clientX)
);

var scale = b.width / bar.width();
if (!scale) return;

var left = parseFloat(knob.css("left")) || 0;
left += (x - (k.left + k.width / 2)) / scale;

knob.css("left", left + "px");
}

// つまみの位置から音量を計算
function applyVolume() {

var b = bar[0].getBoundingClientRect();
var k = knob[0].getBoundingClientRect();

var range = Math.max(1, b.width - k.width);
var ratio = (k.left - b.left) / range;

ratio = Math.max(0, Math.min(1, ratio));

var volume = Math.round(ratio * 100);

if (knob.data("lastBgmVolume") === volume) return;

knob.data("lastBgmVolume", volume);

TYRANO.kag.ftag.startTag("bgmopt", {
volume: String(volume),
effect: "true"
}, function(){
TYRANO.kag.tmp.cut_nextorder = null;
});
}

// マウスを押したとき
function down(e) {

if (e.button !== 0) return;

var b = bar[0].getBoundingClientRect();

if (
e.clientX < b.left ||
e.clientX > b.right ||
e.clientY < b.top - 15 ||
e.clientY > b.bottom + 15
) return;

dragging = true;
moveKnob(e);

e.preventDefault();
e.stopPropagation();
}

// ドラッグ中
function move(e) {

if (!dragging) return;

moveKnob(e);
applyVolume();
e.preventDefault();
}

// マウスを離したとき
function up(e) {

if (!dragging) return;

dragging = false;
moveKnob(e);
applyVolume();

e.preventDefault();
e.stopPropagation();
}

// マウス操作を登録
document.addEventListener("mousedown", down, true);
document.addEventListener("mousemove", move, true);
document.addEventListener("mouseup", up, true);

// イベント解除用
window.yoiSliderEnd = function(){

document.removeEventListener("mousedown", down, true);
document.removeEventListener("mousemove", move, true);
document.removeEventListener("mouseup", up, true);

};

})();
[endscript]



[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[iscript]
(function(){

// SE用（2番目の画像）
var bar = $('img[src*="setting_bar_base.png"]').eq(1);
var knob = $('img[src*="setting_knob.png"]').eq(1);

if (!bar.length || !knob.length) return;

if (window.yoiSeSliderEnd) window.yoiSeSliderEnd();

var dragging = false;

// つまみを動かす
function moveKnob(e) {

var b = bar[0].getBoundingClientRect();
var k = knob[0].getBoundingClientRect();

var x = Math.max(
b.left + k.width / 2,
Math.min(b.right - k.width / 2, e.clientX)
);

var scale = b.width / bar.width();
if (!scale) return;

var left = parseFloat(knob.css("left")) || 0;
left += (x - (k.left + k.width / 2)) / scale;

knob.css("left", left + "px");
}

// SE音量を反映
function applyVolume() {

var b = bar[0].getBoundingClientRect();
var k = knob[0].getBoundingClientRect();

var range = Math.max(1, b.width - k.width);
var ratio = (k.left - b.left) / range;

ratio = Math.max(0, Math.min(1, ratio));

var volume = Math.round(ratio * 100);

if (knob.data("lastSeVolume") === volume) return;

knob.data("lastSeVolume", volume);

TYRANO.kag.ftag.startTag("seopt", {
volume: String(volume),
effect: "true"
}, function(){
TYRANO.kag.tmp.cut_nextorder = null;
});
}

// マウスを押す
function down(e) {

if (e.button !== 0) return;

var b = bar[0].getBoundingClientRect();

if (
e.clientX < b.left ||
e.clientX > b.right ||
e.clientY < b.top - 15 ||
e.clientY > b.bottom + 15
) return;

dragging = true;
moveKnob(e);

e.preventDefault();
e.stopPropagation();
}

// ドラッグ中
function move(e) {

if (!dragging) return;

moveKnob(e);
applyVolume();

e.preventDefault();
}

// マウスを離す
function up(e) {

if (!dragging) return;

dragging = false;
moveKnob(e);
applyVolume();

// 確認用SEを再生
TYRANO.kag.ftag.startTag("playse", {
storage: "se_s2_streak.mp3",
loop: "false"
});

e.preventDefault();
e.stopPropagation();
}

// イベント登録
document.addEventListener("mousedown", down, true);
document.addEventListener("mousemove", move, true);
document.addEventListener("mouseup", up, true);

// イベント解除
window.yoiSeSliderEnd = function(){

document.removeEventListener("mousedown", down, true);
document.removeEventListener("mousemove", move, true);
document.removeEventListener("mouseup", up, true);

};

})();
[endscript]
[_tb_end_tyrano_code]

[s  ]
*credit

[bg  time="100"  method="crossfade"  storage="cre.png"  ]
[button  storage="title_screen.ks"  target="*title1"  graphic="setting_back.png"  width="300"  height="80"  x="329"  y="513"  _clickable_img=""  ]
[s  ]
*exit

[tb_start_tyrano_code]
[close ask=true]
[jump storage="title_screen.ks" target="*title1"]
[_tb_end_tyrano_code]

[showmenubutton]

[s  ]
[cm  ]
[tb_keyconfig  flag="1"  ]
[s  ]

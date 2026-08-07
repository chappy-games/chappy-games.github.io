[_tb_system_call storage=system/_conf.ks]

[tb_start_tyrano_code]
*start

; 念のため、前回のクリック領域と設定UIを消す
[clearfix]

[iscript]
$("#fhf_config_sliders").remove();
[endscript]

; 設定背景
[image storage="setting/setting_bg.png" layer=1 page=fore x=0 y=0 width=640 height=960 name="setting_bg"]

; タイトル
[ptext layer=fix name="conf_title" text="設定" x=0 y=105 width=640 align=center size=42 color=0x5b4740 edge=0xffffff]

; 項目名
[ptext layer=fix name="conf_bgm_text" text="BGM音量" x=100 y=270 width=440 align=left size=30 color=0x5b4740]

[ptext layer=fix name="conf_se_text" text="SE音量" x=100 y=455 width=440 align=left size=30 color=0x5b4740]


; ========================================
; BGM・SEスライダー生成
; ========================================

[iscript]

(function () {

$("#fhf_config_sliders").remove();

var bgmVolume = Number(localStorage.getItem("fhf_bgm_volume"));
var seVolume  = Number(localStorage.getItem("fhf_se_volume"));

if (isNaN(bgmVolume)) bgmVolume = 70;
if (isNaN(seVolume))  seVolume = 70;

var $ui = $('<div id="fhf_config_sliders"></div>');

$ui.css({
position: "absolute",
left: "0px",
top: "0px",
width: "640px",
height: "960px",
zIndex: "9999999",
pointerEvents: "none"
});

var $bgm = $('<input type="range" min="0" max="100" step="1">');
$bgm.val(bgmVolume);

$bgm.css({
position: "absolute",
left: "100px",
top: "325px",
width: "440px",
height: "50px",
zIndex: "10000000",
pointerEvents: "auto",
cursor: "pointer",
touchAction: "none"
});

var $bgmValue = $('<div></div>')
.text(bgmVolume + "%")
.css({
position: "absolute",
left: "245px",
top: "375px",
width: "150px",
textAlign: "center",
fontSize: "25px",
color: "#d87591"
});

var $se = $('<input type="range" min="0" max="100" step="1">');
$se.val(seVolume);

$se.css({
position: "absolute",
left: "100px",
top: "510px",
width: "440px",
height: "50px",
zIndex: "10000000",
pointerEvents: "auto",
cursor: "pointer",
touchAction: "none"
});

var $seValue = $('<div></div>')
.text(seVolume + "%")
.css({
position: "absolute",
left: "245px",
top: "560px",
width: "150px",
textAlign: "center",
fontSize: "25px",
color: "#d87591"
});

$bgm.on("input change", function () {
var value = Number(this.value);

$bgmValue.text(value + "%");
localStorage.setItem("fhf_bgm_volume", value);

TYRANO.kag.ftag.startTag("bgmopt", {
volume: String(value),
effect: "true"
});
});

$se.on("input change", function () {
var value = Number(this.value);

$seValue.text(value + "%");
localStorage.setItem("fhf_se_volume", value);

TYRANO.kag.ftag.startTag("seopt", {
volume: String(value),
effect: "true"
});

// テストSEを鳴らす
TYRANO.kag.ftag.startTag("playse", {
storage: "touch/cheek.mp3"
});

});

$ui.append($bgm, $bgmValue, $se, $seValue);

// クリック待ちレイヤーより後ろに置かれないよう、
// ゲーム画面の一番最後に追加
$(".tyrano_base").append($ui);

})();

[endscript]


[_tb_end_tyrano_code]

[glink  color="black"  storage="credit.ks"  size="20"  text="クレジット"  x="227"  y="666"  width=""  height=""  _clickable_img=""  target="*open_credit"  ]
[glink  color="black"  storage="license.ks"  size="20"  text="ライセンス"  x="231"  y="742"  width=""  height=""  _clickable_img=""  ]
[tb_start_tyrano_code]
; ========================================
; 下部ボタン
; ========================================



; タイトルへ戻る
[ptext layer=fix name="conf_back_text" text="タイトルへ戻る" x=145 y=800 width=350 align=center size=28 color=0x5b4740 edge=0xffffff]

[clickable x=145 y=780 width=350 height=75 target="*back_title"]


[s]




; ========================================
; タイトルへ戻る
; ========================================

*back_title

[clearfix]

[iscript]
$("#fhf_config_sliders").remove();
[endscript]

[free layer=fix name="conf_title"]
[free layer=fix name="conf_bgm_text"]
[free layer=fix name="conf_se_text"]
[free layer=fix name="conf_license_text"]
[free layer=fix name="conf_back_text"]

[freeimage layer=1]

[jump storage="title_screen.ks" target="*start"]
[_tb_end_tyrano_code]


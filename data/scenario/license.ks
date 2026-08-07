[_tb_system_call storage=system/_license.ks]

[tb_start_tyrano_code]
*open_license

[clearfix]

[iscript]
$("#fhf_config_sliders").remove();
[endscript]

[free layer=fix name="conf_title"]
[free layer=fix name="conf_bgm_text"]
[free layer=fix name="conf_se_text"]
[free layer=fix name="conf_credit_text"]
[free layer=fix name="conf_license_text"]
[free layer=fix name="conf_back_text"]

[freeimage layer=1]

[jump storage="license.ks" target="*start"]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
*start
[_tb_end_tyrano_code]

[playse  volume="20"  time="1000"  buf="0"  storage="touch/head.mp3"  ]
[tb_start_tyrano_code]
[image storage="credit/license.png" layer=1 x=0 y=0]

[clickable x=0 y=0 width=640 height=960 target="*back"]
[s]
*back

[freeimage layer=1]

[jump storage="title_screen.ks" target="*start"]



[_tb_end_tyrano_code]


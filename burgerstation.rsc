m   �Q��$\ �$\G  icons/debug/mobs.dmi �PNG

   IHDR   @   @   ���   PLTE����  �O�K   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r�L�83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��26��   IDAT(���!�0�a\���'!�iH�uȽ�D\���7kxu$��3O���;����M�(!�t dr��d!��9�
|��(@_%|�{X��L���At�5w-�D�˺�N����':>V��|�W    IEND�B`�v    (�2?%\i>%\R   scripts\macros.dms macro
	Any return "button-press \[\[*]]"
	Any+UP return "button-release \[\[*]]"u    (�u@%\i>%\R   scripts\macro.dms macro
	Any return "button-press \[\[*]]"
	Any+UP return "button-release \[\[*]]"@   ND�B`�5  I�Ҟ�$\��$\  icons/debug/objs.dmi �PNG

   IHDR   @   @   ���   PLTE����  �O�K   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r�L�83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��26��   GIDAT(�c`����!�ʰ�e���2�䡌?���S�`c��0+�0ۙf�1�1un  y�Pw��C    IEND�B`�  ��P��$\|�$\�  icons/debug/areas.dmi �PNG

   IHDR   @   @   �iq�   izTXtDescription  x�%�1
� ����G����zAK�
T��n�	lf��YzSm幡 ���Wb�PX%��ʙ�H�'(pN,�ڠ�;j�Ұ���Y���*%��  9IDATx��Zm�� }��M�����,�|����N����91M��0%�� o  �'�?x8^w��U����T�4�"��9�� 9G�a �H7L��i��#�0�s��r�tc��'o3@��\�=��������_W 4G���<��������U<�*Gx/?4������|��3�Yy%s�����~�2�=�� �i�g|�W��~U$�A�
U���j��IH�������ȇ`g#��$��g���JW=�#����U��۳!p�7�]-�L#���/��s=�b�
�z�sז����r�t������5���tdX��1��չ�ޑ���@����IG���'��U�K?p����wN�_Հ��c5}�⤯���=��_'VV�(��h��K����S�ķ��9�P�.b�������g���v}@����7bh���K���{�t��V}�O�M�s���;ǯ�<�s���N����䨮t����7��������R	Ӏ�` �H7L��i��#�0�s��r�t�4@Αn��9ҍ?XZ�hq���    IEND�B`�U  T�Lv�$\�$\.  icons/debug/turfs.dmi �PNG

   IHDR   �   �   1|�   PLTE      L� & @@@� ������-   tRNS @��f   szTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r�L�83R3�3J ��ĒT SI��3%���4��L+J�M���
�r���*O����HY����8 "�-#o
-S  HIDATh��an�0��BJ���'�7�On� E����a�&�9�[�Z[�	���pto��ؚ/FtV��f'x�Os6	�N�/�;�	�@�މ6��U?�����n���i<Am��k���I�!��F($�8�t��5�F-�zQ���/��E�p��D���եN��E[�0��|�B)��{%�����N����G h�D'8�وΊ���8�8�<A�i�i���"�r瘱#�=�I�i�]��!�܊ C[r�aA��eA�?�����|]��RU߂:P}(�,�Z_�8�8�8�/��wJ��f�    IEND�B`��  X0%\0%\�  icons/debug/objs.dmi �PNG

   IHDR   �   @   ��   tzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)�P�U03���H�L�(�p�KKRl���8S2��l�8ӊsS!l���Ģ��"\ʔ\�\\|=� U�#5��W�  �IDATx��An�0EM�{�mo�+t�st�ܡ��{�tU��!����{R6�@����g�9'��I= Ђ � �9`�� � �9`�� � �9`�� � �9`�� �<��#�q��}v�y�}�$D������=�=��C��-_J"������c����5:�"@�d�]�����+��S�\s���c��Z	T�W`����;{
�vcH��n�c)����	�\ýn�%1Z�n*z�����Ys3�/�T4!�r�RM�5�p�����.:	��M~��`Jϓ���#S@&@�+�)���\���(]�D� Tf�$�l9
ٞ@u����_k�2�GM�eo���F��Wť ��Q�����y�`���C䥠�!	`�� ;���~�x{U��� � � �9`�� � �9`�� � �9`�� � �9?�Z�խt�    IEND�B`�    e@���V%\�V%\�  interface\default.dmf macro "macro"


menu "menu"
	elem 
		name = "&File"
		command = ""
		saved-params = "is-checked"
	elem 
		name = "&Quit"
		command = ".quit"
		category = "&File"
		saved-params = "is-checked"


window "main"
	elem "main"
		type = MAIN
		pos = 281,0
		size = 1280x720
		anchor1 = none
		anchor2 = none
		background-color = none
		is-default = true
		saved-params = "pos;size;is-minimized;is-maximized"
		macro = "macro"
		menu = "menu"
	elem "button1"
		type = BUTTON
		pos = 1200,696
		size = 80x24
		anchor1 = 100,100
		anchor2 = none
		background-color = none
		saved-params = "is-checked"
		text = "Enter"
		command = ""
	elem "input1"
		type = INPUT
		pos = 0,696
		size = 1200x24
		anchor1 = 0,100
		anchor2 = 100,100
		saved-params = ""
	elem "info1"
		type = INFO
		pos = 768,0
		size = 512x200
		anchor1 = 100,0
		anchor2 = none
		saved-params = ""
		tab-background-color = none
	elem "output"
		type = OUTPUT
		pos = 768,200
		size = 512x496
		anchor1 = 100,100
		anchor2 = none
		is-default = true
		saved-params = "max-lines"
	elem "map1"
		type = MAP
		pos = 0,0
		size = 768x696
		anchor1 = 0,0
		anchor2 = 100,100
		saved-params = "zoom;letterbox;zoom-mode"

�  o�dX%\8X%\�  icons/debug/mobs.dmi �PNG

   IHDR   �   @   ����   	PLTE����  b[�   tRNS @��f   mzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r�L�83R3�3J ��ĒT SI��3%���4��L+J�M���
2Js�p�RVp�s� ,�"�z��o   �IDATH���A
� �(C��C�����̲��xʉ�af!t`�E�Y(��Jȷ w�V̙9g�f2q���'��%�f@ ���%ilF`����׳��H�5�˯uA�>7�1NA���ǆ��@�@���9�|; �,zDo�a�ؾ�08 �s0�E��M7O���g�h�̀�Փ0h������$��&���	��:�YN������    IEND�B`�
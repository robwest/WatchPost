FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��
	WatchPost
	A script to watch a particular process for a drop in CPU utilization.
	Useful for tracking post-production apps and their rendering process.
		Original script from Josh Petok (@joshpetok) http://www.thecurrentcut.com/2010/02/10/avid-render-notification-app/	Modifications by Rob West (@robwest)	
	Version 2.0 - Open Source Github version
		Modified grep statements
		Added niceties to display dialog statements

     � 	 	X 
 	 W a t c h P o s t 
 	 A   s c r i p t   t o   w a t c h   a   p a r t i c u l a r   p r o c e s s   f o r   a   d r o p   i n   C P U   u t i l i z a t i o n . 
 	 U s e f u l   f o r   t r a c k i n g   p o s t - p r o d u c t i o n   a p p s   a n d   t h e i r   r e n d e r i n g   p r o c e s s . 
 	  	 O r i g i n a l   s c r i p t   f r o m   J o s h   P e t o k   ( @ j o s h p e t o k )   h t t p : / / w w w . t h e c u r r e n t c u t . c o m / 2 0 1 0 / 0 2 / 1 0 / a v i d - r e n d e r - n o t i f i c a t i o n - a p p /  	 M o d i f i c a t i o n s   b y   R o b   W e s t   ( @ r o b w e s t )  	 
 	 V e r s i o n   2 . 0   -   O p e n   S o u r c e   G i t h u b   v e r s i o n 
 	 	 M o d i f i e d   g r e p   s t a t e m e n t s 
 	 	 A d d e d   n i c e t i e s   t o   d i s p l a y   d i a l o g   s t a t e m e n t s 
 
   
  
 l     ��������  ��  ��        l     ��  ��    $  Define constants and defaults     �   <   D e f i n e   c o n s t a n t s   a n d   d e f a u l t s      l     ��������  ��  ��        l     ��  ��      Set version number     �   &   S e t   v e r s i o n   n u m b e r      j     �� �� 0 
appversion 
appVersion  m        �   
 2 . 0 . 0      l     ��������  ��  ��         l     �� ! "��   ! $  carriage return and line feed    " � # # <   c a r r i a g e   r e t u r n   a n d   l i n e   f e e d    $ % $ j    �� &�� 0 crlf   & b     ' ( ' l    )���� ) I   �� *��
�� .sysontocTEXT       shor * m    ���� ��  ��  ��   ( l    +���� + I   �� ,��
�� .sysontocTEXT       shor , m    	���� 
��  ��  ��   %  - . - l     ��������  ��  ��   .  / 0 / l     �� 1 2��   1 ) # Enter your email here as a default    2 � 3 3 F   E n t e r   y o u r   e m a i l   h e r e   a s   a   d e f a u l t 0  4 5 4 j    �� 6�� 0 myemail myEmail 6 m     7 7 � 8 8  r o b @ r o b w e s t . o r g 5  9 : 9 l     ��������  ��  ��   :  ; < ; l     �� = >��   = V P If you want the script to ask each time how to send the email, set this to true    > � ? ? �   I f   y o u   w a n t   t h e   s c r i p t   t o   a s k   e a c h   t i m e   h o w   t o   s e n d   t h e   e m a i l ,   s e t   t h i s   t o   t r u e <  @ A @ j    �� B��  0 askemailmethod askEmailMethod B m    ��
�� boovtrue A  C D C l     ��������  ��  ��   D  E F E l     �� G H��   G ) # Present startup explanation dialog    H � I I F   P r e s e n t   s t a r t u p   e x p l a n a t i o n   d i a l o g F  J K J l     ��������  ��  ��   K  L M L l     N���� N r      O P O I    �� Q R
�� .sysodlogaskr        TEXT Q b     	 S T S b      U V U m      W W � X X  
 W A T C H P O S T   V o    ���� 0 
appversion 
appVersion T m     Y Y � Z Z�   
 
 F i l l   o u t   t h e s e   d i a l o g   b o x e s   t o   g e t   a n   e m a i l   a l e r t   w h e n   y o u r   r e n d e r   i s   d o n e 
 
 T I P : 
 u s e   t h e s e   e m a i l   a d d r e s s e s   t o   s e n d   a   t e x t   d i r e c t l y   t o   y o u r   m o b i l e   p h o n e : 
 
 
     A T & T   c e l l n u m b e r @ t x t . a t t . n e t 
     V e r i z o n   c e l l n u m b e r @ v t e x t . c o m 
     T - M o b i l e   c e l l n u m b e r @ t m o m a i l . n e t 
     S p r i n t   P C S   c e l l n u m b e r @ m e s s a g i n g . s p r i n t p c s . c o m 
     V i r g i n   M o b i l e   c e l l n u m b e r @ v m o b l . c o m 
     U S   C e l l u l a r   c e l l n u m b e r @ e m a i l . u s c c . n e t 
     N e x t e l   c e l l n u m b e r @ m e s s a g i n g . n e x t e l . c o m 
     B o o s t   c e l l n u m b e r @ m y b o o s t m o b i l e . c o m 
     A l l t e l   c e l l n u m b e r @ m e s s a g e . a l l t e l . c o m 
 
 
 
 R �� [��
�� 
btns [ J   
  \ \  ] ^ ] m   
  _ _ � ` `  Q u i t ^  a�� a m     b b � c c 
 S t a r t��  ��   P o      ���� 0 	mystartup 	MystartUp��  ��   M  d e d l     ��������  ��  ��   e  f g f l      �� h i��   h   Quit Selected     i � j j    Q u i t   S e l e c t e d   g  k l k l     ��������  ��  ��   l  m n m l  | o���� o Z   | p q�� r p =    s t s n     u v u 1    ��
�� 
bhit v o    ���� 0 	mystartup 	MystartUp t m     w w � x x  Q u i t q I   "������
�� .aevtquitnull��� ��� null��  ��  ��   r k   %| y y  z { z l  % %��������  ��  ��   {  | } | l   % %�� ~ ��   ~ - ' see if there's an internet connection      � � � N   s e e   i f   t h e r e ' s   a n   i n t e r n e t   c o n n e c t i o n   }  � � � Q   % R � � � � I  ( -�� ���
�� .sysoexecTEXT���     TEXT � m   ( ) � � � � � $ c u r l   w w w . a p p l e . c o m��   � R      ������
�� .ascrerr ****      � ****��  ��   � k   5 R � �  � � � I  5 L�� � �
�� .sysodlogaskr        TEXT � m   5 6 � � � � � n T h i s   a p p   r e q u i r e s   a   w o r k i n g   c o n n e c t i o n   t o   t h e   i n t e r n e t . � �� � �
�� 
btns � J   7 : � �  ��� � m   7 8 � � � � �  Q u i t��   � �� � �
�� 
appr � m   = @ � � � � �  N o   i n t e r n e t � �� ���
�� 
disp � m   C F��
�� stic    ��   �  ��� � I  M R������
�� .aevtquitnull��� ��� null��  ��  ��   �  � � � l  S S��������  ��  ��   �  � � � l   S S�� � ���   � #  choose which app to monitor     � � � � :   c h o o s e   w h i c h   a p p   t o   m o n i t o r   �  � � � l  S S��������  ��  ��   �  � � � r   S m � � � J   S i � �  � � � m   S V � � � � �  F i n a l   C u t   P r o �  � � � m   V Y � � � � � * A d o b e   P r e m i e r e   P r o   C C �  � � � m   Y \ � � � � �  C o m p r e s s o r �  � � � m   \ _ � � � � �  D a v i n c i   R e s o l v e �  � � � m   _ b � � � � �  A v i d �  ��� � m   b e � � � � � 
 C o l o r��   � o      ���� 0 theapp theApp �  � � � r   n  � � � I  n {�� � �
�� .gtqpchltns    @   @ ns   � o   n q���� 0 theapp theApp � �� ���
�� 
prmp � m   t w � � � � � 4   C h o o s e   a n   a p p   t o   m o n i t o r :��   � o      ���� 0 theapp theApp �  � � � l  � ���������  ��  ��   �  � � � Z   � � � ����� � =  � � � � � o   � ����� 0 theapp theApp � m   � ���
�� boovfals � k   � � � �  � � � I  � ��� ���
�� .sysonotfnull��� ��� TEXT � m   � � � � � � � 6 W a t c h   P o s t   s c r i p t   c a n c e l l e d��   �  � � � l  � � � � � � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � ����� ��   � 9 3 give a little time for the notification to display    � � � � f   g i v e   a   l i t t l e   t i m e   f o r   t h e   n o t i f i c a t i o n   t o   d i s p l a y �  ��� � I  � �������
�� .aevtquitnull��� ��� null��  ��  ��  ��  ��   �  � � � l  � ���������  ��  ��   �  � � � l   � ��� � ���   � !  see if the app is running     � � � � 6   s e e   i f   t h e   a p p   i s   r u n n i n g   �  � � � l  � ���������  ��  ��   �  � � � Q   � � � � � � I  � ��� ���
�� .sysoexecTEXT���     TEXT � b   � � � � � b   � � � � � m   � � � � � � � : p s   - x c o   % c p u , c o m m a n d   |   g r e p   ' � o   � ����� 0 theapp theApp � m   � � � � � � �  '��   � R      ����~
�� .ascrerr ****      � ****�  �~   � k   � � � �  � � � r   � � � � � I  � ��} � �
�} .sysodlogaskr        TEXT � m   � � � � � � � � Y o u r   s e l e c t e d   a p p   i s n ' t   r u n n i n g .   S t a r t   y o u r   r e n d e r   a n d   t r y   a g a i n . � �| 
�| 
btns  J   � �  m   � � �  C o n t i n u e �{ m   � � �		  Q u i t�{   �z

�z 
appr
 m   � � �  A p p   N o t   R u n n i n g �y�x
�y 
disp m   � ��w
�w stic   �x   � o      �v�v 0 
notrunning 
notRunning � �u Z  � ��t�s =  � � n   � � 1   � ��r
�r 
bhit o   � ��q�q 0 
notrunning 
notRunning m   � � �  Q U I T I  � ��p�o�n
�p .aevtquitnull��� ��� null�o  �n  �t  �s  �u   �  l  � ��m�l�k�m  �l  �k    Z   �%�j�i o   � ��h�h  0 askemailmethod askEmailMethod r   �! I  ��g !
�g .sysodlogaskr        TEXT  m   � �"" �## Z D o   y o u   w a n t   t o   s e n d   y o u r   e m a i l   w i t h   M a i l . a p p ?! �f$%
�f 
btns$ J   �&& '(' m   �)) �**  N o( +�e+ m  ,, �--  Y e s�e  % �d./
�d 
dflt. m  
�c�c / �b01
�b 
appr0 m  22 �33 & S e l e c t   e m a i l   m e t h o d1 �a4�`
�a 
disp4 m  �_
�_ stic   �`   o      �^�^ 0 emailapp emailApp�j  �i   565 l &&�]�\�[�]  �\  �[  6 787 l  &&�Z9:�Z  9   get email details   : �;; $   g e t   e m a i l   d e t a i l s8 <=< l &&�Y�X�W�Y  �X  �W  = >?> r  &O@A@ n  &KBCB 1  GK�V
�V 
ttxtC l &GD�U�TD I &G�SEF
�S .sysodlogaskr        TEXTE m  &)GG �HH  T o :F �RIJ
�R 
dtxtI o  ,1�Q�Q 0 myemail myEmailJ �PKL
�P 
btnsK J  27MM N�ON m  25OO �PP  N e x t�O  L �NQR
�N 
dfltQ m  :;�M�M R �LS�K
�L 
apprS m  >ATT �UU  T o   E m a i l�K  �U  �T  A o      �J�J 0 messto messTo? VWV r  P{XYX n  PwZ[Z 1  sw�I
�I 
ttxt[ l Ps\�H�G\ I Ps�F]^
�F .sysodlogaskr        TEXT] m  PS__ �`` 
 F r o m :^ �Eab
�E 
dtxta c  V]cdc o  VY�D�D 0 theapp theAppd m  Y\�C
�C 
ctxtb �Bef
�B 
btnse J  ^cgg h�Ah m  ^aii �jj  N e x t�A  f �@kl
�@ 
dfltk m  fg�?�? l �>m�=
�> 
apprm m  jmnn �oo  F r o m   E m a i l�=  �H  �G  Y o      �<�< 0 messfrom messFromW pqp r  |�rsr n  |�tut 1  ���;
�; 
ttxtu l |�v�:�9v I |��8wx
�8 .sysodlogaskr        TEXTw m  |yy �zz  S u b j e c t :x �7{|
�7 
dtxt{ m  ��}} �~~ . [ W a t c h P o s t ]   Y o u r   R e n d e r| �6�
�6 
btns J  ���� ��5� m  ���� ���  N e x t�5  � �4��
�4 
dflt� m  ���3�3 � �2��1
�2 
appr� m  ���� ���  E m a i l   S u b j e c t�1  �:  �9  s o      �0�0 0 messsub messSubq ��� r  ����� n  ����� 1  ���/
�/ 
ttxt� l ����.�-� I ���,��
�, .sysodlogaskr        TEXT� m  ���� ���  M e s s a g e :� �+��
�+ 
dtxt� m  ���� ��� 0 Y o u r   R e n d e r   i s   C o m p l e t e .� �*��
�* 
btns� J  ���� ��)� m  ���� ���   G r a b   S o m e   C o f f e e�)  � �(��
�( 
dflt� m  ���'�' � �&��%
�& 
appr� m  ���� ���  E m a i l   B o d y�%  �.  �-  � o      �$�$ 0 messbody messBody� ��� l ���#�"�!�#  �"  �!  � ��� l ��� ���   � D > Get the current timestamp in order to measure the render time   � ��� |   G e t   t h e   c u r r e n t   t i m e s t a m p   i n   o r d e r   t o   m e a s u r e   t h e   r e n d e r   t i m e� ��� r  ����� l ������ e  ���� I �����
� .misccurdldt    ��� null�  �  �  �  � o      �� 0 	starttime 	startTime� ��� l ������  �  �  � ��� l ������  � � } Begin looping, monitoring the chosen process for a dip in CPU usage. For our purposes, we feel that 20% is a good threshold.   � ��� �   B e g i n   l o o p i n g ,   m o n i t o r i n g   t h e   c h o s e n   p r o c e s s   f o r   a   d i p   i n   C P U   u s a g e .   F o r   o u r   p u r p o s e s ,   w e   f e e l   t h a t   2 0 %   i s   a   g o o d   t h r e s h o l d .� ��� l ������  � Y S In this thinking, when the CPU usage drops below this number, the "render" is done   � ��� �   I n   t h i s   t h i n k i n g ,   w h e n   t h e   C P U   u s a g e   d r o p s   b e l o w   t h i s   n u m b e r ,   t h e   " r e n d e r "   i s   d o n e� ��� r  ����� m  ���� d� o      �� 0 
apppercent 
appPercent� ��� V  ���� k  ��� ��� r  ����� I �����
� .sysoexecTEXT���     TEXT� b  ����� b  ����� m  ���� ��� : p s   - x c o   % c p u , c o m m a n d   |   g r e p   '� o  ���� 0 theapp theApp� m  ���� ���  '�  � o      �� 0 
apppercent 
appPercent� ��� r  ���� c  �
��� l ����� n  ���� 4 ��
� 
cwor� m  �� � o  ��
�
 0 
apppercent 
appPercent�  �  � m  	�	
�	 
nmbr� o      �� 0 
apppercent 
appPercent� ��� I ���
� .sysodelanull��� ��� nmbr� m  �� �  �  � ?  ����� o  ���� 0 
apppercent 
appPercent� m  ���� � ��� l �� ���  �   ��  � ��� l ������  � U O Now measure the time difference to see how long the render took, approximately   � ��� �   N o w   m e a s u r e   t h e   t i m e   d i f f e r e n c e   t o   s e e   h o w   l o n g   t h e   r e n d e r   t o o k ,   a p p r o x i m a t e l y� ��� l ��������  ��  ��  � ��� r  %��� l !������ e  !�� I !������
�� .misccurdldt    ��� null��  ��  ��  ��  � o      ���� 0 endtime endTime� ��� r  &1��� \  &-��� o  &)���� 0 endtime endTime� o  ),���� 0 	starttime 	startTime� o      ���� 0 duration  � ��� r  2=��� _  29��� o  25���� 0 duration  � 1  58��
�� 
hour� o      ���� 0 hrs  � ��� r  >I��� _  >E   o  >A���� 0 duration   1  AD��
�� 
min � o      ���� 0 mins  �  r  JU `  JQ o  JM���� 0 duration   1  MP��
�� 
min  o      ���� 0 secs   	 l VV��������  ��  ��  	 

 r  Vu b  Vq b  Vm b  Vi b  Ve b  Va b  V] m  VY �  P r o c e s s   t o o k   o  Y\���� 0 hrs   m  ]` �    h o u r s ,   o  ad���� 0 mins   m  eh �    m i n u t e s   a n d   o  il���� 0 secs   m  mp   �!!    s e c o n d s . o      ���� $0 messbodyduration messBodyDuration "#" l vv��������  ��  ��  # $%$ r  v}&'& m  vy(( �)) 
 S h e l l' o      ���� 0 emailmethod emailMethod% *+* l ~~��������  ��  ��  + ,-, Z  ~�./����. o  ~�����  0 askemailmethod askEmailMethod/ Z ��01����0 = ��232 n  ��454 1  ����
�� 
bhit5 o  ������ 0 emailapp emailApp3 m  ��66 �77  Y e s1 r  ��898 m  ��:: �;;  M a i l9 o      ���� 0 emailmethod emailMethod��  ��  ��  ��  - <=< l ����������  ��  ��  = >?> l ����@A��  @ + % Send notification email via mail.app   A �BB J   S e n d   n o t i f i c a t i o n   e m a i l   v i a   m a i l . a p p? CDC Z  �nEF��GE = ��HIH o  ������ 0 emailmethod emailMethodI m  ��JJ �KK  M a i lF k  �LL MNM r  ��OPO m  ��QQ �RR  Y o u r   R e n d e rP o      ���� 0 emailsubject emailSubjectN STS l ����������  ��  ��  T U��U O  �VWV k  �XX YZY r  ��[\[ I ������]
�� .corecrel****      � null��  ] ��^_
�� 
kocl^ m  ����
�� 
bcke_ ��`��
�� 
prdt` K  ��aa ��bc
�� 
pvisb m  ����
�� boovtruec ��de
�� 
subjd o  ������ 0 messsub messSube ��f��
�� 
ctntf o  ������ 0 messbody messBody��  ��  \ o      ���� 0 
themessage 
theMessageZ g��g O  �hih k  �jj klk I �����m
�� .corecrel****      � null��  m ��no
�� 
kocln m  ����
�� 
trcpo ��pq
�� 
inshp n  ��rsr  ;  ��s 2 ����
�� 
trcpq ��t��
�� 
prdtt K  �uu ��vw
�� 
pnamv o  ����� 0 theapp theAppw ��x��
�� 
raddx o  ���� 0 messto messTo��  ��  l y��y I ��z��
�� .emsgsendnull���     bckez o  ���� 0 
themessage 
theMessage��  ��  i o  ������ 0 
themessage 
theMessage��  W m  ��{{�                                                                                  emal  alis    F  Macintosh HD               �y%�H+  p�Mail.app                                                       rϤ΄�c        ����  	                Applications    �y�(      ΄��    p�  #Macintosh HD:Applications: Mail.app     M a i l . a p p    M a c i n t o s h   H D  Applications/Mail.app   / ��  ��  ��  G k  n|| }~} l �����   5 / Send notification email via shell mail command   � ��� ^   S e n d   n o t i f i c a t i o n   e m a i l   v i a   s h e l l   m a i l   c o m m a n d~ ��� r  >��� n  :��� 1  6:��
�� 
strq� l 6������ c  6��� b  2��� b  .��� l *������ c  *��� b  &��� m  "�� ���  � o  "%���� 0 messbody messBody� m  &)��
�� 
ctxt��  ��  � m  *-�� ���   � o  .1���� $0 messbodyduration messBodyDuration� m  25��
�� 
ctxt��  ��  � o      ���� 0 completebody completeBody� ��� r  ?f��� b  ?b��� b  ?^��� b  ?Z��� b  ?V��� b  ?R��� b  ?J��� b  ?F��� m  ?B�� ��� 
 e c h o  � o  BE���� 0 completebody completeBody� m  FI�� ���    |   m a i l   - s  � l JQ������ n  JQ��� 1  MQ��
�� 
strq� o  JM���� 0 messsub messSub��  ��  � m  RU�� ���   � o  VY���� 0 messto messTo� m  Z]�� ���    - f  � o  ^a���� 0 messfrom messFrom� o      ���� 0 mailcmd mailCmd� ��� l gg��������  ��  ��  � ��� l  gg������  �   UNCOMMENT FOR DEBUG    � ��� *   U N C O M M E N T   F O R   D E B U G  � ��� l gg������  �   display dialog mailCmd   � ��� .   d i s p l a y   d i a l o g   m a i l C m d� ��� l gg��������  ��  ��  � ���� I gn�����
�� .sysoexecTEXT���     TEXT� o  gj���� 0 mailcmd mailCmd��  ��  D ��� l oo��������  ��  ��  � ��� l oo��������  ��  ��  � ��� I ov�����
�� .sysonotfnull��� ��� TEXT� m  or�� ��� ( Y o u r   r e n d e r   i s   d o n e !��  � ��� I w|�~��}
�~ .sysodelanull��� ��� nmbr� m  wx�|�| �}  �  ��  ��   n ��{� l     �z�y�x�z  �y  �x  �{       �w� � 7�v��w  � �u�t�s�r�q�u 0 
appversion 
appVersion�t 0 crlf  �s 0 myemail myEmail�r  0 askemailmethod askEmailMethod
�q .aevtoappnull  �   � ****� ���   

�v boovtrue� �p��o�n���m
�p .aevtoappnull  �   � ****� k    |��  L��  m�l�l  �o  �n  �  � ~ W Y�k _ b�j�i�h w�g ��f�e�d � ��c ��b�a�` � � � � � ��_�^ ��] ��\�[ � � ��Z�Y"),�X2�W�V�UG�TOT�S�R_�Qin�Py}���O�����N�M�L�K�J�I���H�G�F�E�D�C�B�A�@�? �>(�=6:JQ�<{�;�:�9�8�7�6�5�4�3�2�1�0�/�.���-�,�����+�
�k 
btns
�j .sysodlogaskr        TEXT�i 0 	mystartup 	MystartUp
�h 
bhit
�g .aevtquitnull��� ��� null
�f .sysoexecTEXT���     TEXT�e  �d  
�c 
appr
�b 
disp
�a stic    �` �_ 0 theapp theApp
�^ 
prmp
�] .gtqpchltns    @   @ ns  
�\ .sysonotfnull��� ��� TEXT
�[ .sysodelanull��� ��� nmbr
�Z stic   �Y 0 
notrunning 
notRunning
�X 
dflt
�W stic   �V �U 0 emailapp emailApp
�T 
dtxt
�S 
ttxt�R 0 messto messTo
�Q 
ctxt�P 0 messfrom messFrom�O 0 messsub messSub�N 0 messbody messBody
�M .misccurdldt    ��� null�L 0 	starttime 	startTime�K d�J 0 
apppercent 
appPercent�I 
�H 
cwor
�G 
nmbr�F �E 0 endtime endTime�D 0 duration  
�C 
hour�B 0 hrs  
�A 
min �@ 0 mins  �? 0 secs  �> $0 messbodyduration messBodyDuration�= 0 emailmethod emailMethod�< 0 emailsubject emailSubject
�; 
kocl
�: 
bcke
�9 
prdt
�8 
pvis
�7 
subj
�6 
ctnt�5 
�4 .corecrel****      � null�3 0 
themessage 
theMessage
�2 
trcp
�1 
insh
�0 
pnam
�/ 
radd
�. .emsgsendnull���     bcke
�- 
strq�, 0 completebody completeBody�+ 0 mailcmd mailCmd�m}�b   %�%���lvl E�O��,�  
*j 	YY 
�j W $X  ���kva a a a a  O*j 	Oa a a a a a a vE` O_ a a l E` O_ f  a j  Olj !O*j 	Y hO a "_ %a #%j W ?X  a $�a %a &lva a 'a a (a  E` )O_ )�,a *  
*j 	Y hOb   +a +�a ,a -lva .ka a /a a 0a 1 E` 2Y hOa 3a 4b  �a 5kva .ka a 6a 1 a 7,E` 8Oa 9a 4_ a :&�a ;kva .ka a <a 1 a 7,E` =Oa >a 4a ?�a @kva .ka a Aa 1 a 7,E` BOa Ca 4a D�a Ekva .ka a Fa 1 a 7,E` GO*j HE` IOa JE` KO <h_ Ka La M_ %a N%j E` KO_ Ka Ok/a P&E` KOa Qj ![OY��O*j HE` RO_ R_ IE` SO_ S_ T"E` UO_ S_ V"E` WO_ S_ V#E` XOa Y_ U%a Z%_ W%a [%_ X%a \%E` ]Oa ^E` _Ob   _ 2�,a `  a aE` _Y hY hO_ _a b  ua cE` dOa e c*a fa ga ha iea j_ Ba k_ Ga a l mE` nO_ n 3*a fa oa p*a o-6a ha q_ a r_ 8a la  mO_ nj sUUY Qa t_ G%a :&a u%_ ]%a :&a v,E` wOa x_ w%a y%_ Ba v,%a z%_ 8%a {%_ =%E` |O_ |j Oa }j  Okj ! ascr  ��ޭ
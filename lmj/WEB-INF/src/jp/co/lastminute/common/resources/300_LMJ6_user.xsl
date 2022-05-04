<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" encoding="Shift_JIS"/>
<xsl:template match="/">�y���X�g�~�j�b�g�E�h�b�g�E�R���z�������E���\��m�F
<xsl:value-of select="/ORDER/PRDUCT_SEND/LASTNAME" /> <xsl:value-of select="/ORDER/PRDUCT_SEND/FIRST_NAME" /> �l

���̓x�́A��`���ԏ�̂��\�񎒂�܂��Đ��ɗL��������܂��B
�ȉ��̓��e�ŏ���܂����B�������n�ɂđ�������x�����������B
���A���x�����͌����݂̂ł��肢�������܂��B
�\����e�ɂ��Ă��₢���킹�������Ē����ꍇ���������܂��B
���̏ꍇ�́A���ڂ��A������点�Ă��������܂��B
���炩���߂������������B
����̂��₢���킹�E���A���́A���ځA��g���ԏ�ւ��A����
���肢�������܂��B
�����p�A���ɗL��������܂����B

------------------- ���\����e --------------------

ORDER NO      : <xsl:value-of select="/ORDER/SUB_ORDER/ORDER_NO" />
SUB ORDER NO  : <xsl:value-of select="/ORDER/SUB_ORDER/SUB_ORDER_NO" />

---------------------------------------------
���i���F�H�c��`���ԏ�T�[�r�X
---------------------------------------------

�����p�Җ��i�����j�F <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_LASTNAME_KANJI" /> <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_FIRSTNAME_KANJI" />
�����p�Җ��i���ȁj�F <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_LASTNAME_KANA" /> <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_FIRSTNAME_KANA" />
�g�ѓd�b�ԍ��F <xsl:value-of select="/ORDER/PRDUCT_SEND/FAX" />

�v�����F <xsl:if test="/ORDER/SUB_ORDER/TITLE='A'">��`�^�[�~�i���󂯓n���v����  </xsl:if>
	<xsl:if test="/ORDER/SUB_ORDER/TITLE='B'">���}�v����  </xsl:if>
  <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/NIGHT" /> ����

�o�����F <xsl:if test="string-length(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKIN_DATE)=8">
               <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKIN_DATE, 5, 2)" /> �� <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKIN_DATE, 7, 2)" /> ��</xsl:if>
         <xsl:if test="string-length(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKIN_DATE)=4">
               <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKIN_DATE, 1, 2)" /> �� <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKIN_DATE, 3, 2)" /> ��</xsl:if>
�o���ցF <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/DEP_LINE" />
�A�����F <xsl:if test="string-length(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKOUT_DATE)=8">
               <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKOUT_DATE, 5, 2)" /> �� <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKOUT_DATE, 7, 2)" /> �� </xsl:if>
         <xsl:if test="string-length(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKOUT_DATE)=4">
               <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKOUT_DATE, 1, 2)" /> �� <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKOUT_DATE, 3, 2)" /> �� </xsl:if>
�A���ցF <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/ARRIVAL_LINE" />
�Ԏ햼�F <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CAR_TYPE" />
�ԃi���o�[�F <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CAR_NO" />

<xsl:value-of select="/ORDER/MAILCOMMENT" />

==================================================
do something lastminute.com
http://www.lastminute.co.jp

</xsl:template>
</xsl:stylesheet>

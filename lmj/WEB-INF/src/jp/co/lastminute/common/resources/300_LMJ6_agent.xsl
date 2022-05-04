<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" encoding="Shift_JIS"/>
<xsl:template match="/">�y���X�g�~�j�b�g�E�h�b�g�E�R���z��z�˗����[��
lastminute �\�����݃��[��
�z���C�g�p�[�L���O�@�䒆

�����b�ɂȂ��Ă���܂��B
�ȉ��̓��e�ɂĎ�z�˗����󂯂܂����̂ŁA
���m�F�����肢�������܂��B
�Ȃ��A���q�l�ւ͓��������ł̂��x���������肢���Ă���܂��B
�����X�������肢�\���グ�܂��B

������Ѓ��X�g�~�j�b�g�E�h�b�g�E�R��
03-3526-6221
supply@lastminute.co.jp

------------------- ���\����e --------------------

ORDER NO      : <xsl:value-of select="/ORDER/SUB_ORDER/ORDER_NO" />
SUB ORDER NO  : <xsl:value-of select="/ORDER/SUB_ORDER/SUB_ORDER_NO" />

---------------------------------------------
���i���F�H�c��`���ԏ�T�[�r�X
---------------------------------------------

���[���A�h���X�F <xsl:value-of select="/ORDER/PRDUCT_SEND/E_MAIL" />

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

==================================================
do something lastminute.com
http://www.lastminute.co.jp

</xsl:template>
</xsl:stylesheet>

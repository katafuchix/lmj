<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" encoding="Shift_JIS"/>
<xsl:template match="/">�y���X�g�~�j�b�g�E�h�b�g�E�R���z��z�˗����[��
lastminute �\�����݃��[��

�����b�ɂȂ��Ă���܂��B
�ȉ��̓��e�ɂĎ�z�˗����󂯂܂����̂ŁA
���Ή������肢�������܂��B

������Ѓ��X�g�~�j�b�g�E�h�b�g�E�R��
03-3526-6221
supply@lastminute.co.jp

------------------- ���\����e --------------------

ORDER NO      : <xsl:value-of select="/ORDER/SUB_ORDER/ORDER_NO" />
SUB ORDER NO  : <xsl:value-of select="/ORDER/SUB_ORDER/SUB_ORDER_NO" />

---------------------------------------------
���X�g�������F <xsl:value-of select="/ORDER/SUB_ORDER/TITLE" />
Restaurant Serial�F <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/RESTRANT/TARIFF_NO" />
Restaurant ID�F <xsl:value-of select="/ORDER/SUB_ORDER/AGT_PROD_CD" />
---------------------------------------------

���\��Җ��F <xsl:value-of select="/ORDER/PRDUCT_SEND/LASTNAME" /> <xsl:value-of select="/ORDER/PRDUCT_SEND/FIRST_NAME" />
���[���A�h���X�F <xsl:value-of select="/ORDER/PRDUCT_SEND/E_MAIL" />


�����p�Җ��i�����j�F <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_LASTNAME_KANJI" /> <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_FIRSTNAME_KANJI" />
�����p�Җ��i���ȁj�F <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_LASTNAME_KANA" /> <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_FIRSTNAME_KANA" />
�d�b�ԍ�1�F <xsl:value-of select="/ORDER/PRDUCT_SEND/FAX" />
�d�b�ԍ�2�F <xsl:value-of select="/ORDER/PRDUCT_SEND/MOBILE_E_MAIL" />
�g�у��[���A�h���X�F<xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/RESTRANT/MOBILE_EMAIL" />

�\����F <xsl:if test="string-length(/ORDER/SUB_ORDER/BUY_PROP/RESTRANT/CHECKIN_DATE)=8">
               <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/RESTRANT/CHECKIN_DATE, 5, 2)" /> �� <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/RESTRANT/CHECKIN_DATE, 7, 2)" /> �� </xsl:if>
             <xsl:if test="string-length(/ORDER/SUB_ORDER/BUY_PROP/RESTRANT/CHECKIN_DATE)=4">
               <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/RESTRANT/CHECKIN_DATE, 1, 2)" /> �� <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/RESTRANT/CHECKIN_DATE, 3, 2)" /> �� </xsl:if>
�\�񎞊ԁF <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/RESTRANT/CHECKIN_DATETIME" />
�l���F <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/RESTRANT/PAX" />
���v�]�ȂǁF <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/RESTRANT/ETC" />

==================================================
do something lastminute.com
http://www.lastminute.co.jp

</xsl:template>
</xsl:stylesheet>

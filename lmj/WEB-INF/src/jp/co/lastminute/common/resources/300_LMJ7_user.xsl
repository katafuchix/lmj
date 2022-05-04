<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" encoding="Shift_JIS"/>
<xsl:template match="/">�y���X�g�~�j�b�g�E�h�b�g�E�R���z�������E���\��m�F
<xsl:value-of select="/ORDER/PRDUCT_SEND/LASTNAME" /> <xsl:value-of select="/ORDER/PRDUCT_SEND/FIRST_NAME" /> �l

���̓x�́A�g�ѓd�b�̂��\�������܂��Đ��ɗL��������܂��B
���̃T�[�r�X�ɂ��܂��ẮA���L�̕��В�g����
��n���@�₨�x���Ȃǂ��A���������Ē����܂��B
�����p�A���ɗL��������܂����B

------------------- ���\����e --------------------

ORDER NO      : <xsl:value-of select="/ORDER/SUB_ORDER/ORDER_NO" />
SUB ORDER NO  : <xsl:value-of select="/ORDER/SUB_ORDER/SUB_ORDER_NO" />

---------------------------------------------
���i���F�g�ѓd�b�����^��
---------------------------------------------

���[���A�h���X�F <xsl:value-of select="/ORDER/PRDUCT_SEND/E_MAIL" />

���q�l���i�����j�F <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_LASTNAME_KANJI" /> <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_FIRSTNAME_KANJI" />
���q�l���i���ȁj�F <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_LASTNAME_KANA" /> <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_FIRSTNAME_KANA" />
�Z���F <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/STATENAME" /><xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_ADDRESS" /><xsl:value-of select="/ORDER/PRDUCT_SEND/BUILDADDRESS" />
�d�b�ԍ��F <xsl:value-of select="/ORDER/PRDUCT_SEND/MOBILE_E_MAIL" />
�g�ѓd�b�ԍ��F <xsl:value-of select="/ORDER/PRDUCT_SEND/FAX" />

�����^����]���i�F <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/KIBOUSYOUHIN='A'">�A�����J�^�C�v</xsl:if>
									 <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/KIBOUSYOUHIN='B'">�A�����J�E�J�i�_�^�C�v</xsl:if>
									 <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/KIBOUSYOUHIN='C'">��ă_�C���N�g�^�C�v</xsl:if>
									 <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/KIBOUSYOUHIN='D'">�O�A���E�T�C�p���^�C�v</xsl:if>
									 <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/KIBOUSYOUHIN='E'">�؍��^�C�v</xsl:if>
									 <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/KIBOUSYOUHIN='F'">���B�E�I�Z�A�j�A�E�A�W�A�E�A�t���J�^�C�v</xsl:if>
�����^����]�䐔�F <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/KIBOUDAISUU" /> ��
���i����]���F <xsl:if test="string-length(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKIN_DATE)=8">
               <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKIN_DATE, 5, 2)" /> �� <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKIN_DATE, 7, 2)" /> �� </xsl:if>
        				 <xsl:if test="string-length(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKIN_DATE)=4">
               <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKIN_DATE, 1, 2)" /> �� <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKIN_DATE, 3, 2)" /> �� </xsl:if>
���i�ԋp�\����F <xsl:if test="string-length(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKOUT_DATE)=8">
               <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKOUT_DATE, 5, 2)" /> �� <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKOUT_DATE, 7, 2)" /> �� </xsl:if>
             		 <xsl:if test="string-length(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKOUT_DATE)=4">
               <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKOUT_DATE, 1, 2)" /> �� <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/CHECKOUT_DATE, 3, 2)" /> �� </xsl:if>
���i����]�ꏊ�F <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/UKETORIKIBOUBASYO='A'">���c��`���</xsl:if>
									 <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/UKETORIKIBOUBASYO='B'">���c��`���</xsl:if>
									 <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/UKETORIKIBOUBASYO='C'">�֐���`</xsl:if>
									 <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/UKETORIKIBOUBASYO='D'">���É���`</xsl:if>
									 <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/UKETORIKIBOUBASYO='E'">��z��]</xsl:if>
�傽�闘�p���F <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/RIYOUKOKU" />
���S�̃T�[�r�X�̗L���F <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/SABISUUMU='0'">�s�v</xsl:if>
									 <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/SABISUUMU='1'">�v</xsl:if>
�x�������@�F <xsl:if test="/ORDER/PRDUCT_SEND/PAYMENT_WAY='0'">�N���W�b�g�J�[�h</xsl:if>
									 <xsl:if test="/ORDER/PRDUCT_SEND/PAYMENT_WAY='1'">�����O�U����</xsl:if>
���A�����@�F <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/MITUMORIRENRAKU='0'">�ǂ���ł���</xsl:if>
									 <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/MITUMORIRENRAKU='1'">���[���̂�</xsl:if>
									 <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/TRAVEL/MITUMORIRENRAKU='2'">�d�b�̂�</xsl:if>

<xsl:value-of select="/ORDER/MAILCOMMENT" />

==================================================
do something lastminute.com
http://www.lastminute.co.jp

</xsl:template>
</xsl:stylesheet>

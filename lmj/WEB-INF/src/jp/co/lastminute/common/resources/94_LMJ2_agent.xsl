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
���i���F�w���R�v�^�[�@�i�C�g�N���[�W���O
---------------------------------------------

���\��Җ��F <xsl:value-of select="/ORDER/PRDUCT_SEND/LASTNAME" /> <xsl:value-of select="/ORDER/PRDUCT_SEND/FIRST_NAME" />
���[���A�h���X�F <xsl:value-of select="/ORDER/PRDUCT_SEND/E_MAIL" />


�����p�Җ��i�����j�F <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_LASTNAME_KANJI" /> <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_FIRSTNAME_KANJI" />
�����p�Җ��i���ȁj�F <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_LASTNAME_KANA" /> <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_FIRSTNAME_KANA" />
�ً}�A����d�b�ԍ��F <xsl:value-of select="/ORDER/PRDUCT_SEND/FAX" />

���p���i����]�j�F <xsl:if test="string-length(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE)=8">
               <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE, 5, 2)" /> �� <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE, 7, 2)" /> �� </xsl:if>
             <xsl:if test="string-length(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE)=4">
               <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE, 1, 2)" /> �� <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE, 3, 2)" /> �� </xsl:if>
���p���i����]�j�F <xsl:if test="string-length(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE_2)=8">
               <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE_2, 5, 2)" /> �� <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE_2, 7, 2)" /> �� </xsl:if>
             <xsl:if test="string-length(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE_2)=4">
               <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE_2, 1, 2)" /> �� <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE_2, 3, 2)" /> �� </xsl:if>
�t���C�g���ԑсF <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PLAN='17'">17����</xsl:if>
<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PLAN='18'">18����</xsl:if>
<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PLAN='19'">19����</xsl:if>
<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PLAN='20'">20����</xsl:if>
���p�l���i��l�j�F <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PAXADULT" /> ��
�i���l�j�F <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PAXCHILD" /> ��
�i���v�j�F <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PAXSUM" /> ��
�R�[�X���F <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PURPOSE='1'">�_�C�A�����h�R�[�X</xsl:if>
	<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PURPOSE='3'">�_�C�A�����h�R�[�X�i2���ݐ؁j</xsl:if>
	<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PURPOSE='0'">�p�[���R�[�X</xsl:if>
	<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PURPOSE='2'">�p�[���R�[�X�i2���ݐ؁j</xsl:if>
	<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PURPOSE='4'">�T���Z�b�g�R�[�X</xsl:if>
	<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PURPOSE='5'">�x�C���C�g�R�[�X</xsl:if>
	<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PURPOSE='6'">�x�C���C�g�R�[�X�i2���ݐ؁j</xsl:if>
	<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PURPOSE='7'">�x�C�A�N�Z�X(�Г�)</xsl:if>
	<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PURPOSE='8'">�x�C�A�N�Z�X(����)</xsl:if>
���x�����@�F <xsl:if test="/ORDER/PRDUCT_SEND/PAYMENT_WAY='1'">��s�U�荞��</xsl:if>
	<xsl:if test="/ORDER/PRDUCT_SEND/PAYMENT_WAY='2'">�N���W�b�g�J�[�h�x����</xsl:if>

==================================================
do something lastminute.com
http://www.lastminute.co.jp

</xsl:template>
</xsl:stylesheet>

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
���i���F�N���X�^�����b�g�N���u �����p�N���[�Y
---------------------------------------------

���\��Җ��F <xsl:value-of select="/ORDER/PRDUCT_SEND/LASTNAME" /> <xsl:value-of select="/ORDER/PRDUCT_SEND/FIRST_NAME" />
���[���A�h���X�F <xsl:value-of select="/ORDER/PRDUCT_SEND/E_MAIL" />


�����p�Җ��i�����j�F <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_LASTNAME_KANJI" /> <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_FIRSTNAME_KANJI" />
�����p�Җ��i���ȁj�F <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_LASTNAME_KANA" /> <xsl:value-of select="/ORDER/PRDUCT_SEND/MAIN_FIRSTNAME_KANA" />
�ً}�A����d�b�ԍ��F <xsl:value-of select="/ORDER/PRDUCT_SEND/FAX" />

�v�������F <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PLAN='0'">�����`�N���[�Y</xsl:if>
<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PLAN='1'">�f�B�i�[�N���[�Y�i�C�^���A���R�[�X�j</xsl:if>
<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PLAN='2'">�i�C�g�N���[�Y</xsl:if>

���p�\����F <xsl:if test="string-length(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE)=8">
               	<xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE, 5, 2)" /> �� <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE, 7, 2)" /> �� </xsl:if>
             <xsl:if test="string-length(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE)=4">
	              <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE, 1, 2)" /> �� <xsl:value-of select="substring(/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/CHECKIN_DATE, 3, 2)" /> �� </xsl:if>
���p�l���i��l�j�F <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PAXADULT" /> ��
�i���l�j�F <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PAXCHILD" /> ��
�i�c���j�F <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PAXINFANT" /> ��
�i���v�j�F <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PAXSUM" /> ��
�N��ȂǁF <xsl:value-of select="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/ETC" />
���p�ړI�F <xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PURPOSE='1'">�o�[�X�f�[</xsl:if>
	<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PURPOSE='2'">�L�O��</xsl:if>
	<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PURPOSE='3'">���e��</xsl:if>
	<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PURPOSE='4'">�ڑҁE���k</xsl:if>
	<xsl:if test="/ORDER/SUB_ORDER/BUY_PROP/COLLEGE/PURPOSE='5'">���̑�</xsl:if>

==================================================
do something lastminute.com
http://www.lastminute.co.jp

</xsl:template>
</xsl:stylesheet>

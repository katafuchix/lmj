<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" encoding="Shift_JIS"/>
<xsl:template match="/">�y���X�g�~�j�b�g�E�h�b�g�E�R���z�������E���\��m�F
ORDER NO      : <xsl:value-of select="/ORDER/SUB_ORDER/ORDER_NO" />
SUB ORDER NO  : <xsl:value-of select="/ORDER/SUB_ORDER/SUB_ORDER_NO" />
--------------------------------------------------

<xsl:value-of select="/ORDER/PRDUCT_SEND/LASTNAME" /> <xsl:value-of select="/ORDER/PRDUCT_SEND/FIRST_NAME" /> �l

���̓x�́A���X�g�����u<xsl:value-of select="/ORDER/SUB_ORDER/TITLE" />�v�̂��\�������܂���
���ɗL��������܂��B
���Ђŋ�ȏ����m�F�̌�A���[���ɂė\��̉ۂ����A��
�����Ē����܂��B
���܂��΂炭���҂����������܂��悤���肢�\���グ�܂��B


�i���j���X�g�~�j�b�g�E�h�b�g�E�R��

<xsl:value-of select="/ORDER/MAILCOMMENT" />

==================================================
do something lastminute.com
http://www.lastminute.co.jp

</xsl:template>
</xsl:stylesheet>

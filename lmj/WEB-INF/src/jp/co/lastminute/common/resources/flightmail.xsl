<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" encoding="Shift_JIS"/>
<xsl:template match="/">
<xsl:value-of select="MAIL/MEMBER[@seq=1]/K_LNAME"/>�@<xsl:value-of select="MAIL/MEMBER[@seq=1]/K_FNAME"/>�l
���̓x�́A���X�g�~�j�b�g�E�h�b�g�E�R���������p�����܂��ėL��������܂��B
���₢���킹�͉��L�̗��s��Ђ�����܂��B
���₢���킹���e�̊m�F�̂��߁A���Ђ������͗��s��Ђ�育�A�������Ă�����
�����Ƃ�����܂��B
--------------------------------------------------
���Ɖ�A�h���X�F<xsl:value-of select="MAIL/EMAIL"/>
--------------------------------------------------
��t�ԍ��F<xsl:value-of select="MAIL/ORDER_NO"/>
���i���F<xsl:value-of select="MAIL/COURSE_NAME"/> (<xsl:value-of select="MAIL/CODE"/>)
<xsl:for-each select="MAIL/FLIGHT/">
<xsl:choose>
<xsl:when test="@seq=1">���{�o����</xsl:when>
<xsl:when test="@seq=2">���{������</xsl:when>
</xsl:choose> �o�����F<xsl:value-of select="ARRIVE_DATE"/> �o���n�F<xsl:value-of select="DEPT"/> �����n�F<xsl:value-of select="ARRIVE"/> ��]�o�����ԁF<xsl:value-of select="DEPT_TIME"/>�@
</xsl:for-each>���l�F<xsl:value-of select="MAIL/REMARKS"/>

���s�l���F��l <xsl:value-of select="MAIL/ADULT"/>�� �q�� <xsl:value-of select="MAIL/CHILD"/>�� �c�� <xsl:value-of select="MAIL/INFANT"/>��

�����s�ґS���̏��ł��B
<xsl:for-each select="MAIL/MEMBER">
<xsl:choose><xsl:when test="@seq=1">��\��</xsl:when><xsl:otherwise>���s��<xsl:value-of select="position()-1"/></xsl:otherwise></xsl:choose>�@
���O �����F(��)<xsl:value-of select="K_LNAME"/> (��)<xsl:value-of select="K_FNAME"/>
���� ���[�}���F(��)<xsl:value-of select="R_LNAME"/> (��)<xsl:value-of select="R_FNAME"/>
���ʁF<xsl:value-of select="TITLE"/> ���N�����F<xsl:value-of select="BIRTHDAY"/>�@
</xsl:for-each>

--------------------------------------------------
��\�҂̏��
�d�q���[���F<xsl:value-of select="MAIL/EMAIL"/>

�Z���@��<xsl:value-of select="MAIL/ZIP"/>
<xsl:value-of select="MAIL/STATE"/><xsl:value-of select="MAIL/ADDRESS1"/><xsl:value-of select="MAIL/ADDRESS2"/>

�A����d�b�ԍ��F<xsl:value-of select="MAIL/TEL"/>
�q�󌔂��󂯎����@�F<xsl:value-of select="MAIL/PAYMENT"/>
���x�������@�F<xsl:value-of select="MAIL/TICKETING"/>
���s�ړI�F<xsl:value-of select="MAIL/ADDRESSFLG"/>
==================================================
do something lastminute.com
http�F//www.lastminute.co.jp

<xsl:value-of select="MAIL/AGENT/MAILCOMMENT"/>
</xsl:template>
</xsl:stylesheet>

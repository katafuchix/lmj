#!/bin/bash

# �T�[�o�ؖ��������o�b�`

# JRE�z�[��
# ��j/export/home/MerchantModules/jre
set JRE_HOME = /usr/java/j2sdk1.4.0

# keytool�R�}���h�̃p�X
# ��j$JRE_HOME/bin/keytool
set KEY_TOOL = $JRE_HOME/bin/keytool

# ������certs�t�@�C���p�X
# ��j$JRE_PATH/lib/security/cacerts
set CERT_FILE = $JRE_HOME/jre/lib/security/cacerts

# ������certs�t�@�C���p�X
# ��jp1
set ALIAS_NAME = p1

# ��������ؖ����̃t�@�C����
# ��j/export/home/MerchantModules/certs/CyberTrust.cer
set IMPORT_FILE = /usr/local/jakarta-tomcat-4.0.3/webapps/lmj/WEB-INF/classes/jp/co/lastminute/card/certs/GlobalRoot.cer


$KEY_TOOL -import -file $IMPORT_FILE -storepass changeit -alias $ALIAS_NAME -keystore $CERT_FILE


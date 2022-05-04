/**
 * @(#)AuthOne.java 2001/09/01
 * Product: Merchant Module for Java
 * Copyright 2000-2001 Payment-One,Inc. All Rights Reserved.
 */
package jp.co.lastminute.card;

import java.io.*;
import java.util.*;
import com.ec_one.cBank.payment.*;
import com.ec_one.cBank.payment.model.*;

/**
 * ���σT���v�� for ����ꊇ<BR>
 *
 * @version 1.0 2001/11/01
 */
public class AuthOne implements Serializable {

	private String myShopCode;
	private String myShopPassword;

	private ResourceBundle resources;

	public AuthOne(){}
	
	/**
	 * �I�[�\�����s<BR>
	 */
	public void authory(String cardNumber, String cardExpiry) {
		PaymentRequestor requestor = null;
		try {
			// �v���p�e�B�̎擾�A�ݒ�
			resources = ResourceBundle.getBundle("p1", Locale.getDefault());
			myShopCode = resources.getString("shopcode");
			System.out.println(myShopCode);
			myShopPassword	= resources.getString("shoppwd");
			System.out.println(myShopPassword);
			String propspath = resources.getString("propspath");
			System.out.println(propspath);
			Properties props = System.getProperties();
			props.put("appl.props.path", propspath);

			// �I�[�\�����N�G�X�^�[�̃C���X�^���X���擾
			requestor = PaymentRequestorFactory.getInstance();

			// PaymentRequestor#init()�ŃI�[�\���Ɏg�p����[�����ʔԍ����擾����
			String terminalId = requestor.init();
			System.out.println("�[�����ʔԍ��F"+terminalId);

			// PaymentRequestor#getNumber()�ŃI�[�\���Ɏg�p����[�������ʔԂ��擾����
			// ���ӁF�[�������ʔԂ́A�[���i���ʔԍ��j���ɔ��s����܂�
			String seqNum = requestor.getNumber(terminalId);
			System.out.println("�[�������ʔԁF"+seqNum);

			// ���ϗp���f���쐬���f�[�^�Z�b�g
			PaymentModel model = PaymentModelFactory.getInstance();
			
			model.setAuthType(PaymentModel.AUTH_TYPE_CARDCHECK);
			model.setSeqNum(seqNum);
//			model.setAmount(1000);
//			model.setTax(50);
			model.setCreditCardNumber(cardNumber);
			model.setCreditCardExpiry(cardExpiry);
			model.setProDivision("00");
			model.setShopCode(myShopCode);
			model.setShopPassword(myShopPassword);

			requestor.setPaymentModel(model);

			// �I�[�\�����s
			requestor.cardCheck();

			// �I�[�\�����ʎ擾
			String errorCode = requestor.getResErrorCode();
			System.out.println("���ό���:" + errorCode);

			System.out.println("******************");
			System.out.println("�I�[�\�����ʉ���");
			System.out.println("******************");
			System.out.println("�G���[�R�[�h        ["+requestor.getResErrorCode()+"]");
			System.out.println("���N�G�X�g�R�[�h    ["+requestor.getResRequestCode()+"]");
			System.out.println("���W���[���o�[�W����["+requestor.getResModuleVersion()+"]");

			System.out.println("�ʐM����            ["+requestor.getResTranDate()+"]");
			System.out.println("�[�����ʔԍ�        ["+requestor.getResTermCode()+"]");
			System.out.println("�`�[�ԍ�            ["+requestor.getResReceiptNum()+"]");
			System.out.println("���F�ԍ�            ["+requestor.getResAdmitNum()+"]");
			System.out.println("�J�[�h�ԍ�          ["+requestor.getResCardNum()+"]");
			System.out.println("�L������            ["+requestor.getResEffectiveTerm()+"]");
			System.out.println("���z                ["+requestor.getResAmount()+"]");
			System.out.println("�ő���              ["+requestor.getResTax()+"]");
			System.out.println("�I�[�\����          ["+requestor.getResAuthDate()+"]");
			System.out.println("�x���敪            ["+requestor.getResPaymentDivision()+"]");
			System.out.println("�Ɩ��敪            ["+requestor.getResTransDivision()+"]");
			System.out.println("�J�[�h��ЃR�[�h    ["+requestor.getResRcvCompanyCode()+"]");
			System.out.println("�J�[�h��Ж�        ["+requestor.getResRcvCompanyName()+"]");
			System.out.println("����ԍ�            ["+requestor.getResTransactionNum()+"]");
			System.out.println("������`�[�ԍ�      ["+requestor.getResDelReceiptNum()+"]");
			System.out.println("������x���敪      ["+requestor.getResDelPaymentDivision()+"]");
			System.out.println("������ʐM����      ["+requestor.getResDelTranDate()+"]");

		} catch (PaymentUserException userEx) {
			if (userEx instanceof PaymentAuthoryUserException) {
				PaymentAuthoryUserException ex = (PaymentAuthoryUserException)userEx;
				System.out.println("Code:"+ex.getCode()+" Message:"+ex.getMessage());
			} else if (userEx instanceof PaymentInvalidUserParameterException) {
				PaymentInvalidUserParameterException ex = (PaymentInvalidUserParameterException)userEx;
				System.out.println(" Message:"+ex.getMessage());
			} else {
				System.out.println("Catch PaymentUserException:");
				userEx.printStackTrace();
			}
		} catch (PaymentSystemException systemEx) {
			if (systemEx instanceof PaymentAuthorySystemException) {
				PaymentAuthorySystemException ex = (PaymentAuthorySystemException)systemEx;
				System.out.println("Code:"+ex.getCode()+" Message:"+ex.getMessage());
			} else if (systemEx instanceof PaymentInvalidSystemParameterException) {
				PaymentInvalidSystemParameterException ex = (PaymentInvalidSystemParameterException)systemEx;
				System.out.println(" Message:"+ex.getMessage());
			} else {
				System.out.println("Catch PaymentSystemException:");
				systemEx.printStackTrace();
			}
		} catch (Throwable t) {
			System.out.println("�\�����Ȃ���O���L���b�`���܂���.["+t.toString()+"]");
		} finally {
			if (null != requestor)
				requestor.end();
		}
	}

	public static void main(String[] args){
		try {
			AuthOne auth = new AuthOne();
			auth.authory("1234123412341234   ", "0501");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}

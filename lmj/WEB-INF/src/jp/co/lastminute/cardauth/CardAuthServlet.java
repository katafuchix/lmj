package jp.co.lastminute.cardauth;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import javax.naming.*;

import com.ec_one.cBank.payment.*;
import com.ec_one.cBank.payment.model.*;

import jp.co.yobrain.logger.EnterpriseLog;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class CardAuthServlet extends HttpServlet implements CardAuth {

	private String myShopCode;
	private String myShopPassword;
	private String objname;

	private ServletContext servletContext;
	private ResourceBundle resources;

	private static String logpathinfo = "";
	private static String logsize = "";
	private static String loggenerations = "";

	public void init(ServletConfig servletConfig) throws ServletException {
		super.init(servletConfig);
		servletContext = servletConfig.getServletContext();

		try {
			resources =
				ResourceBundle.getBundle(
					"jp.co.lastminute.cardauth.resources.CardAuth",
					Locale.getDefault());
			myShopCode = resources.getString("shopcode");
			System.out.println("myShopCode;" + myShopCode);
			myShopPassword = resources.getString("shoppwd");
			System.out.println("myShopPassword" + myShopPassword);
			String propspath = resources.getString("propspath");
			System.out.println("propspath" + propspath);
			System.setProperty("appl.props.path", propspath);
			objname = resources.getString("objname");

			logpathinfo = resources.getString("logpathinfo");
			logsize = resources.getString("logsize");
			loggenerations = resources.getString("loggenerations");

			Properties env = System.getProperties();
			Context ictx = new InitialContext(env);
			ictx.bind(objname, this);
			Object obj = ictx.lookup(objname);
			System.out.println(obj);
			ictx.close();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}
	public void destroy() {
		try {
			Properties env = System.getProperties();
			Context ictx = new InitialContext(env);
			ictx.unbind(objname);
		} catch (Exception e) {
			System.out.println(e);
		}
		super.destroy();
	}
	public String cardCheck(String cardNumber, String cardExpiry) {
		return cardCheck(cardNumber, cardExpiry, "", 0, false);
	}
	public String cardCheck(
		String cardNumber,
		String cardExpiry,
		boolean flag) {
		return cardCheck(cardNumber, cardExpiry, "", 0, flag);
	}
	public String cardCheck(String cardNumber, String cardExpiry, int price) {
		return cardCheck(cardNumber, cardExpiry, "", price, false);
	}
	public String cardCheck(
		String cardNumber,
		String cardExpiry,
		int price,
		boolean flag) {
		return cardCheck(cardNumber, cardExpiry, "", price, flag);
	}
	public String cardCheck(
		String cardNumber,
		String cardExpiry,
		String order_num,
		int price) {
		return cardCheck(cardNumber, cardExpiry, order_num, price, false);
	}
	/**
	 *
	 */
	public String cardCheck(
		String cardNumber,
		String cardExpiry,
		String order_num,
		int price,
		boolean flag) {
		PaymentRequestor requestor = null;
		String admitNum = "";
		try {
			// �I�[�\�����N�G�X�^�[�̃C���X�^���X���擾
			requestor = PaymentRequestorFactory.getInstance();

			// PaymentRequestor#init()�ŃI�[�\���Ɏg�p����[�����ʔԍ����擾����
			String terminalId = requestor.init();

			// PaymentRequestor#getNumber()�ŃI�[�\���Ɏg�p����[�������ʔԂ��擾����
			// ���ӁF�[�������ʔԂ́A�[���i���ʔԍ��j���ɔ��s����܂�
			String seqNum = requestor.getNumber(terminalId);

			// ���ϗp���f���쐬���f�[�^�Z�b�g
			PaymentModel model = PaymentModelFactory.getInstance();
			System.out.println("cardCheck execute");

			if ((order_num.length() == 0) && (price == 0)) {
				model.setAuthType(PaymentModel.AUTH_TYPE_CARDCHECK);
				model.setSeqNum(seqNum);
				model.setCreditCardNumber(cardNumber);
				model.setCreditCardExpiry(cardExpiry);
				model.setProDivision("00");
				model.setShopCode(myShopCode);
				model.setShopPassword(myShopPassword);
				requestor.setPaymentModel(model);
				requestor.cardCheck();
			} else {
				model.setAuthType(PaymentModel.AUTH_TYPE_URIAGE); ////ADD
				model.setSeqNum(seqNum);
				model.setCreditCardNumber(cardNumber);
				model.setCreditCardExpiry(cardExpiry);
				model.setProDivision("00");
				model.setShopCode(myShopCode);
				model.setShopPassword(myShopPassword);
				model.setAmount(price); ///ADD
				model.setTax(0);
				if (order_num.length() > 0) {
					model.setTransactionNum(order_num);
				}
				requestor.setPaymentModel(model);
				requestor.buy();
			}
			//System.out.println("cardCheck exit");

			// �I�[�\�����ʎ擾
			String errorCode = requestor.getResErrorCode();
			if (flag) {
				if (errorCode.equals("000")) {
					admitNum = requestor.getResAdmitNum();
				} else {
					admitNum = getRequestErr(requestor);
				}
			} else {
				if (errorCode.equals("000")) {
					admitNum = requestor.getResAdmitNum();
				}
			}
			System.err.println("admitNum :" + admitNum);
			System.err.println("logpathinfo: " + logpathinfo);
			System.err.println("logsize: " + logsize);
			System.err.println("loggenerations: " + loggenerations);
			try {
				EnterpriseLog logger =new EnterpriseLog(logpathinfo, logsize, loggenerations);
				logger.openLog();
				logger.logTrace("�[�����ʔԍ��F" + terminalId);
				logger.logTrace("�[�������ʔԁF" + seqNum);
				logger.logTrace("���ό���:" + errorCode);
				logger.logTrace(getRequestErr(requestor));
				logger.closeLog();
			} catch (Exception ex) {
				ex.printStackTrace();
			}

		} catch (PaymentUserException userEx) {
			if (userEx instanceof PaymentAuthoryUserException) {
				PaymentAuthoryUserException ex =
					(PaymentAuthoryUserException) userEx;
				System.out.println(
					"Code:" + ex.getCode() + " Message:" + ex.getMessage());
				admitNum = "Message:" + ex.getMessage();
			} else if (
				userEx instanceof PaymentInvalidUserParameterException) {
				PaymentInvalidUserParameterException ex =
					(PaymentInvalidUserParameterException) userEx;
				System.out.println(" Message:" + ex.getMessage());
				admitNum = "Message:" + ex.getMessage();
			} else {
				System.out.println("Catch PaymentUserException:");
				userEx.printStackTrace();
				admitNum = "Message:" + userEx.getMessage();
			}
		} catch (PaymentSystemException systemEx) {
			systemEx.printStackTrace();
			if (systemEx instanceof PaymentAuthorySystemException) {
				PaymentAuthorySystemException ex =
					(PaymentAuthorySystemException) systemEx;
				System.out.println(
					"Code:" + ex.getCode() + " Message:" + ex.getMessage());
					admitNum = "Message:" + ex.getMessage();
			} else if (
				systemEx instanceof PaymentInvalidSystemParameterException) {
				PaymentInvalidSystemParameterException ex =
					(PaymentInvalidSystemParameterException) systemEx;
				System.out.println(" Message:" + ex.getMessage());
				admitNum = "Message:" + ex.getMessage();
			} else {
				System.out.println("Catch PaymentSystemException:");
				systemEx.printStackTrace();
				admitNum = "Message:" + systemEx.getMessage();
			}
		} catch (Throwable t) {
			System.out.println("�\�����Ȃ���O���L���b�`���܂���.[" + t.toString() + "]");
			admitNum = "Message:�\�����Ȃ���O���L���b�`���܂���";
		} finally {
			if (null != requestor)
				requestor.end();
		}
		return admitNum;
	}
	private static String getRequestErr(PaymentRequestor requestor)
		throws Exception {
		StringBuffer sb = new StringBuffer();
		sb.append("******************");
		sb.append("�I�[�\�����ʉ���");
		sb.append("******************");
		sb.append("�G���[�R�[�h        [" + requestor.getResErrorCode() + "]");
		sb.append("���N�G�X�g�R�[�h    [" + requestor.getResRequestCode() + "]");
		sb.append("���W���[���o�[�W����[" + requestor.getResModuleVersion() + "]");
		sb.append("�ʐM����            [" + requestor.getResTranDate() + "]");
		sb.append("�[�����ʔԍ�        [" + requestor.getResTermCode() + "]");
		sb.append("�`�[�ԍ�            [" + requestor.getResReceiptNum() + "]");
		sb.append("���F�ԍ�            [" + requestor.getResAdmitNum() + "]");
		sb.append("�J�[�h�ԍ�          [" + requestor.getResCardNum() + "]");
		sb.append("�L������            [" + requestor.getResEffectiveTerm() + "]");
		sb.append("���z                [" + requestor.getResAmount() + "]");
		sb.append("�ő���              [" + requestor.getResTax() + "]");
		sb.append("�I�[�\����          [" + requestor.getResAuthDate() + "]");
		sb.append(
			"�x���敪            [" + requestor.getResPaymentDivision() + "]");
		sb.append("�Ɩ��敪            [" + requestor.getResTransDivision() + "]");
		sb.append("�J�[�h��ЃR�[�h    [" + requestor.getResRcvCompanyCode() + "]");
		sb.append("�J�[�h��Ж�        [" + requestor.getResRcvCompanyName() + "]");
		sb.append("����ԍ�            [" + requestor.getResTransactionNum() + "]");
		sb.append("������`�[�ԍ�      [" + requestor.getResDelReceiptNum() + "]");
		sb.append(
			"������x���敪      [" + requestor.getResDelPaymentDivision() + "]");
		sb.append("������ʐM����      [" + requestor.getResDelTranDate() + "]");
		return sb.toString();
	}
}
package jp.co.yobrain.util.form.conf;

import jp.co.yobrain.util.form.*;

/**
* FormDate�`�F�b�N�p�C���^�[�t�F�[�X
*
*/

public interface FormCheck{
	/**
	* ������̃R���o�[�g�y�уG���[�`�F�b�N
	* @return	CheckError	CheckError�I�u�W�F�N�g
	* @param	valu	�`�F�b�N���镶����
	*/
	public CheckError convertCheck(String valu, CheckError checkError);

        /** ���l�^��錾 */
	public final static int TYPE_NUMBER_ = 0;
	/** ������^��錾 */
	public final static int TYPE_STRING_ = 1;
	/** �����_�^��錾 */
	public final static int TYPE_FLOAT_ = 2;
	/** ���t�^��錾 */
	public final static int TYPE_DATE_ =  3;
	/** E_MAIL�^��錾 */
	public final static int TYPE_EMAIL_ = 4;
	/** �ʉ݌^��錾 */
	public final static int TYPE_MONEY_ = 5;
	/** �A���t�@�x�b�g�^��錾 */
	public final static int TYPE_ALPHABET_ = 6;
	/** �p�����^��錾 */
	public final static int TYPE_ALPHABETNUMBER_ = 7;
	/** �����^��錾 */
	public final static int TYPE_DATETIME_ =  8;
	/** �d�b�^��錾 */
	public final static int TYPE_PHONE_ =  9;
        /** 2�o�C�g */
        public final static int TYPE_TWOBYTE_ =  10;
        /** �^�C�v�� */
	public final static int MAX = 11;
        
	/**
	*�S�p�J�^�J�i��Ԃ�
	*/
	public static final char[][] KANA = {
		{0x3002},				// �B
		{0x300c},				// �u
		{0x300d},				// �v
		{0x3001},				// �A
		{0x30fb},				// �E
		{0x30f2},				// ��
		{0x30a1},				// �@
		{0x30a3},				// �B
		{0x30a5},				// �D
		{0x30a7},				// �F
		{0x30a9},				// �H
		{0x30e3},				// ��
		{0x30e5},				// ��
		{0x30e7},				// ��
		{0x30c3},				// �b
		{0x002d},				// �|
		{0x30a2},				// �A
		{0x30a4},				// �C
		{0x30a6,0x30f4},		// �E,��
		{0x30a8},				// �G
		{0x30aa},				// �I
		{0x30ab,0x30ac},		// �J,�K
		{0x30ad,0x30ae},		// �L,�M
		{0x30af,0x30b0},		// �N,�O
		{0x30b1,0x30b2},		// �P,�Q
		{0x30b3,0x30b4},		// �R,�S
		{0x30b5,0x30b6},		// �T,�U
		{0x30b7,0x30b8},		// �V,�W
		{0x30b9,0x30ba},		// �X,�Y
		{0x30bb,0x30bc},		// �Z,�[
		{0x30bd,0x30be},		// �\,�]
		{0x30bf,0x30c0},		// �^,�_
		{0x30c1,0x30c2},		// �`,�a
		{0x30c4,0x30c5},		// �c,�d
		{0x30c6,0x30c7},		// �e,�f
		{0x30c8,0x30c9},		// �g,�h
		{0x30ca},				// �i
		{0x30cb},				// �j
		{0x30cc},				// �k
		{0x30cd},				// �l
		{0x30ce},				// �m
		{0x30cf,0x30d0,0x30d1},	// �n,�o,�p
		{0x30d2,0x30d3,0x30d4},	// �q,�r,�s
		{0x30d5,0x30d6,0x30d7},	// �t,�u,�v
		{0x30d8,0x30d9,0x30da},	// �w,�x,�y
		{0x30db,0x30dc,0x30dd},	// �z,�{,�|
		{0x30de},				// �}
		{0x30df},				// �~
		{0x30e0},				// ��
		{0x30e1},				// ��
		{0x30e2},				// ��
		{0x30e4},				// ��
		{0x30e6},				// ��
		{0x30e8},				// ��
		{0x30e9},				// ��
		{0x30ea},				// ��
		{0x30eb},				// ��
		{0x30ec},				// ��
		{0x30ed},				// ��
		{0x30ef},				// ��
		{0x30f3},				// ��
		{0x309b},				//
		{0x309c}				//
	};

	/**
	*���p������Ԃ�
	*/
	public static final String NUMBER =
		"\u002d\u002e\u002f\u0030\u0031\u0032" +		// - . / 0 1 2
		"\u0033\u0034\u0035\u0036\u0037\u0038" +		// 3 4 5 6 7 8
		"\u0039";										// 9

	/**
	*���p�p����Ԃ�
	*/
	public static final String ALPHABET =
		"\u0040\u0041\u0042\u0043\u0044\u0045\u0046\u0047\u0048\u0049" +	/** @ A B C D E F G H I	*/
		"\u004a\u004b\u004c\u004d\u004e\u004f\u0050\u0051\u0052" +			/** J K L M N O P Q R	*/
		"\u0053\u0054\u0055\u0056\u0057\u0058\u0059\u005a\u005b" +			/** S T U V W X Y Z [	*/
		"\u00a5\u005d\u005e\u005f\u0060\u0061\u0062\u0063\u0064" +			/** \ ] ^ _ ` a b c d	*/
		"\u0065\u0066\u0067\u0068\u0069\u006a\u006b\u006c\u006d" +			/** e f g h i j k l m	*/
		"\u006e\u006f\u0070\u0071\u0072\u0073\u0074\u0075\u0076" +			/** n o p q r s t u v	*/
		"\u0077\u0078\u0079\u007a";											/** w x y z				*/

	/**
	*�����G���R�[�h�^�C�v�萔�ł��B
	*/
	public static final String CODE = "SJIS";


}
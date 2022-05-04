/*
 * JDBCAdapter.java
 *
 * Created on 2002/03/25, 10:11
 */
package jp.co.yobrain.util.jdbc;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;
/**
 *
 * @author	skondo
 * @version J2ee-2
 */
public class JdbcAdapter implements Serializable {
	//��{�f�[�^�^�C�v
	private InitialContext ic; //�ڑ��v�[�����O
	private DataSource ds; //�f�[�^�\�[�X


	private static boolean autoCommit = false;

	/** �R���X�g���N�^�[ */
	public JdbcAdapter() {
		ic = null;
		ds = null;
	}
	/**
	 * �C�j�V�����C�Y
	 */
	synchronized public boolean init(DataSource dss) {
		try {
			this.ds = dss;
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * �R�l�N�V�����̎擾
	 **/
	synchronized public Connection getConnection() {
		Connection conn = null;
		try {
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	/**
	 * �R�l�N�V�����̐ؒf
	*/
	synchronized public void close(Connection conn) {
		try {
			conn.close();
			return;
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			return;
		} catch (Exception ex) {
			ex.printStackTrace();
			return;
		} finally {
			if (conn != null)
				conn = null;
			return;
		}
	}
	/**
	 * �Z���N�g�𔭍s����B
	 * @return	Vector	����
	 * @param	String	query	SQL
	 */
	synchronized public Vector dbSelect(String query) {
		return dbSelect(query, -1, -1);
	}
	/**
	 * �Z���N�g�𔭍s����B
	 * @return	Vector	����
	 * @param	String	query	SQL
	 * @param	int start �J�n�s
	 * @param	int end		�I���s
	 */
	synchronized public Vector dbSelect(String query, int start, int end) {
		//////executeQuery()���Ăяo��///////////////////
		return executeQuery(query, start, end);
	}
	/**
	 �� �A�b�v�f�[�g
	 * @return boolean	true / flase	
	 * @param	String	query	SQ
	 */
	synchronized public boolean dbUpdate(String query) {
		return executeSQL(query);
	}
	/**
	 * �C���T�[�g
	 * @return boolean	true / flase		
	 * @param	String	query	SQL
	*/
	synchronized public boolean dbInsert(String query) {
		return executeSQL(query);
	}

	/**
	 * ���[���o�b�N
	 */
	synchronized public void rollback(Connection conn) {
		try {
			conn.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * �R�~�b�g 
	 */
	synchronized public void Commit(Connection conn) {
		try {
			conn.commit(); //conn.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * ���������̎��s
	 */
	synchronized private Vector executeQuery(String query) {
		return executeQuery(query, -1, -1);
	}
	/**
	 * ���������̎��s
	 */
	synchronized private Vector executeQuery(
		String query,
		int start,
		int end) {
		Statement stmt = null; //�X�e�[�g�����g
		ResultSet rset = null; //���R�[�h�Z�b�g
		Connection conn = null;
		String columnNames[] = {
		}; //�J�����l�[���W��
		Vector rows = new Vector(); //�s
		ResultSetMetaData metaData; //�ꎞ�ۑ����^�f�[�^
		try {
			String queryUpper = query.toUpperCase();
			/////�J�n�s�̕s�����L���b�`///////////////////////////////////////
			//�N�G���[��SELECT�������珈�������������ď��������s,����ȊO�͒ʏ���s/////
			if (query.indexOf("select") != -1
				|| query.indexOf("SELECT") != -1) {
				conn = getConnection();
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				metaData = rset.getMetaData();
				//////�J������int�z����擾�E�J�������̃X�g�����O�z����擾///////
				int numberOfColumns = metaData.getColumnCount();
				columnNames = new String[numberOfColumns];
				//////�_�~�[�J�E���g�����[�v������////////////////////////////////
				if (start != -1) {
					for (int dmyCount = 0; dmyCount < start; dmyCount++) {
						if (rset.next() == false)
							break;
					}
				}
				//////�s�x�N�^�[�Ƀf�[�^���i�[/////
				int rowCount = 0;
				while (rset.next()) {
					if (end != -1 && end == end) {
						break;
					}
					Vector newRow = new Vector();
					for (int i = 1; i <= columnNames.length; i++) {
						newRow.addElement(rset.getObject(i));
					}
					rows.addElement(newRow);
				}
				//�X�e�[�g�����g���N���[�Y����//
				rset.close();
				stmt.close();
				close(conn);
			}
		} catch (Exception e) {
			//if( rset != null ){ rset.close();   }
			//if( stmt != null ){ stmt.close();   }
			if (conn != null) {
				close(conn);
			}
			e.printStackTrace();
		}
		return rows;
	}
	/**
	 * �X�V�n�f�[�^�x�[�X����
	 */
	synchronized private boolean executeSQL(String query) {
		Statement stmts; //�X�e�[�g�����g
		String queryUpper;
		Connection conn = null;
		try {
			conn = getConnection();
			queryUpper = query.toUpperCase();	//��r�̂��߃A�b�p�[�ɐݒ�
			//�s����SQL���������ꍇ�́A���[���o�b�N
			if ((queryUpper.indexOf("INSERT") == -1)
				&& (queryUpper.indexOf("UPDATE") == -1)) {
				close(conn);
				return false;
			}
			//����ȕ�������X�e�[�g�����g�֒ǉ�
			stmts = conn.createStatement();
			if (stmts.executeUpdate(query) > 0) {
				Commit(conn);
				queryUpper = "";
				stmts.close();
				close(conn);
				return true;
			} else {
				rollback(conn);
				queryUpper = "";
				stmts.close();
				close(conn);
				return false;
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				close(conn);
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			if (conn != null) {
				close(conn);
			}
			return false;
		}
	}
	/**
	 * �폜
	 */
	synchronized public boolean removeSQL(String query) {
		Statement stmts; //�X�e�[�g�����g
		String queryUpper;
		Connection conn = null;
		try {
			conn = getConnection();
			queryUpper = query.toUpperCase();	//��r�̂��߃A�b�p�[�ɐݒ�
			//�s����SQL���������ꍇ�́A���[���o�b�N
			if ((queryUpper.indexOf("UPDATE") == -1)
				&& (queryUpper.indexOf("DELETE") == -1)) {
				close(conn);
				return false;
			}
			//����ȕ�������X�e�[�g�����g�֒ǉ�
			stmts = conn.createStatement();
			if (stmts.executeUpdate(query) > 0) {
				Commit(conn);
				queryUpper = "";
				stmts.close();
				close(conn);
				return true;
			} else {
				rollback(conn);
				queryUpper = "";
				stmts.close();
				close(conn);
				return false;
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				close(conn);
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			if (conn != null) {
				close(conn);
			}
			return false;
		}
	}
	/**
	 * �u'�v �� �u''�v�ɕϊ�	
	 * @return 	String	�ύX�f�[�^
	 * @param	String str
	 */
	public static String convQuotation(String str) {
		String res = str;
		int wedge = 0;
		int point = 0;
		while ((point = res.indexOf("'", wedge)) > 0) {
			if (point == res.indexOf("''", wedge)) {
				res = res.substring(0, point) + "''" + res.substring(point + 1);
				wedge = point + 2;
			}
		}
		return res;
	}
	/**
	* �u'�v �� �u''�v�ɕϊ�	
	* @return 	String	�ύX�f�[�^
	* @param	String str
	*/
	public static String convQuotationNeo(String str) {
		String reStr = "";
		String sq = "\'";
		String dq = "\"";
		String aq = "&";
		try {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < str.length(); i++) {
				if (str.substring(i, i + 1).equals(sq)) {
					sb.append(sq);
					sb.append(sq);
				} else if (str.substring(i, i + 1).equals(aq)) {
					sb.append(dq);
					sb.append(aq);
					sb.append(dq);
				} else {
					sb.append(str.substring(i, i + 1));
				}
			}
			reStr = sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reStr;
	}
	public static String convQuotationReover(String str) {
		String reStr = "";
		String sq = "\'";
		String dq = "\"";
		String aq = "&";
		try {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < str.length(); i++) {
				if (str.substring(i, i + 1).equals(sq)) {
					sb.append(sq);
					sb.append(sq);
				} else if (str.substring(i, i + 1).equals(aq)) {
					sb.append(dq);
					sb.append(aq);
					sb.append(dq);
				} else {
					sb.append(str.substring(i, i + 1));
				}
			}
			reStr = sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reStr;
	}
	public static String convQuotationReoverReverse(String str) {
		String reStr = "";
		String dq = "\"";
		try {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < str.length(); i++) {
				if (!str.substring(i, i + 1).equals(dq)) {
					sb.append(str.substring(i, i + 1));
				}
			}
			reStr = sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reStr;
	}
	/**
	* �o�b�`�A�b�v�f�[�g
	*/
	synchronized public boolean doBatchUpdate(String[] query) {
		Statement stmts = null; //�X�e�[�g�����g
		Connection conn = null;
		ArrayList result = null;
		int[] updateCounts = null;
		boolean reFlag = false;
		try {
			boolean update_flg = true;
			conn = getConnection();
			stmts = conn.createStatement();
			for (int i = 0; i < query.length; i++) {
				stmts.addBatch(query[i]);
				System.err.println( query[i] );
			}
			updateCounts = stmts.executeBatch();
			for (int i = 0; i < updateCounts.length; i++) {
				System.err.println( updateCounts[i] );
				if (updateCounts[i] == Statement.EXECUTE_FAILED) {
					update_flg = false;
					rollback(conn);
					break;
				}
			}
			if (update_flg) {
				Commit(conn);
				reFlag = true;
			}
			stmts.close();
		} catch (BatchUpdateException bue) {
			bue.printStackTrace();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				close(conn);
			}
		}
		return reFlag;
	}
}

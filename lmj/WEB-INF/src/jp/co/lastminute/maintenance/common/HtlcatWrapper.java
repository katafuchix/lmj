package jp.co.lastminute.maintenance.common;

import java.util.*;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import org.apache.struts.action.Action;

import jp.co.yobrain.util.dbDataAccesser;
import jp.co.yobrain.util.jdbc.*;
import jp.co.lastminute.maintenance.util.ComboKey;
import jp.co.lastminute.maintenance.producthandle.CommandException;
import jp.co.lastminute.maintenance.producthandle.CommandConstants;

/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class HtlcatWrapper {
	private CommonDBOCache cache;
	private int refreshDuration = 1;
	private DataSource dataSource;
	private Map htlcat_nameMap = new HashMap();
	private List htlcatList = new ArrayList();
	private List combos = new ArrayList();
	private Vector htlcatMaps = null;
	/**
	 * �G�[�W�F���g�R�[�h���X�g�̎擾
	 */
	public List getHtlcatList( String producttype ) throws CommandException {
		getHtlcatMaps( producttype );
		return this.htlcatList;
	}
	public List getCombos( String producttype ) throws CommandException {
		getHtlcatMaps( producttype );
		return this.combos;
	}
	/**
	 * ���i��ʂ��Ƃ̃G�[�W�F���g�̎擾
	 */
	public Vector getHtlcatMaps( String producttype ) throws CommandException {
		return getHtlcatMaps(getDataSource(), producttype);
	}
	/**
	 * ���i��ʂ��Ƃ̃G�[�W�F���g�̎擾
	 */
	public Vector getHtlcatMaps(DataSource dataSource, String producttype ) throws CommandException {
		return getHtlcatMaps(dataSource, this.refreshDuration, producttype );
	}
	/**
	 * ���i��ʂ��Ƃ̃G�[�W�F���g�̎擾
	 */
	public Vector getHtlcatMaps(DataSource dataSource, int refreshDuration, String producttype )
		throws CommandException {
		makeHtlcatMaps(dataSource, refreshDuration, producttype );
		return this.htlcatMaps;
	}
	/**
	 * �G�[�W�F���g�l�[���̎擾
	 */
	public String getHtlcat_name(String htlcat) {
		return (String) this.htlcat_nameMap.get(htlcat);
	}
	/**
	 * �G�[�W�F���g�e�[�u���̐���
	 */
	private void makeHtlcatMaps(DataSource dataSource, int refreshDuration, String producttype )
		throws CommandException {
		this.htlcatMaps = null;
		this.htlcatMaps = getDBO( dataSource, producttype);
		setMany( this.htlcatMaps );
	}
	/**
	 * �`���C���h�e�[�u���̎擾
	 */
	private void setMany( List lists ){
		try{
			Vector vc = (Vector)lists;
			dbDataAccesser acceser = new dbDataAccesser( vc );
			this.htlcatList = new ArrayList();
			this.htlcat_nameMap = new HashMap();
			for (int i = 0; i < acceser.getRowsize(); i++) {
				this.htlcatList.add( acceser.getData( i, 0 ) );
				this.htlcat_nameMap.put(acceser.getData( i, 0 ), acceser.getData( i, 1 ));
				this.combos.add( new ComboKey(acceser.getData( i, 0 ), acceser.getData( i, 1 ) ) );
			}
		}catch(Exception ex){	ex.printStackTrace();	}
	}
	/**
	 * �G�[�W�F���g�e�[�u���̐���
	 */
	private Vector getDBO(DataSource dataSource, String producttype ){
		try{
			MapEntry maps = null;
			if ( (maps = cache.getDBO( "" + producttype + "" )) != null){
				return (Vector)maps.DBO;
			}else{
				String sql = "";
				sql = "SELECT HTLCAT, HTLCAR_NAME FROM HTLCAT_MASTER ORDER BY HTLCAT";
				
				System.err.println( sql );
				JdbcAdapter db = new JdbcAdapter();
				if( db.init( dataSource ) ){
					Vector rows = db.dbSelect( sql );
					if( rows.size() > 0 ){
						//�f�[�^�i�[
						cache.flush( "" + producttype + "" );
						maps = new MapEntry( System.currentTimeMillis(), rows );
						this.cache.setMapEntry( maps,  "" + producttype + "" );
						return rows;
					}
				}
			}
		}catch(Exception ex){	ex.printStackTrace();	}
		return null;
	}
	/**
	 * �n�b�V���}�b�v�̃N���A
	 */
	public void flush( String producttype ) {
		cache.flush( producttype );
	}
	/**
	 * �f�[�^�\�[�X�̎擾
	 */
	public DataSource getDataSource() {
		return this.dataSource;
	}
	/**
	 * �f�[�^�\�[�X�̃Z�b�g
	 */
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	/**
	 * �X�V�Ԋu�̎擾
	 */
	public int getRefreshDuration() {
		return refreshDuration;
	}
	/**
	 * ���t���b�V���^�C���̎擾
	 */
	public void setRefreshDuration(int refreshDuration) {
		this.refreshDuration = refreshDuration;
	}
	/**
	 * ������
	 */
	public HtlcatWrapper( CommonDBOCache cache, DataSource dataSource ){
		if( cache == null ){	
			setDataSource( dataSource );
			this.cache = new CommonDBOCache();
		}else{
			this.dataSource = dataSource;
			this.cache = cache;
		}
	}
	/**
	 * �L���b�V���̎擾
	 */
	public CommonDBOCache getCache(){
		return this.cache;
	}
}

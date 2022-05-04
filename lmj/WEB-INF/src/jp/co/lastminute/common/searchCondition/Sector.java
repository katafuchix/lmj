package jp.co.lastminute.common.searchCondition;

import java.io.*;
import java.util.*;

public class Sector implements Serializable {
    
    String flght_no;
    
    String dep_citycd_;
    
    String dep_cityname_;
    
    int dep_time_;
    
    String arv_citycd_;
    
    String arv_cityname_;
    
    int arr_time_;
    
    int sector_type_;
    
    String carear_;
    
    String cabinclass_;
    
    int adult_;
    
    int child_;
    
    int infant_;
    
    int status_;
    
    Sector(String flght_no, String dep_citycd, String dep_cityname, int dep_time, String arv_citycd, String arv_cityname, int arr_time, int sector_type, String carear_, String cabinclass_, int adult, int child, int infant, int status) {
        this.flght_no = flght_no;
        this.dep_citycd_ = dep_citycd;
        this.dep_cityname_ = dep_cityname;
        this.dep_time_ = dep_time;
        this.arv_citycd_ = arv_citycd;
        this.arv_cityname_ = arv_cityname;
        this.arr_time_ = arr_time;
        this.sector_type_ = sector_type;
        this.carear_ = carear_;
        this.cabinclass_ = cabinclass_;
        this.adult_ = adult;
        this.child_ = child;
        this.infant_= infant;
        this.status_ = status;
    }
    
    /** �v���p�e�B arr_time_ �̎擾���\�b�h�B
     * @return �v���p�e�B arr_time_ �̒l�B
     */
    public int getArr_time_() {
        return arr_time_;
    }
    
    /** �v���p�e�B arr_time_ �̐ݒ胁�\�b�h�B
     * @param arr_time_ �v���p�e�B arr_time_ �̐V�����l�B
     */
    public void setArr_time_(int arr_time_) {
        this.arr_time_ = arr_time_;
    }
    
    /** �v���p�e�B arv_citycd_ �̎擾���\�b�h�B
     * @return �v���p�e�B arv_citycd_ �̒l�B
     */
    public String getArv_citycd_() {
        return arv_citycd_;
    }
    
    /** �v���p�e�B dep_cityname_ �̎擾���\�b�h�B
     * @return �v���p�e�B dep_cityname_ �̒l�B
     */
    public String getArv_cityname_() {
        return arv_cityname_;
    }
    
    /** �v���p�e�B dep_cityname_ �̐ݒ胁�\�b�h�B
     * @param dep_cityname_ �v���p�e�B dep_cityname_ �̐V�����l�B
     */
    public void setArv_cityname_(String arv_cityname_) {
        this.arv_cityname_ = arv_cityname_;
    }
    
    /** �v���p�e�B arv_citycd_ �̐ݒ胁�\�b�h�B
     * @param arv_citycd_ �v���p�e�B arv_citycd_ �̐V�����l�B
     */
    public void setArv_citycd_(String arv_citycd_) {
        this.arv_citycd_ = arv_citycd_;
    }
    
    /** �v���p�e�B cabinclass_ �̎擾���\�b�h�B
     * @return �v���p�e�B cabinclass_ �̒l�B
     */
    public String getCabinclass_() {
        return cabinclass_;
    }
    
    /** �v���p�e�B cabinclass_ �̐ݒ胁�\�b�h�B
     * @param cabinclass_ �v���p�e�B cabinclass_ �̐V�����l�B
     */
    public void setCabinclass_(String cabinclass_) {
        this.cabinclass_ = cabinclass_;
    }
    
    /** �v���p�e�B dep_cityanme_ �̎擾���\�b�h�B
     * @return �v���p�e�B dep_cityanme_ �̒l�B
     */
    public String getDep_cityname_() {
        return dep_cityname_;
    }
    
    /** �v���p�e�B dep_cityanme_ �̐ݒ胁�\�b�h�B
     * @param dep_cityanme_ �v���p�e�B dep_cityanme_ �̐V�����l�B
     */
    public void setDep_cityname_(String dep_cityanme_) {
        this.dep_cityname_ = dep_cityname_;
    }
    
    /** �v���p�e�B dep_citycd_ �̎擾���\�b�h�B
     * @return �v���p�e�B dep_citycd_ �̒l�B
     */
    public String getDep_citycd_() {
        return dep_citycd_;
    }
    
    /** �v���p�e�B dep_citycd_ �̐ݒ胁�\�b�h�B
     * @param dep_citycd_ �v���p�e�B dep_citycd_ �̐V�����l�B
     */
    public void setDep_citycd_(String dep_citycd_) {
        this.dep_citycd_ = dep_citycd_;
    }
    
    /** �v���p�e�B dep_time_ �̎擾���\�b�h�B
     * @return �v���p�e�B dep_time_ �̒l�B
     */
    public int getDep_time_() {
        return dep_time_;
    }
    
    /** �v���p�e�B dep_time_ �̐ݒ胁�\�b�h�B
     * @param dep_time_ �v���p�e�B dep_time_ �̐V�����l�B
     */
    public void setDep_time_(int dep_time_) {
        this.dep_time_ = dep_time_;
    }
    
    /** �v���p�e�B sector_type_ �̎擾���\�b�h�B
     * @return �v���p�e�B sector_type_ �̒l�B
     */
    public int getSector_type_() {
        return sector_type_;
    }
    
    /** �v���p�e�B sector_type_ �̐ݒ胁�\�b�h�B
     * @param sector_type_ �v���p�e�B sector_type_ �̐V�����l�B
     */
    public void setSector_type_(int sector_type_) {
        this.sector_type_ = sector_type_;
    }
    
    /** �v���p�e�B adult_ �̎擾���\�b�h�B
     * @return �v���p�e�B adult_ �̒l�B
     */
    public int getAdult_() {
        return adult_;
    }
    
    /** �v���p�e�B adult_ �̐ݒ胁�\�b�h�B
     * @param adult_ �v���p�e�B adult_ �̐V�����l�B
     */
    public void setAdult_(int adult_) {
        this.adult_ = adult_;
    }
    
    /** �v���p�e�B child_ �̎擾���\�b�h�B
     * @return �v���p�e�B child_ �̒l�B
     */
    public int getChild_() {
        return child_;
    }
    
    /** �v���p�e�B child_ �̐ݒ胁�\�b�h�B
     * @param child_ �v���p�e�B child_ �̐V�����l�B
     */
    public void setChild_(int child_) {
        this.child_ = child_;
    }
    
    /** �v���p�e�B infant_ �̎擾���\�b�h�B
     * @return �v���p�e�B infant_ �̒l�B
     */
    public int getInfant_() {
        return infant_;
    }
    
    /** �v���p�e�B infant_ �̐ݒ胁�\�b�h�B
     * @param infant_ �v���p�e�B infant_ �̐V�����l�B
     */
    public void setInfant_(int infant_) {
        this.infant_ = infant_;
    }
    
    /** �v���p�e�B status_ �̎擾���\�b�h�B
     * @return �v���p�e�B status_ �̒l�B
     */
    public int getStatus_() {
        return status_;
    }
    
    /** �v���p�e�B status_�̐ݒ胁�\�b�h�B
     * @param status_ �v���p�e�B infant_ �̐V�����l�B
     */
    public void setStatus_(int status_) {
        this.status_ = status_;
    }
    
    /** �v���p�e�B infant_ �̎擾���\�b�h�B
     * @return �v���p�e�B infant_ �̒l�B
     */
    public String getCarear_() {
        return carear_;
    }
    
    /** �v���p�e�B infant_ �̐ݒ胁�\�b�h�B
     * @param infant_ �v���p�e�B infant_ �̐V�����l�B
     */
    public void setCarear_(String carear_) {
        this.carear_ = carear_;
    }
    
    /** �v���p�e�B flght_no �̎擾���\�b�h�B
     * @return �v���p�e�B flght_no �̒l�B
     */
    public String getFlght_no() {
        return flght_no;
    }
    
    /** �v���p�e�B flght_no �̐ݒ胁�\�b�h�B
     * @param flght_no �v���p�e�B flght_no �̐V�����l�B
     */
    public void setFlght_no(String flght_no) {
        this.flght_no = flght_no;
    }
    
}


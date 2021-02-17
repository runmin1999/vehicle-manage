package com.internship.ds.dao;

import com.internship.ds.model.Record;
import com.internship.ds.model.VericleInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface RecordDao {

    @Select("select vehicleId,vehicleNumber,departDate,backDate,level,event,username,name,status1 from tab_record,tab_vehicle where tab_record.vehicleId=tab_vehicle.id and tab_record.username = #{username} ")
    List<Record> uSearch(@Param("username") String username);

    @Insert("insert into tab_record(vehicleId, departDate, backDate, level, event, username, name) " +
            "values(#{r.vehicleId},#{r.departDate},#{r.backDate},#{r.level},#{r.event},#{r.username},#{r.name}) ")
    void uInsert(@Param("r") Record record);

    @Update("update tab_record set  realDepartDate = #{r.realDepartDate}, status1 = 1 where id = #{r.id} ")
    void aUpdate1(@Param("r") Record record);

    @Update("update tab_record set  realDepartDate = #{r.realDepartDate}, status1 = 2 where id = #{r.id} ")
    void aUpdate2(@Param("r") Record record);

    @Select("select tab_record.id,vehicleId,vehicleNumber,departDate,backDate,level,event,username,name,status1 from tab_record,tab_vehicle where tab_record.vehicleId=tab_vehicle.id and status1 = #{status1} ")
    List<Record> aSearch(@Param("status1") Integer status1);

    @Select("select tab_record.id,vehicleId,vehicleNumber,departDate,backDate,level,event,username,name,status1 from tab_record,tab_vehicle where tab_record.vehicleId=tab_vehicle.id ")
    List<Record> search();

    @Update("update tab_vehicle set status = 2 where id = #{id} ")
    void updateVehicle(@Param("id") String vehicleId);

    @Select("select status from tab_vehicle where id = #{vehicleId} ")
    int findStatus(@Param("vehicleId") String vehicleId);

    @Select("select name from tab_user where username = #{username} ")
    String findName(@Param("username") String username);

    @Select("select * from tab_record where status1 = 0 ")
    List<Record> aSearch0();
}

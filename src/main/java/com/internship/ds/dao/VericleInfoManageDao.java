package com.internship.ds.dao;

import com.internship.ds.model.VericleInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface VericleInfoManageDao {

    @Insert("insert into tab_vehicle (id,vehicleNumber,status,seats) values (#{car.id},#{car.vehicleNumber},#{car.status},#{car.seats})")
    void addCarInfo(@Param("car") VericleInfo car);

    @Update("update tab_vehicle set status = #{car.status}, seats = #{car.seats} where vehicleNumber = #{car.vehicleNumber}")
    void updateCarInfo(@Param("car") VericleInfo car);

    @Select("SELECT id,vehicleNumber,status,seats from tab_vehicle;")
    List<VericleInfo> findCarInfo();

    @Delete("delete from tab_vehicle where vehicleNumber = #{num}")
    void delCarInfo(@Param("num") String num);

    @Select("SELECT id,vehicleNumber,status,seats from tab_vehicle where status = 0;")
    List<VericleInfo> findCarInfo0();

    @Select("SELECT id,vehicleNumber,status,seats from tab_vehicle where status = 1;")
    List<VericleInfo> findCarInfo1();

    @Select("SELECT id,vehicleNumber,status,seats from tab_vehicle where status = 2;")
    List<VericleInfo> findCarInfo2();

    @Select("SELECT id,vehicleNumber,seats from tab_vehicle where status = 1;")
    List<VericleInfo> findCarInfo4();
}

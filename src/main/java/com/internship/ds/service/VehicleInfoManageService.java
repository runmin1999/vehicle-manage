package com.internship.ds.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.internship.ds.dao.VericleInfoManageDao;
import com.internship.ds.model.VericleInfo;
import lombok.val;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class VehicleInfoManageService {

    @Autowired
    private VericleInfoManageDao vericleInfoManageDao;

    public JSONObject addCarInfo(String req) {
        JSONObject p = Objects.requireNonNull(JSON.parseObject(req));
        JSONObject obj = Objects.requireNonNull(p.getJSONObject("car"));
        VericleInfo car = JSONObject.toJavaObject(obj, VericleInfo.class);
        vericleInfoManageDao.addCarInfo(car);
        return null;
    }

    public JSONObject updateCarInfo(String req) {
        JSONObject p = Objects.requireNonNull(JSON.parseObject(req));
        JSONObject obj = Objects.requireNonNull(p.getJSONObject("car"));
        VericleInfo car = JSONObject.toJavaObject(obj, VericleInfo.class);
        vericleInfoManageDao.updateCarInfo(car);
        return null;
    }

    public JSONObject delCarInfo(String req) {
        val p = JSON.parseObject(req);
        String carNum = p.getString("carNum");
        vericleInfoManageDao.delCarInfo(carNum);
        return null;
    }

    public JSONObject findCarInfo(String req) {
        List<VericleInfo> carInfo = vericleInfoManageDao.findCarInfo();
        return new JSONObject().fluentPut("errorCode", 0).fluentPut("error", null)
                .fluentPut("data", carInfo);
    }

    public JSONObject findCarInfo0(String req) {
        List<VericleInfo> carInfo0 = vericleInfoManageDao.findCarInfo0();
        return new JSONObject().fluentPut("errorCode", 0).fluentPut("error", null)
                .fluentPut("data", carInfo0);
    }

    public JSONObject findCarInfo1(String req) {
        List<VericleInfo> carInfo1 = vericleInfoManageDao.findCarInfo1();
        return new JSONObject().fluentPut("errorCode", 0).fluentPut("error", null)
                .fluentPut("data", carInfo1);
    }

    public JSONObject findCarInfo2(String req) {
        List<VericleInfo> carInfo2 = vericleInfoManageDao.findCarInfo2();
        return new JSONObject().fluentPut("errorCode", 0).fluentPut("error", null)
                .fluentPut("data", carInfo2);
    }

    public JSONObject findCarInfo4(String req) {
        List<VericleInfo> carInfo4 = vericleInfoManageDao.findCarInfo4();
        return new JSONObject().fluentPut("errorCode", 0).fluentPut("error", null)
                .fluentPut("data", carInfo4);
    }
}

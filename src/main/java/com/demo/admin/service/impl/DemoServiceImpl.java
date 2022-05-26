package com.demo.admin.service.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.RandomUtil;
import com.demo.admin.entity.Material;
import com.demo.admin.service.DemoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/******************************************
 * @createDate: 2022/5/25 0025 17:49
 * @since: JDK 1.8
 * @Description:
 * @Author: mhb
 ******************************************/
@Service
@Slf4j
public class DemoServiceImpl implements DemoService {

    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public List<Material> getMaterials() {
        return mongoTemplate.findAll(Material.class);
    }


    @Override
    public void saveOrUpdate(Material item) {
        //item.setId(Long.parseLong(getBatchNo()));
        mongoTemplate.save(item);
    }

    @Override
    public void delete(String id) {
        Query query = new Query(Criteria.where("id").is(id));
        Material m = mongoTemplate.findOne(query, Material.class);
        if (m != null) {
            mongoTemplate.remove(m);
        }
    }

    @Override
    public List<Map<String, Object>> view(String id) {
        Query query = new Query(Criteria.where("id").is(id));
        Material m = mongoTemplate.findOne(query, Material.class);
        if (m != null) {
            return m.getData();
        }

        return new ArrayList();
    }

    protected String getBatchNo() {
        return DateUtil.format(DateUtil.date(), "yyyyMMddHHmmss") + RandomUtil.randomNumbers(6);
    }

}

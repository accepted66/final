package com.demo.admin.service;

import com.demo.admin.entity.Material;

import java.util.List;
import java.util.Map;

/******************************************
 * @createDate: 2022/5/25 0025 17:49
 * @since: JDK 1.8
 * @Description:
 * @Author: mhb
 ******************************************/
public interface DemoService {

    List<Material> getMaterials();

    void saveOrUpdate(Material item);

    void delete(String id);

    List<Map<String, Object>> view(String id);
}

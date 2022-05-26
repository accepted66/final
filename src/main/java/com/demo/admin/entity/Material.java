package com.demo.admin.entity;

import lombok.Data;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;

import java.util.List;
import java.util.Map;

/******************************************
 * @createDate: 2022/5/25 0025 17:20
 * @since: JDK 1.8
 * @Description:
 * @Author: mhb
 ******************************************/
@Data
public class Material {

    @Id
    private ObjectId id;

    private String creator;

    private String company;

    private String mobile;

    private String email;

    private String checker;

    private String summary;

    private String fileName;

    private String filePath;

    private List<Map<String, Object>> data;

}

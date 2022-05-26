package com.demo.admin.bean.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/******************************************
 * @createDate: 2022/5/25 0025 10:55
 * @since: JDK 1.8
 * @Description:
 * @Author: mhb
 ******************************************/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginUserDto {

    private Long userId;

    private String userName;

}

package com.demo.admin.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import com.demo.admin.core.exception.BusinessException;
import com.demo.admin.core.exception.ErrorCode;
import com.demo.admin.core.web.BaseController;
import com.demo.admin.entity.Material;
import com.demo.admin.service.DemoService;
import lombok.extern.slf4j.Slf4j;
import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

/******************************************
 * @createDate: 2022/5/25 0025 16:47
 * @since: JDK 1.8
 * @Description:
 * @Author: mhb
 ******************************************/
@Controller
@Slf4j
@RequestMapping("demo")
public class DemoController extends BaseController {

    @Value("${project.upload.path}")
    private String projectUploadPath;

    @Autowired
    private DemoService demoService;

    @RequestMapping("/list")
    public String list(Model model) {
        model.addAttribute("list", demoService.getMaterials());
        model.addAttribute("controller", this);

        return "demo/list";
    }

    @RequestMapping("/edit")
    public String edit(@RequestParam(required = false) String id, Model model) {
        Material item = new Material();
        model.addAttribute("item", item);

        return "demo/edit";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam String id) {
        demoService.delete(id);

        return "redirect:/demo/list";
    }

    @RequestMapping("/view")
    public String view(@RequestParam String id, Model model) {
        List<Map<String, Object>> list = demoService.view(id);
        model.addAttribute("header", (CollUtil.isNotEmpty(list)?list.get(0).keySet(): new HashSet()));
        model.addAttribute("list", list);

        return "demo/view";
    }

    @RequestMapping("save_or_update")
    public String saveOrUpdate(@RequestParam("file") MultipartFile file, @Valid @ModelAttribute("item") Material item, BindingResult result) throws Exception {
        if (file.isEmpty()) {
            //result.rejectValue("creator", "", "上传资源文件不能为空");
            throw new BusinessException(ErrorCode.of("Error", "上传文件为空"));
        }
        if (!file.isEmpty()) {
            String suffix = StrUtil.subAfter(file.getOriginalFilename(), ".", true);
            if (!StrUtil.equalsIgnoreCase(suffix, "xlsx")) {
                throw new BusinessException(ErrorCode.of("Error", "上传文件必须xlsx"));
            }
            String relativePath = (projectUploadPath + getBatchNo() + "." + suffix);
            File tmpFile = new File(relativePath);
            FileUtils.forceMkdirParent(tmpFile);
            file.transferTo(tmpFile);
            ExcelReader reader = ExcelUtil.getReader(relativePath);
            item.setData(reader.readAll());
            item.setFileName(file.getOriginalFilename());
            item.setFilePath(relativePath);
        }
        demoService.saveOrUpdate(item);

        return "redirect:/demo/list";
    }

}

package com.ncu.web.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@RequestMapping("/file")
public class UploadFileController {

    @PostMapping("/images")
    public String singleFileUpload(@RequestParam("imgName") MultipartFile file, HttpSession httpSession) {
        if (file.isEmpty()) {
            return "请选择上传文件";
        }
        try {
            byte[] bytes = file.getBytes();
//            Path path = Paths.get("upload/images/" + file.getOriginalFilename());
//            Path path = Paths.get("upload/images/" + httpSession.getAttribute("username")+".jpg");
            Path path = Paths.get("src/main/webapp/images/" + httpSession.getAttribute("username")+".jpg");
            Files.write(path, bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/user_main";
    }
}



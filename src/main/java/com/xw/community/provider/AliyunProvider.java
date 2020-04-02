package com.xw.community.provider;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.net.URL;
import java.util.Date;
import java.util.UUID;

@Service
public class AliyunProvider {

    @Value("LTAI4FsPFh3JLANquriC6Kta")
    private String AccessKeyID;

    @Value("cK2qshlQClvzjD5ZQjmaiMTES3a2Xl")
    private String AccessKeySecret;

    @Value("thexwen")
    private String BucketName;

    @Value("http://oss-cn-zhangjiakou.aliyuncs.com")
    private String Endpoint;

    public URL upload(InputStream fileStream, String fileName){
        String generatedFileName = "";
        String[] filePaths = fileName.split("\\.");
        if (filePaths.length > 1){
            generatedFileName = UUID.randomUUID().toString() + "." + filePaths[filePaths.length - 1];
        }else {
            return null;
        }

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(Endpoint, AccessKeyID, AccessKeySecret);

        // 创建存储空间。
        ossClient.createBucket(BucketName);

        // 上传文件流。
        try {
            ossClient.putObject(BucketName, generatedFileName, fileStream);
            // 设置URL过期时间为1年。
            Date expiration = new Date(new Date().getTime() + 3600 * 1000 * 24 * 365);
            // 生成以GET方法访问的签名URL，访客可以直接通过浏览器访问相关内容。
            URL url = ossClient.generatePresignedUrl(BucketName, generatedFileName, expiration);
            // 关闭OSSClient。
            ossClient.shutdown();
            return url;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

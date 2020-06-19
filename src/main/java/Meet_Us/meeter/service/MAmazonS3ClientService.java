package Meet_Us.meeter.service;

import java.io.IOException;  

import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

public interface MAmazonS3ClientService
{
    void uploadFileToS3Bucket(MultipartFile multipartFile, boolean enablePublicReadAccess);

    void deleteFileFromS3Bucket(String fileName);
    
    ResponseEntity<byte[]> downloadFileFromS3Bucket(String key) throws IOException;
}
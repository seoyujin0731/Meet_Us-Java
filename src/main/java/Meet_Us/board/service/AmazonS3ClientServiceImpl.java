package Meet_Us.board.service;

import java.io.File;   
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;

@Component
public class AmazonS3ClientServiceImpl implements AmazonS3ClientService 
{
	
    private String awsS3AudioBucket;
    private AmazonS3 amazonS3;
    private static final Logger logger = LoggerFactory.getLogger(AmazonS3ClientServiceImpl.class);

    @Autowired
    public AmazonS3ClientServiceImpl(Region awsRegion, AWSCredentialsProvider awsCredentialsProvider, String awsS3AudioBucket) 
    {
        this.amazonS3 = AmazonS3ClientBuilder.standard()
                .withCredentials(awsCredentialsProvider)
                .withRegion(awsRegion.getName()).build();
        this.awsS3AudioBucket = awsS3AudioBucket;
    }

    //aws s3 에 파일 업로드
    //https://springbootdev.com/2018/08/02/upload-and-delete-files-with-amazon-s3-and-spring-boot/
    @Async
    public void uploadFileToS3Bucket(MultipartFile multipartFile, boolean enablePublicReadAccess) 
    {
        String fileName = multipartFile.getOriginalFilename();

        try {
            //creating the file in the server (temporarily)
            File file = new File(fileName);
            FileOutputStream fos = new FileOutputStream(file);
            fos.write(multipartFile.getBytes());
            fos.close();

            PutObjectRequest putObjectRequest = new PutObjectRequest(this.awsS3AudioBucket, fileName, file);

            if (enablePublicReadAccess) {
                putObjectRequest.withCannedAcl(CannedAccessControlList.PublicRead);
            }
            this.amazonS3.putObject(putObjectRequest);
            //removing the file created in the server
            file.delete();
        } catch (IOException | AmazonServiceException ex) {
            logger.error("error [" + ex.getMessage() + "] occurred while uploading [" + fileName + "] ");
        }
    }

    //aws s3 에서 파일 삭제
    @Async
    public void deleteFileFromS3Bucket(String fileName) 
    {
        try {
            amazonS3.deleteObject(new DeleteObjectRequest(awsS3AudioBucket, fileName));
        } catch (AmazonServiceException ex) {
            logger.error("error [" + ex.getMessage() + "] occurred while removing [" + fileName + "] ");
        }
    }

    //aws s3에서 파일 다운로드
    //https://enterkey.tistory.com/233
    @Async
    public ResponseEntity<byte[]> downloadFileFromS3Bucket(String key) throws IOException{
    	S3Object object = amazonS3.getObject(new GetObjectRequest("meet-us", key));
    	S3ObjectInputStream objectInputStream = object.getObjectContent();
    	byte[] bytes = IOUtils.toByteArray(objectInputStream);
    	
    	String fileName = URLEncoder.encode(key, "UTF-8").replaceAll("\\+", "%20");
    	
    	HttpHeaders httpHeaders = new HttpHeaders();
    	httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
    	httpHeaders.setContentLength(bytes.length);
    	httpHeaders.setContentDispositionFormData("attachment", fileName);
    	
    	return new ResponseEntity<>(bytes, httpHeaders, HttpStatus.OK);
    }
}

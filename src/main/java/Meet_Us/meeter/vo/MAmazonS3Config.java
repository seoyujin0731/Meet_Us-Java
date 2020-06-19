package Meet_Us.meeter.vo;

import org.springframework.beans.factory.annotation.Value;  
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.amazonaws.auth.AWSCredentialsProvider;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;

@Configuration
public class MAmazonS3Config 
{
    @Value("AKIA6DP223UEYZRFRQ6N")
    private String awsKeyId;

    @Value("oyxdpC3JX2slDgchCKRgOJA4YRO5EzsubMGb/kqc")
    private String awsKeySecret;

    @Value("ap-northeast-2")
    private String awsRegion;

    @Value("meet-us/MeetingImage")
    private String awsS3AudioBucket;

    @Bean(name = "awsKeyId")
    public String getAWSKeyId() {
        return awsKeyId;
    }

    @Bean(name = "awsKeySecret")
    public String getAWSKeySecret() {
        return awsKeySecret;
    }

    @Bean(name = "awsRegion")
    public Region getAWSPollyRegion() {
        return Region.getRegion(Regions.fromName(awsRegion));
    }

    @Bean(name = "awsCredentialsProvider")
    public AWSCredentialsProvider getAWSCredentials() {
        BasicAWSCredentials awsCredentials = new BasicAWSCredentials(this.awsKeyId, this.awsKeySecret);
        return new AWSStaticCredentialsProvider(awsCredentials);
    }

    @Bean(name = "awsS3AudioBucket")
    public String getAWSS3AudioBucket() {
        return awsS3AudioBucket; 
    }
}

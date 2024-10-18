
package mandoo.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import kr.co.mandoo.filter.SessionCheckFilter;

@Configuration
public class WebConfig {

    @Bean
    public FilterRegistrationBean<SessionCheckFilter> sessionCheckFilter() {
        FilterRegistrationBean<SessionCheckFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new SessionCheckFilter());
        registrationBean.addUrlPatterns("/*"); // 모든 요청에 대해 필터 적용
        registrationBean.setOrder(1); // 필터 체인 순서 설정 (1이 가장 우선)
        return registrationBean;
    }
}

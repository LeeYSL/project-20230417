package sitemesh;

import javax.servlet.annotation.WebFilter;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

//sitemesh 기능:화면에 layout을 코딩한 jsp를 페이지에 적용  

@WebFilter("/*")
public class SiteMeshFilter extends ConfigurableSiteMeshFilter {
	@Override
	protected void applyCustomConfiguration (SiteMeshFilterBuilder builder) {
		builder.addDecoratorPath("/view/*","/layout/backup2.jsp");
		

	//	builder.addDecoratorPath("/member/*", "/layout/kiclayout.jsp");
		
	}

}
 
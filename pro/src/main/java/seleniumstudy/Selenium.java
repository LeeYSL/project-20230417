package seleniumstudy;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

/*
 * daum 사이트에서 사진 받기
 */
public class Selenium {

	public static void main(String[] args) throws Exception {
		System.setProperty
		("webdriver.chrome.driver", "D:/setup/chromedriver_win32/chromedriver.exe");
		WebDriver driver = new ChromeDriver();
		String url = 
				"https://www.kovomarket.co.kr/goods/goods_list.php?cateCd=013";
		driver.get(url); //셀레늄에서 사진 띄우기
		Thread.sleep(1000); //1초 쉬기
		//findElements : 태그들 찾는다 (리턴타입 List)
		//images  : img 태그 목록
		//"div.wrap_thumb a > img" : div 태그 의 a 태그 바로 밑에 있는 img 태그 가져와
		List<WebElement> images = driver.findElements
				(By.cssSelector("div.item_gallery_type a > img"));
		//imgulr ArrayList 만든다
		List<String> imgurl = new ArrayList<>(); //이미지 링크 저장
		for(WebElement img : images) {
			//img 태그의 src 속성의 값을 가져와
			//src : 이미지의 위치값
			String src = img.getAttribute("src");
			System.out.println(src);
			
			//이미지의 경로가 절대경로인 이미지만 src에 넣는다
			if(src.startsWith("https")) {
				imgurl.add(src);
				System.out.println(src);
			}
		}
		File f = new File("goods"); //img 파일 생성
		if(!f.exists()) f.mkdirs();//f가 존재하지 않을 때 img 폴더 생성
		//mkdirs는 폴더 생성 함수임
		
		for(int i=1;i<imgurl.size();i++) {
			//URL : 네트워크 관련 클래스.
			//imgurl.get(i) : 이미지의 절대 경로 저장
			//Connection함
			//getInputStream : 외부꺼 읽어주겠다.
			//is : 네트워크상의 이미지 파일을 읽기 위한 입력 스트림
			InputStream is = 
					new URL(imgurl.get(i)).openConnection().getInputStream();
			//fos : 이미지 저장할 파일 이름설정
			FileOutputStream fos = new FileOutputStream("goods/"+i+".jpg");
			//8K 버퍼 만든다.
			byte[] buf = new byte[8096];
			int len = 0;
			//한번에 8K씩 읽는다
			//읽어서 파일에 저장해
			while((len=is.read(buf)) != -1) {
				fos.write(buf,0,len);
			}
			//url읽은거 닫기
			is.close();
			//저장한 파일 닫기
			fos.close();
			Thread.sleep(100);	
		}
		driver.close();
	}

}
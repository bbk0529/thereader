package net.bkpark.tone;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ToneAnalyserController {
	
	@RequestMapping("watson")
	public void watson() {
		System.out.println("aaa");
		
	}
	
}

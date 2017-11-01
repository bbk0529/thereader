package net.bkpark.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.watson.developer_cloud.personality_insights.v3.PersonalityInsights;
import com.ibm.watson.developer_cloud.personality_insights.v3.model.Profile;
import com.ibm.watson.developer_cloud.personality_insights.v3.model.ProfileOptions;
import com.ibm.watson.developer_cloud.personality_insights.v3.model.Trait;

@Controller
public class WatsonController {
	private static final Logger logger = LoggerFactory.getLogger(WatsonController.class);
	
	@RequestMapping("callWatson")
	@ResponseBody
	public List<Trait> callWatson(String text) {	
		System.out.println("text : " + text);
		PersonalityInsights service = new PersonalityInsights("2016-10-19");
		service.setUsernameAndPassword("2f162f68-251f-47ba-af6f-8d0c50373425", "vWjm7tOnp6Au");
		ProfileOptions options = new ProfileOptions.Builder().text(text).build();
		Profile profile = service.getProfile(options).execute();
		List<Trait> list = new ArrayList<Trait>();
		for(Trait personality : profile.getPersonality())
		{
			System.out.println("-----------getpersonality -----------");
			System.out.println(personality);
			list.add(personality);			
				for (Trait a : personality.getChildren()) {
					System.out.println("-----------getchildren -----------");
					System.out.println(a);
					list.add(a);									
				}
		}
		
		/*return profile.getPersonality();*/
		return list;
	}
	
}

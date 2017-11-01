package net.bkpark.controller;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.InsertProvider;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.watson.developer_cloud.personality_insights.v3.PersonalityInsights;
import com.ibm.watson.developer_cloud.personality_insights.v3.model.Profile;
import com.ibm.watson.developer_cloud.personality_insights.v3.model.ProfileOptions;
import com.ibm.watson.developer_cloud.personality_insights.v3.model.Trait;

import net.bkpark.tone.NLPService;
import net.bkpark.tone.PIVO;

@Controller
public class WatsonController {
	private static final Logger logger = LoggerFactory.getLogger(WatsonController.class);

	@Autowired
	private DBController dbController;
	
	@Value("${pi.username}")
	private String username;

	@Value("${pi.password}")
	private String password;

	@RequestMapping("callWatson")
	@ResponseBody
	public List<Trait> callWatson(String sender, String date, String text) throws Exception {
		
		System.out.println("text : " + text);
		PersonalityInsights service = new PersonalityInsights("2016-10-19");
		service.setUsernameAndPassword(username, password);
		ProfileOptions options = new ProfileOptions.Builder().text(text).build();
		Profile profile = service.getProfile(options).execute();
		List<Trait> list = new ArrayList<Trait>();
		for (Trait personality : profile.getPersonality()) {
			System.out.println("-----------getpersonality -----------");
			System.out.println(personality);
			list.add(personality);
			for (Trait a : personality.getChildren()) {
				System.out.println("-----------getchildren -----------");
				System.out.println(a);
				list.add(a);
			}
		}

				
		double[] percentile = new double[list.size()];
		int i = 0;
		
		for (Trait a : list) {
			System.out.println("==============================================");
			System.out.println(a);
			percentile[i] = a.getPercentile();
			i++;
		}
		Date fdate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
		PIVO vo = new PIVO();
		vo.setUpAll(sender, fdate, percentile);
		System.out.println(vo.toString());
		dbController.insertPI(vo);
		
		return list;
	}

}

package net.bkpark.tone;

import java.io.FileNotFoundException;
import java.io.FileReader;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;
import com.ibm.watson.developer_cloud.tone_analyzer.v3.ToneAnalyzer;
import com.ibm.watson.developer_cloud.tone_analyzer.v3.model.Tone;
import com.ibm.watson.developer_cloud.tone_analyzer.v3.model.ToneAnalysis;
import com.ibm.watson.developer_cloud.tone_analyzer.v3.model.ToneOptions;

public class ToneAnalyserTest {

	
	public static void main(String[] args) {
		
		final String VERSION_DATE = "2016-05-19";
		String filename="c:/dev/workspace/thereader/src/main/webapp/resources/json/tone.json";
		ToneAnalyzer service = new ToneAnalyzer(VERSION_DATE);
		service.setUsernameAndPassword("7b50d7bc-8f4e-4c7d-8b4a-3f92224d0206", "vfIiOxqX1737");
		
		try {
			  JsonReader jReader = new JsonReader(new FileReader(filename));
			  JsonParser jParser = new JsonParser();
			  JsonObject jObject = (JsonObject) jParser.parse(jReader);
			  ToneOptions options = new ToneOptions.Builder()
			    .addTone(Tone.EMOTION).build();
			  ToneAnalysis tone =
			    service.getTone(jObject.get("text").getAsString(), options).execute();
			  System.out.println(tone);
			} catch (FileNotFoundException e) {
			  e.printStackTrace();
			}
	}
}

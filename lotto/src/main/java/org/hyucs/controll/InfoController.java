package org.hyucs.controll;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.hyucs.util.NaverOpenAPI;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/info/*")
public class InfoController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	@RequestMapping(value="store", method=RequestMethod.GET)
	public void storeGET() {
		
	}
	
	@ResponseBody
	@RequestMapping(value="storeloc", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> storeLocationGET() throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;

	    String text = URLEncoder.encode("로또판매점", "UTF-8");
	    String apiURL = "https://openapi.naver.com/v1/search/local.json?query="+ text + "&display=100";
	    String strResult = NaverOpenAPI.searchLOC(apiURL);
	    
	    logger.info(strResult);
	    
	    JSONParser parser = new JSONParser();
		JSONObject object = (JSONObject) parser.parse(strResult);
		JSONArray items = (JSONArray) object.get("items");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", items);
		
		entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
        
		return entity;
	}
	
}

package org.hyucs.controll;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.hyucs.domain.Criteria;
import org.hyucs.domain.PageMaker;
import org.hyucs.util.NaverOpenAPI;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value="store", method=RequestMethod.GET)
	public void storeGET() {
		
	}
	
	@ResponseBody
	@RequestMapping(value="storelist/{page}/{keyword}/{display}", method=RequestMethod.GET, produces="application/JSON;charset=UTF-8")
	public ResponseEntity<Map<String, Object>> storeListGET(@PathVariable("page") String page, @PathVariable("keyword") String keyword, @PathVariable("display") String display) throws Exception {
		Criteria cri = new Criteria();
		cri.setPage(Integer.parseInt(page));
		Integer start = cri.getPageStart() + 1;
		String text = URLEncoder.encode(keyword, "UTF-8");
		String apiURL = "https://openapi.naver.com/v1/search/local.json?query=" + text + "&start=" + start + "&display=" + display;
		String strResult = NaverOpenAPI.searchLOC(apiURL);
		
		JSONParser parser = new JSONParser();
		JSONObject object = (JSONObject) parser.parse(strResult);
		JSONArray items = (JSONArray) object.get("items");
		String total = object.get("total").toString();
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", items);
		paramMap.put("total", total);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(Integer.parseInt(total));
		
		paramMap.put("pageMaker", pageMaker);
		
		return new ResponseEntity<Map<String,Object>>(paramMap, HttpStatus.OK);
	}

}

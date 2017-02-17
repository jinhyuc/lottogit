package org.hyucs.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class NaverOpenAPI {
	public static String searchLOC(String apiURL) {
		String strResult = "";
		String clientId = "75__rspjVqxq7JGdSZd8";
	    String clientSecret = "sio8nHdY7w";
	    
	    try {
	    	URL url = new URL(apiURL);
		    HttpURLConnection con = (HttpURLConnection)url.openConnection();
		    con.setRequestMethod("GET");
		    con.setRequestProperty("X-Naver-Client-Id", clientId);
		    con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		    int responseCode = con.getResponseCode();
		    BufferedReader br;
		    if(responseCode==200) {
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		    } else {
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		    }
		    String inputLine;
		    StringBuffer response = new StringBuffer();
		    while ((inputLine = br.readLine()) != null) {
		        response.append(inputLine);
		    }
		    br.close();
		    System.out.println(response.toString());
		    strResult = response.toString();
	    } catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return strResult;
	    
	}
	

}

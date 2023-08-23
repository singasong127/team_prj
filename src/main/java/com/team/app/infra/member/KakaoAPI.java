package com.team.app.infra.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoAPI {
	 
	public String getAccessToken(String authorize_code) {
       String access_Token="";
       String refresh_Token = "";
       String reqURL = "https://kauth.kakao.com/oauth/token";
       
       try {
    	   URL url = new URL(reqURL);
    	   HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    	   
    	   conn.setRequestMethod("POST");
    	   conn.setDoOutput(true);
    	   
    	   BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
           StringBuilder sb = new StringBuilder();
           sb.append("grant_type=authorization_code");
           sb.append("&client_id=97d39d6e91ff9fdedf425d2586080d4e");
           sb.append("&redirect_uri=http://localhost");
           sb.append("&code=" + authorize_code);
           bw.write(sb.toString());
           bw.flush();
           
           int responseCode = conn.getResponseCode();
           System.out.println("responseCode : " + responseCode);
           
           BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
           String line = "";
           String result = "";
           
           while ((line = br.readLine()) != null) {
               result += line;
           }
           System.out.println("response body : " + result);
           
           JsonParser parser = new JsonParser();
           JsonElement element = parser.parse(result);

           access_Token = element.getAsJsonObject().get("access_token").getAsString();
           refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

           System.out.println("access_token : " + access_Token);
           System.out.println("refresh_token : " + refresh_Token);

           br.close();
           bw.close();
           
       }catch (Exception e) {
		e.printStackTrace();
	}
		
		return access_Token;
	}
	
	 public HashMap<String, Object> getUserInfo (String access_Token) {

	        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	        HashMap<String, Object> userInfo = new HashMap<>();
	        String reqURL = "https://kapi.kakao.com/v2/user/me";
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("POST");

	            //    요청에 필요한 Header에 포함될 내용
	            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	            String email = kakao_account.getAsJsonObject().get("email").getAsString();

	            userInfo.put("nickname", nickname);
	            userInfo.put("email", email);

	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        return userInfo;
	    }
	 
	  public void kakaoLogout(String access_Token) {
	        String reqURL = "https://kapi.kakao.com/v1/user/logout";
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("POST");
	            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String result = "";
	            String line = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println(result);
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	    }
}

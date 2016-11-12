package com.pzy.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.pzy.entity.Question;
import com.pzy.repository.QuestionRepository;

@Service
public class WordService {
	@Autowired
	private QuestionRepository questionRepository;
	public Question getQuestion(){
		List<Question> list = (List<Question>) questionRepository.findAll();
		Collections.shuffle(list);
		return list.get(0);
	}
	public Question getQuestion(Long id){
		return  questionRepository.findOne(id);
	}
	public List<String> translate(String word){
		List<String> list = new ArrayList<String>();
		try {
			JsonParser parser = new JsonParser();
			CloseableHttpClient httpclient = HttpClients.createDefault();
			HttpGet Httpget = new HttpGet(
					"http://fanyi.youdao.com/openapi.do?keyfrom=A11231t233&key=121682451&type=data&doctype=json&version=1.1&q="
							+  word);
			CloseableHttpResponse response;
			String resData = "";
			;
			response = httpclient.execute(Httpget);
			resData = EntityUtils.toString(response.getEntity());
			System.out.println(resData);
			list = new Gson().fromJson(
					parser.parse(resData).getAsJsonObject().getAsJsonObject("basic").getAsJsonArray("explains"),
					new TypeToken<List<String>>() {
					}.getType());
		} catch (Exception e) {
		}
		return list;
	}
	
	public static void main(String arg[]) throws ParseException, IOException{
		new WordService().translate("fuck");
		
	}
}

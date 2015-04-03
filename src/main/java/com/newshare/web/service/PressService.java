package com.newshare.web.service;

import java.io.IOException;
import java.util.ArrayList;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class PressService {
	public ArrayList pressView (String pressNum, int date, int page) throws IOException{
		String url = "http://news.naver.com/main/list.nhn?oid=" + pressNum + "&mid=sec&mode=LPOD&date=" + date + "&page=" + page;
		ArrayList list = new ArrayList();
		list = pressContents(url);
		return list;
	}
	
	public ArrayList pressView (String pressNum, int date) throws IOException{
		String url = "http://news.naver.com/main/list.nhn?oid=" + pressNum + "&mid=sec&mode=LPOD&date=" + date;
		ArrayList list = new ArrayList();
		list = pressContents(url);
		return list;
	}
	
	public ArrayList pressContents (String url) throws IOException{
		Element temp1 = null;
		Document doc = Jsoup.connect(url).get();
		Elements art1 = doc.getElementsByClass("type06_headline");
		Elements art2 = doc.getElementsByClass("type06");
		Elements paging = doc.getElementsByClass("paging");
		Elements recDays = doc.getElementsByClass("pagenavi_day");
		
		ArrayList list = new ArrayList();
		JSONArray articles = new JSONArray();
		
		//pressName
		String pressName = doc.getElementsByTag("h3").get(3).text();
		
		//articles
		articles = pressArticles(art1, articles);
		articles = pressArticles(art2, articles);
		
		//pages
		String paging1 = paging.toString().replace("?oid=", "pressView.do?pressNum=");
		paging1 = paging1.replace("amp;mid=sec&amp;mode=LPOD&amp;date", "date");
		paging1 = paging1.replace("&amp;", "&");
		
		//recent 5 days
		String recDays1 = recDays.toString().replace("?oid=", "pressView2.do?pressNum=");
		recDays1 = recDays1.replace("amp;mid=sec&amp;mode=LPOD&amp;date", "date");
		
		list.add(pressName);
		list.add(articles);
		list.add(paging1);
		list.add(recDays1);
		
		return list;
	}

	public JSONArray pressArticles (Elements art, JSONArray articles){
		Element temp1 = null;
		//articles
		for(int i = 0; i < art.select("li").size(); i++){
			JSONObject obj = new JSONObject();
			String image = "";
			temp1 = art.get(0).child(i);
			obj.put("articleUrl", temp1.getElementsByTag("a").get(0).attr("href"));
			obj.put("title", temp1.getElementsByTag("dd").get(0).previousElementSibling().text());
			obj.put("description", temp1.getElementsByTag("dd").get(0).ownText());
			if(temp1.getElementsByTag("dt").get(0).hasClass("photo")){
				image = temp1.getElementsByClass("photo").get(0).getElementsByTag("img").get(0).attr("src");
			}
			obj.put("image", image);
			obj.put("writingDate", temp1.getElementsByClass("date").get(0).text());
			obj.put("press", temp1.getElementsByClass("writing").get(0).text());
			articles.add(obj);
		}
		return articles;
	}
}

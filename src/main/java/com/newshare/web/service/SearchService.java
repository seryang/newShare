package com.newshare.web.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.newshare.web.model.dao.PapersDAOImpl;
import com.newshare.web.model.vo.PapersVO;

public class SearchService {
	@Resource(name="paDao")
	private PapersDAOImpl papersDao;
	
	public void setPapersDao(PapersDAOImpl papersDao){
		this.papersDao = papersDao;
	}
	
	public JSONArray naverOpenAPI(String key){
		System.out.println("- \""+key+"\"으로 검색한 결과입니다. -");
		String apiKey = "5e263766c1cf05d4d1c946c47903d74b";
		String uri = null;
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		JSONArray arr = null;
		JSONObject obj = null;

		try{
			uri = "http://openapi.naver.com/search?key=" + apiKey + "&target="+ "news" +"&query=" + 
					URLEncoder.encode(key, "UTF-8") + "&display="+ 100 + "&sort=" + "sim";
		}catch(UnsupportedEncodingException e){
			System.out.println(e);
		}
		
		try
		{
			DocumentBuilder builder = dbf.newDocumentBuilder();
			Document doc = builder.parse(uri);
			Element root = doc.getDocumentElement();
			NodeList list = root.getElementsByTagName("item");
			arr = new JSONArray();
			obj = new JSONObject();
			
			for(int i=0; i<list.getLength();i++){
				Element element = (Element)list.item(i);
				obj.put("title", getContent(element, "title", key));
				obj.put("description", getContent(element, "description", key));
				obj.put("link", getContent(element, "link"));
				obj.put("pubDate", getContent(element, "pubDate"));
				arr.add(obj);
			}
		 }
		catch (ParserConfigurationException e){ e.printStackTrace(); }
		catch (SAXException e){ e.printStackTrace(); }
		catch (IOException e){ e.printStackTrace(); }
		
		return arr;
	}

	public static String getContent(Element element, String tagName)
	{
		NodeList list = element.getElementsByTagName(tagName);
		Element cElement = (Element)list.item(0);

		if(cElement.getFirstChild()!=null){
			String str = cElement.getFirstChild().getNodeValue();
			str = str.replaceAll("&quot;", "\"");
			str = str.replaceAll("<b>", "");
			str = str.replaceAll("</b>","");
			return str;
		}else{
			return "";
		}
	}
	
	// 키워드 진하게 설정
	public static String getContent(Element element, String tagName, String key)
	{
		NodeList list = element.getElementsByTagName(tagName);
		Element cElement = (Element)list.item(0);

		if(cElement.getFirstChild()!=null){
			String str = cElement.getFirstChild().getNodeValue();
			str = str.replaceAll("&quot;", "\"");
			str = str.replaceAll("<b>", "");
			str = str.replaceAll("</b>","");
			str = str.replaceAll(key,"<b>" + key + "</b>");
			return str;
		}else{
			return "";
		}
	}
	
	/*
	 * 신문 검색하기
	 */
	public ArrayList<PapersVO> paperSearch(String keyword) throws SQLException{
		return (ArrayList<PapersVO>)papersDao.paperSearch(keyword);
	}
}

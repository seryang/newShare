package com.newshare.web.service;

import java.io.IOException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class PortalService {
	public JSONArray portalCrawling(String portal) throws IOException {
		String articleUrl = null;
		String title = null;
		String press = null;
		Element temp1 = null;
		Elements temp2 = null;
		Elements temp3 = null;
		JSONObject obj = new JSONObject();
		JSONArray arr = new JSONArray();
		String[] naverSection = new String[] {"nclicks(pol.text)", "nclicks(eco.text)",
				"nclicks(soc.text)", "nclicks(lif.text)", "nclicks(wor.text)", "nclicks(sci.text)", "nclicks(ent.text)", "nclicks(spo.text)"};

		Document doc = Jsoup.connect(portal).get();

		if (portal.equals("http://news.naver.com/")) {
			for (String s : naverSection) {
				for (int i = 0; i < 5; i++) {
					temp3 = doc.getElementsByClass(s);
					temp1 = temp3.get(i);
					temp2 = temp1.getElementsByTag("a");
					temp1 = temp2.get(0);
					articleUrl = temp1.attr("href");
					temp2 = temp3.get(i).parents();
					temp1 = temp2.get(0);
					title = temp1.getElementsByTag("strong").get(0).text();
					press = temp1.getElementsByTag("span").text();

					obj.put("articleUrl", articleUrl);
					obj.put("title", title);
					obj.put("press", press);
					arr.add(obj);

					if (i == 3 && (s.equals("nclicks(ent.text)") || s.equals("nclicks(spo.text)"))) {
						i++;
					}
				}
				obj.clear();
			}
		} else if (portal.equals("http://media.daum.net/")) {
			temp3 = doc.getElementsByClass("tit_headline");
			temp1 = temp3.get(0);
			temp2 = temp1.getElementsByTag("a");
			title = temp2.get(0).text();
			temp2 = temp2.parents();
			temp2 = temp2.parents();
			temp1 = temp2.get(0);
			temp2 = temp1.getElementsByTag("span");
			temp1 = temp2.get(0);
			press = temp1.text();

			obj.put("title", title);
			obj.put("press", press);
			arr.add(obj);
			temp3 = doc.getElementsByClass("list_sub");
			for (int i = 0; i < 10; i++) {
				obj.clear();
				temp1 = temp3.get(0);
				temp2 = temp1.getElementsByTag("li");
				temp1 = temp2.get(i);
				temp2 = temp1.getElementsByTag("strong");
				temp1 = temp2.get(0);
				title = temp1.text();
				temp2 = temp2.parents();
				temp1 = temp2.get(0);
				temp2 = temp1.getElementsByTag("span");
				temp1 = temp2.get(0);
				press = temp1.text();

				obj.put("title", title);
				obj.put("press", press);
				arr.add(obj);
			}
			for (int i = 0; i < 2; i++) {
				temp3 = doc.getElementsByClass("wrap_thumb");
				for (int j = 0; j < 5 ; j++) {
					obj.clear();
					temp1 = temp3.get(i);
					temp2 = temp1.parents();
					temp1 = temp2.get(0);
					temp2 = temp2.parents();
					temp1 = temp2.get(0);
					temp2 = temp1.getElementsByTag("li");
					temp1 = temp2.get(j);
					temp2 = temp1.getElementsByTag("a");
					temp1 = temp2.get(0);
					title = temp1.text();
					temp2 = temp2.parents();
					temp1 = temp2.get(0);
					temp2 = temp1.getElementsByTag("span");
					temp1 = temp2.get(0);
					press = temp1.text();

					obj.put("title", title);
					obj.put("press", press);
					arr.add(obj);
				}
			}
		} else if (portal.equals("http://news.nate.com/")) {
			temp3 = doc.getElementsByClass("mainContents");
			temp1 = temp3.get(0);
			temp2 = temp1.getElementsByTag("strong");
			title = temp2.get(0).text();

			obj.put("title", title);
			obj.put("press", press);
			arr.add(obj);
			temp3 = doc.getElementsByClass("mduStrongList");
			for (int i = 1; i < 3; i++) {
				for (int j = 0; j < 5; j++) {
					obj.clear();
					temp1 = temp3.get(i);
					temp2 = temp1.getElementsByTag("li");
					temp1 = temp2.get(j);
					temp2 = temp1.getElementsByTag("a");
					temp1 = temp2.get(0);
					title = temp1.text();

					obj.put("title", title);
					arr.add(obj);
				}
			}
		}

		return arr;
	}
}

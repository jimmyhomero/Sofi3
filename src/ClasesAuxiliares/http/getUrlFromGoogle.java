/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares.http;

/**
 *
 * @author USUARIO
 */
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class getUrlFromGoogle {

    
    public static final String GOOGLE_SEARCH_URL = "https://www.google.com/search";

    public static void main(String[] args) throws IOException, ParseException {
        
        getUrlFromGoogle.getImagesFromGoogle("casa");
    //    getImagesFromGoogle();
        //Taking search term input from console
//		Scanner scanner = new Scanner(System.in);
//		System.out.println("Please enter the search term.");
//		String searchTerm = scanner.nextLine();
//		System.out.println("Please enter the number of results. Example: 5 10 20");
//		int num = scanner.nextInt();
//		scanner.close();
//               Integer num=20;
//		String searchTerm= "impresora l380 .jpg";
//		String searchURL = GOOGLE_SEARCH_URL + "?q="+searchTerm+"&num="+num;
//		//without proper User-Agent, we will get 403 error
//		Document doc = Jsoup.connect(searchURL).userAgent("Mozilla/5.0").get();
//		
//		//below will print HTML data, save it to a file and open in browser to compare
//		//System.out.println(doc.html());
//		
//		//If google search results HTML change the <h3 class="r" to <h3 class="r1"
//		//we need to change below accordingly
//		Elements results = doc.select("h3.r > a");
//
//		for (Element result : results) {
//			String linkHref = result.attr("href");
//			String linkText = result.text();
//                       // String a= result.
//			//System.out.println("Text::" + linkText + ", URL::" + linkHref.substring(6, linkHref.indexOf("&")));
//                        System.out.println("Text::" + linkText + ", URL::" + linkHref);
//		}
    }
public static String getimages(String url,String busqueda) {

        String s1 = "[\"https://";
        String s2 = ".jpg";
        Integer x1 = url.indexOf(s1);
        Integer x2 = url.indexOf(s2);
        if (x1 == -1 || x2 == -1) {
            return "xxx";
        } else {
               String imgs=url.substring(x1 , x2+s2.length());
            
            return imgs;
        }
        
        

    }
    
    public static List<String> getImagesFromGoogle(String busqueda) {
        String userAgent = "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36";

      //  Integer num = 20;
       // String searchTerm = "impresora l380";
        //url = GOOGLE_SEARCH_URL + "?q="+searchTerm+"&num="+num;
        String url = "https://www.google.com/search?site=imghp&tbm=isch&source=hp&q=" + busqueda + "&gws_rd=cr";
        List<String> resultUrls = new ArrayList<String>();

        try {
            Document doc = Jsoup.connect(url).userAgent(userAgent).referrer("https://www.google.com/").get();
          // System.err.println("dddd: "+doc.toString());
            String page =doc.toString();
            getimages(page,busqueda);
            
            Elements elements = doc.select("div.rg_meta");
            
            JSONObject jsonObject;
            for (Element element : elements) {
                if (element.childNodeSize() > 0) {
                    jsonObject = (JSONObject) new JSONParser().parse(element.childNode(0).toString());
                    resultUrls.add((String) jsonObject.get("ou"));

                }
            }

            System.out.println("number of results: " + resultUrls.size());

            for (String imageUrl : resultUrls) {

                System.out.println(imageUrl);
            }

        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }
        return resultUrls;
    }
}

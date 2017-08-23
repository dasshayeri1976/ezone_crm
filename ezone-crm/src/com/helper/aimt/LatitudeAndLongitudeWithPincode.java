package com.helper.aimt;

import java.net.URLConnection;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;
import javax.xml.xpath.XPathConstants;
import org.w3c.dom.Document;
import java.text.DecimalFormat;
/**
 * This class will get the lat long values.
 */
public class LatitudeAndLongitudeWithPincode
{
  /*public static void main(String[] args) throws Exception
  {
      System.setProperty("java.net.useSystemProxies", "true");
      //BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
      //System.out.println("Please enter a location:");
      //String postcode=reader.readLine();
      String postcode="700143";
      String latLongs[] = getLatLongPositions(postcode);
      System.out.println("Latitude: "+latLongs[0]+" and Longitude: "+latLongs[1]);
      LatitudeAndLongitudeWithPincode lp=new LatitudeAndLongitudeWithPincode();
      DecimalFormat plain = new DecimalFormat("0.00");
      System.out.println(plain.format(lp.distance(22.4733565, 88.2509857, Double.parseDouble(latLongs[0]), Double.parseDouble(latLongs[1]), "K")));
      
      }*/
  public String Totaldistance(String x)throws Exception
  {
    String postcode=x;
      String latLongs[] = getLatLongPositions(postcode);
      System.out.println("Latitude: "+latLongs[0]+" and Longitude: "+latLongs[1]);
      LatitudeAndLongitudeWithPincode lp=new LatitudeAndLongitudeWithPincode();
      DecimalFormat plain = new DecimalFormat("0.00");
      System.out.println(plain.format(lp.distance(23.3780353,85.3187914, Double.parseDouble(latLongs[0]), Double.parseDouble(latLongs[1]), "K")));
      return plain.format(lp.distance(23.3780353,85.3187914, Double.parseDouble(latLongs[0]), Double.parseDouble(latLongs[1]), "K"));
  }

  public static String[] getLatLongPositions(String address) throws Exception
  {
   
    int responseCode = 0;
    String api = "http://maps.googleapis.com/maps/api/geocode/xml?address=" + URLEncoder.encode(address, "UTF-8") + "&sensor=true";
    System.out.println("URL : "+api);
    URL url = new URL(api);
    HttpURLConnection httpConnection = (HttpURLConnection)url.openConnection();
    httpConnection.connect();
    responseCode = httpConnection.getResponseCode();
    if(responseCode == 200)
    {
      DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();;
      Document document = builder.parse(httpConnection.getInputStream());
      XPathFactory xPathfactory = XPathFactory.newInstance();
      XPath xpath = xPathfactory.newXPath();
      XPathExpression expr = xpath.compile("/GeocodeResponse/status");
      String status = (String)expr.evaluate(document, XPathConstants.STRING);
      if(status.equals("OK"))
      {
         expr = xpath.compile("//geometry/location/lat");
         String latitude = (String)expr.evaluate(document, XPathConstants.STRING);
         expr = xpath.compile("//geometry/location/lng");
         String longitude = (String)expr.evaluate(document, XPathConstants.STRING);
         return new String[] {latitude, longitude};
      }
      else
      {
         throw new Exception("Error from the API - response status: "+status);
      }
    }
    return null;
  }
  
  public double distance(double lat1, double lon1, double lat2, double lon2, String sr) {


          double theta = lon1 - lon2;
          double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
          dist = Math.acos(dist);
          dist = rad2deg(dist);
          dist = dist * 60 * 1.1515;
          if (sr.equals("K")) {
            dist = dist * 1.609344;
          } else if (sr.equals("N")) {
            dist = dist * 0.8684;
            }
          return (dist);
        }
    public double deg2rad(double deg) {
          return (deg * Math.PI / 180.0);
        }
    public double rad2deg(double rad) {
          return (rad * 180.0 / Math.PI);
        }
}


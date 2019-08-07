package BoardUtil;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.Cookie;

import org.apache.catalina.connector.Response;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Util {
	public static String toSimpleDate(Date date) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		return formatter.format(date);
	}
	public static String toDate(Date date) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyy-MM-dd HH:mm");
		return formatter.format(date);
	}
	public static String postToString(String input) {
		String result = null;
		try {
			result = new String(input.getBytes("8859_1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
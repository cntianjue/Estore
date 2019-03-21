package com.xmut.estore.lister;

import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;




public class SessionAtrrListener implements HttpSessionAttributeListener{
public static Hashtable<String, HttpSession>  session=new Hashtable<String,HttpSession>();
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		String key=event.getName();
		if(key.equals("account")) {
	        String account=(String)event.getValue();
			HttpSession cusession=event.getSession();
		     HttpSession oldsession=session.get(account);
		
	if(oldsession!=null&& !oldsession.getId().equals(cusession.getId())) {
		oldsession.removeAttribute("account");
	System.out.println("aa");
	}
	session.put(account, cusession);
		}
		
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		
	}

}

package com.xmut.estore.lister;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
public class Lister implements HttpSessionListener{
int i=0;
int sum=0;
	@Override
	public void sessionCreated(HttpSessionEvent se) {
//		i++;
//		sum=i+sum;
//		System.out.println("��������"+sum);
		ServletContext ap=se.getSession().getServletContext();
		Object ob=ap.getAttribute("count");
		int count=0;
		if(ob!=null) {
			count=(int)ob;
		}
		count++;
		ap.setAttribute("count", count);
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		Object obj=se.getSession().getAttribute("account");
	   if(obj!=null) {
		   String account=(String)obj;
		SessionAtrrListener.session.remove(account);
	   }
	   }

}

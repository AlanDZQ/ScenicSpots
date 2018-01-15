package db;


import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DatabaseInitializer implements ServletContextListener {
	
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("I'm in");
//		new TestDB().test();
		new TestDB().createDatabase();
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

}

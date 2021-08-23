package modal;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.project.product.entities.User;

public class UserDao {
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	 
	//if user is not valid then it returns null
	public User getUserByEmailAndPassword(String email,String password)
	{
		User user=null;
		try {
			  
			String query="from User where user_email =: e and user_password =: p";
			Session session=this.factory.openSession();
			Query q=session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			
			user=(User) q.uniqueResult();
			
			
			
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return user;
	}

}

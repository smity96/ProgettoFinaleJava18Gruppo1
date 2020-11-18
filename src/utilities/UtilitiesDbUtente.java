package utilities;
import java.util.Base64;
import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import model.Film;
import model.Utente;

public class UtilitiesDbUtente {

	private static EntityManager getManager() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ProgettoFinaleJava18Gruppo1");
		EntityManager em = emf.createEntityManager();
		return em;
	}


	public static  void insUtente(Utente u) {
		EntityManager em=getManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(u);
		et.commit();
		System.out.println(u.getNome()+" "+u.getCognome()+":"+"inserito con successo");
	}

	public static void modUtente(Utente u) {
		EntityManager em=getManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.merge(u);
		et.commit();
		System.out.println(u.getNome()+" "+u.getCognome()+":"+"modificato con successo");
	}

	public static void cancUtente(Utente u) {
		EntityManager em=getManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		if (!em.contains(u)) {
			u = em.merge(u);
		}
		em.remove(u);
		et.commit();
		System.out.println(u.getNome()+" "+u.getCognome()+":"+" eliminato con successo");
	}

	public static Utente leggiUtenteById(int id) {
		EntityManager em=getManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		Utente u=em.find(Utente.class, id);
		et.commit();
		System.out.println(u.getNome()+" "+u.getCognome()+":"+"letto con successo");
		return u;
	}


	public static List<Utente> listaUtenti(){
		EntityManager em=getManager();
		return em.createNamedQuery("Utente.findAll").getResultList();
	}



	public static Utente isUtenteGiaReg(String email) {
		EntityManager em=getManager();
		EntityTransaction et=em.getTransaction();
		et.begin();
		Utente u=em.find(Utente.class, email);
		et.commit();
		System.out.println("utente gia' registrato"+" "+u.getIdUtente());
		return u;



	}

	public static Utente uLogin(String email,String pssw) {
		if(email==null||pssw==null||pssw.length()==0)return null;
		pssw = Base64.getEncoder().encodeToString(pssw.getBytes());
		EntityManager em=getManager();
		EntityTransaction et=em.getTransaction();
		et.begin();
		Query q=em.createQuery("Select u from Utente u where u.password =:pwd and u.email =:email");
		q.setParameter("pwd", pssw);
		q.setParameter("email", email);
		try {
			Utente u=(Utente)q.getSingleResult();
			et.commit();
			return u;
		}catch (NoResultException e) {
			return null;
		}
	}

	public static Utente leggiUtenteByRuolo(int ruolo) {
		EntityManager em=getManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		Utente u=em.find(Utente.class, ruolo);
		et.commit();
		System.out.println(u.getRuolo()+" "+ ":" +"letto con successo");
		return u;
	}

	public static boolean isAdmin(HttpServletRequest request) {
		Utente u=(Utente)request.getSession().getAttribute("uLog");
		if(u==null||u.getRuolo()!=3) {
			return false;
		}else {
			return true;
		}
	}

	public static boolean isStaff(HttpServletRequest request) {
		Utente u=(Utente)request.getSession().getAttribute("uLog");
		if(u==null||u.getRuolo()!=2) {
			return false;
		}else {
			return true;
		}
	}

	public static boolean isUtente(HttpServletRequest request) {
		Utente u=(Utente)request.getSession().getAttribute("uLog");
		if(u==null||u.getRuolo()!=1) {
			return false;
		}else {
			return true;
		}
	}



}



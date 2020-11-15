package utilities;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Film;

public class UtilitiesDbFilm {
	private static EntityManager getManager() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");	// connetto il database
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ProgettoFinaleJava18Gruppo1"); 
		EntityManager em = emf.createEntityManager();
		return em;
	}

	// Create
	public static void inserisciFilm(Film f) {
		EntityManager em=getManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(f);
		et.commit();
	}

	// Update
	public static void modificaFilm(Film f) {
		EntityManager em=getManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.merge(f);
		et.commit();
	}

	// Read
	public static Film leggiFilm(int id) {
		EntityManager em=getManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		Film f = em.find(Film.class, id);
		et.commit();
		return f;
	}

	// Delete
	public static void cancellaFilm(Film f) {
		EntityManager em=getManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		if (!em.contains(f)) {
		    f = em.merge(f);
		}
		em.remove(f);
		et.commit();
	}
	
	// Delete by id
	public static void cancellaFilmById(int id) {
		EntityManager em=getManager();
		EntityTransaction et = em.getTransaction();
		Film f=leggiFilm(id);
		et.begin();
		if (!em.contains(f)) {
		    f = em.merge(f);
		}
		em.remove(f);
		et.commit();
	}
	
	// ReadAll
	// Attenzione che restituisce una variabile di tipo List e non ArrayList
	public static List<Film> leggiFilmAll() {
		EntityManager em=getManager();
		Query q = em.createNamedQuery("Film.findAll");
		return (List<Film>) q.getResultList();
	}

	// metodo per convertire Date in LocalDate
	public static LocalDate convertiDate(Date d1) {
		LocalDate date = d1.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		return date;
	}

	// metodo per convertire LocalDate in Date
	public static Date convertiLocalDate(LocalDate d2) {
		Date date = Date.from(d2.atStartOfDay(ZoneId.systemDefault()).toInstant());
		return date;
	}
	
}
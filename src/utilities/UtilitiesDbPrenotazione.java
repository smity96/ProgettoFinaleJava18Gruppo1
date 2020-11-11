package utilities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Film;
import model.Prenotazione;
import model.Proiezione;
import model.Utente;

public class UtilitiesDbPrenotazione {
	
	private static EntityManager getManager() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ProgettoFinaleJava18Gruppo1"); //connetto il database
        EntityManager em  = emf.createEntityManager();
        return em;
	}
	
	
/*--- Metodo per modificare la prenotazione ---*/	

	public static void modificaPrenotazione(Prenotazione prenotazione) {
		EntityManager em = getManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.merge(prenotazione); //update
		et.commit();
		System.out.println("modifica eseguita");
	}
	
	/*--- Metodo per inserire la prenotazione ---*/

    public static void inserisciPrenotazione(Prenotazione prenotazione) {
    	EntityManager em = getManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(prenotazione); //insert into
		et.commit();
		System.out.println("prenotazione inserita");
	}
	
/*--- Metodo per rimuovere la prenotazione ---*/	
	
	public static void rimuoviPrenotazione(int id) {
		EntityManager em = getManager();
		EntityTransaction et = em.getTransaction();
		Prenotazione prenotazione = leggiPrenotazioneById(id);
		et.begin();
		if (!em.contains(prenotazione)) {
		    prenotazione = em.merge(prenotazione);
		}
		em.remove(prenotazione); //delete
		et.commit();
		System.out.println("prenotazione rimossa");
	}
	
/*--- Metodo per scorrere la lista di prenotazioni ---*/	
	
	public static List<Prenotazione> leggiPrenotazione(){
		EntityManager em = getManager();
		return em.createNamedQuery("Prenotazione.findAll").getResultList();
	}
	
/*--- Metodo per leggere una prenotazione da Id ---*/
	
	public static Prenotazione leggiPrenotazioneById(int id) {
		EntityManager em = getManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		Prenotazione prenotazione = em.find(Prenotazione.class, id);
		et.commit();
		return prenotazione;
	}
	
/*--- Metodo per la proiezione collegata all'utente ---*/
	
	public static List<Proiezione> leggiProiezioniByUtente(int id){
		List<Proiezione> listaP = new ArrayList<>();
		List<Prenotazione> listaPren = leggiPrenotazione();
		for(Prenotazione p : listaPren) {
			if(p.getUtente()==id) {
				listaP.add(UtilitiesDbProiezione.leggiProiezioneById(p.getProiezione()));
			}
		}
		return listaP;
	}
	
/*-- Metodo --*/
	
	public static Prenotazione leggiPrenotazioneDaUtenteFilm(Utente utente, int id_p){
		EntityManager em = getManager();
		Query q = em.createQuery("SELECT p FROM Prenotazione p WHERE proiezione =:proiezione AND utente =:utente");
		q.setParameter("proiezione", id_p);
		q.setParameter("utente", utente.getIdUtente());
		return (Prenotazione) q.getSingleResult();
	}
}

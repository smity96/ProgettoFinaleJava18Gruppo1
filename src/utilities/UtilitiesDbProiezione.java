package utilities;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Proiezione;
import model.Utente;

public class UtilitiesDbProiezione {
	
    
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
    
    public static void aggiungiProiezione(Proiezione p) {
    	EntityManager em=getManager();
    	EntityTransaction et=em.getTransaction();
        et.begin();
        em.persist(p);
        et.commit();
    }
    
    public static void modificaProiezione(Proiezione p) {
    	EntityManager em=getManager();
    	EntityTransaction et=em.getTransaction();
        et.begin();
        em.merge(p);
        et.commit();
    }
    
    public static Proiezione leggiProiezioneById(int id) {
    	EntityManager em=getManager();
		
		Proiezione p=em.find(Proiezione.class, id);
		
		return p;
	}
	
	public static void eliminaProiezione(Proiezione p) {
		EntityManager em=getManager();
		EntityTransaction et=em.getTransaction();
		et.begin();
		if (!em.contains(p)) {
		    p = em.merge(p);
		}
		em.remove(p);
		et.commit();
	}
	
	public static List<Proiezione> leggiProiezioni(){
		EntityManager em=getManager();
		Query q = em.createNamedQuery("Proiezione.findAll");
		
		return (List<Proiezione>) q.getResultList();
	}
	
	
	public static Boolean slotOccupato(List<Proiezione> proiezioni, Proiezione pDaAggiungere ){
		LocalDateTime inizioPDaAggiungere=LocalDateTime.ofInstant(pDaAggiungere.getDataOra().toInstant(), ZoneId.systemDefault());
		LocalDateTime finePDaAggiungere=inizioPDaAggiungere.plusMinutes(pDaAggiungere.getIntervallo()+pDaAggiungere.getFilm().getDurata());
		Boolean timeSlotOccupato=false;
		for (Proiezione p : proiezioni) {
			LocalDateTime inizioP=LocalDateTime.ofInstant(p.getDataOra().toInstant(), ZoneId.systemDefault());			
			LocalDateTime fineP=inizioP.plusMinutes(p.getIntervallo()+p.getFilm().getDurata());
			if(inizioPDaAggiungere.isEqual(inizioP)&&finePDaAggiungere.isEqual(fineP)) {
				timeSlotOccupato=false;
			}else if(inizioP.isBefore(finePDaAggiungere) && fineP.isAfter(inizioPDaAggiungere)) {
					timeSlotOccupato=true;
			}
		}
		return timeSlotOccupato;
	}
	
	
	public static Boolean slotRegolare(Proiezione pDaAggiungere){
		LocalDateTime inizioP=LocalDateTime.ofInstant(pDaAggiungere.getDataOra().toInstant(), ZoneId.systemDefault());
		LocalDateTime dataOraAttuale=LocalDateTime.now();
		if(inizioP.isBefore(dataOraAttuale)) {
			return false;
		}
		return true;
	}
    
}
package model;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@NamedQuery(name="Prenotazione.findAll", query="SELECT p FROM Prenotazione p")
public class Prenotazione implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_prenotazione")
	private int id_prenotazione;
	private int proiezione;
	private int utente;


	public int getIdPrenotazione() {
		return this.id_prenotazione;
	}

	public void setIdPrenotazione(int id_prenotazione) {
		this.id_prenotazione = id_prenotazione;
	}

	@OneToOne(mappedBy = "id_proiezione")
	public int getProiezione() {
		return this.proiezione;
	}

	public void setProiezione(int proiezione) {
		this.proiezione = proiezione;
	}

	public int getUtente() {
		return this.utente;
	}

	public void setUtente(int utente) {
		this.utente = utente;
	}

	@Override
	public String toString() {
		return "Prenotazione [id_prenotazione=" + id_prenotazione + ", proiezione=" + proiezione + ", utente=" + utente
				+ "]";
	}

}
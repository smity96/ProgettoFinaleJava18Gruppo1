package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the prenotazione database table.
 * 
 */
@Entity
@Table(name="prenotazione")
@NamedQuery(name="Prenotazione.findAll", query="SELECT p FROM Prenotazione p")
public class Prenotazione implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_prenotazione", unique=true, nullable=false)
	private int idPrenotazione;

	@Column(name="posti_prenotati")
	private int postiPrenotati;

	//bi-directional many-to-one association to Proiezione
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="proiezione", nullable=false)
	private Proiezione proiezione;

	//bi-directional many-to-one association to Utente
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="utente", nullable=false)
	private Utente utente;

	public Prenotazione() {
	}

	public int getIdPrenotazione() {
		return this.idPrenotazione;
	}

	public void setIdPrenotazione(int idPrenotazione) {
		this.idPrenotazione = idPrenotazione;
	}

	public int getPostiPrenotati() {
		return this.postiPrenotati;
	}

	public void setPostiPrenotati(int postiPrenotati) {
		this.postiPrenotati = postiPrenotati;
	}

	public Proiezione getProiezione() {
		return this.proiezione;
	}

	public void setProiezione(Proiezione proiezione) {
		this.proiezione = proiezione;
	}

	public Utente getUtente() {
		return this.utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

}
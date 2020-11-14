package model;

import java.io.Serializable;
import javax.persistence.*;


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
	
	@Column(name="costo_totale")
	private double costo_totale;

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

	public double getCosto_totale() {
		return costo_totale;
	}

	public void setCosto_totale(double costo_totale) {
		this.costo_totale = costo_totale;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Prenotazione other = (Prenotazione) obj;
		if (idPrenotazione != other.idPrenotazione)
			return false;
		return true;
	}
	
	
	
}
package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the proiezione database table.
 * 
 */
@Entity
@Table(name="proiezione")
@NamedQuery(name="Proiezione.findAll", query="SELECT p FROM Proiezione p")
public class Proiezione implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_proiezione", unique=true, nullable=false)
	private int idProiezione;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable=false)
	private Date dataOra;

	@Column(nullable=false)
	private int intervallo;

	@Column(nullable=false)
	private int postiMax;

	//bi-directional many-to-one association to Prenotazione
	@OneToMany(mappedBy="proiezioneBean")
	private List<Prenotazione> prenotazioni;

	//bi-directional many-to-one association to Film
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_film", nullable=false)
	private Film film;

	public Proiezione() {
	}

	public int getIdProiezione() {
		return this.idProiezione;
	}

	public void setIdProiezione(int idProiezione) {
		this.idProiezione = idProiezione;
	}

	public Date getDataOra() {
		return this.dataOra;
	}

	public void setDataOra(Date dataOra) {
		this.dataOra = dataOra;
	}

	public int getIntervallo() {
		return this.intervallo;
	}

	public void setIntervallo(int intervallo) {
		this.intervallo = intervallo;
	}

	public int getPostiMax() {
		return this.postiMax;
	}

	public void setPostiMax(int postiMax) {
		this.postiMax = postiMax;
	}

	public List<Prenotazione> getPrenotazioni() {
		return this.prenotazioni;
	}

	public void setPrenotazioni(List<Prenotazione> prenotaziones) {
		this.prenotazioni = prenotaziones;
	}

	public Prenotazione addPrenotazione(Prenotazione prenotazione) {
		getPrenotazioni().add(prenotazione);
		prenotazione.setProiezioneBean(this);

		return prenotazione;
	}

	public Prenotazione removePrenotazione(Prenotazione prenotazione) {
		getPrenotazioni().remove(prenotazione);
		prenotazione.setProiezioneBean(null);

		return prenotazione;
	}

	public Film getFilm() {
		return this.film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}

}
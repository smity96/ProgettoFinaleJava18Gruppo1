package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;
//lorem ipsum
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
	@OneToMany(mappedBy="proiezione")
	private List<Prenotazione> prenotazioni;

	//bi-directional many-to-one association to Film
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_film", nullable=false)
	private Film film;
	
	@Column(nullable=false)
	private Double prezzo;

	public Double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(Double prezzo) {
		this.prezzo = prezzo;
	}

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

	public void setPrenotazioni(List<Prenotazione> prenotazione) {
		this.prenotazioni = prenotazione;
	}

	public Prenotazione addPrenotazione(Prenotazione prenotazione) {
		getPrenotazioni().add(prenotazione);
		prenotazione.setProiezione(this);

		return prenotazione;
	}

	public Prenotazione removePrenotazione(Prenotazione prenotazione) {
		getPrenotazioni().remove(prenotazione);
		prenotazione.setProiezione(null);

		return prenotazione;
	}

	public Film getFilm() {
		return this.film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Proiezione other = (Proiezione) obj;
		if (idProiezione != other.idProiezione)
			return false;
		return true;
	}

}
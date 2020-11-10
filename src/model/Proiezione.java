package model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Time;
import java.util.Date;


@Entity
@NamedQuery(name="Proiezione.findAll", query="SELECT p FROM Proiezione p")
public class Proiezione implements Serializable {
	private static final long serialVersionUID = 1L;

	private int idProiezione;

	private Date dataOra;

	private Film film;

	private int intervallo;

	private int postiMax = 100;

	public Proiezione() {
	}

	@Id
	@Column(name="id_proiezione")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getIdProiezione() {
		return this.idProiezione;
	}

	public void setIdProiezione(int idProiezione) {
		this.idProiezione = idProiezione;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getDataOra() {
		return this.dataOra;
	}

	public void setDataOra(Date dataOra) {
		this.dataOra = dataOra;
	}
	
	// TODO chiedere conferma antonio
	@OneToOne
	@JoinColumn(name="id_film")
	public Film getFilm() {
		return this.film;
	}

	public void setFilm(Film film) {
		this.film = film;
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

	@Override
	public String toString() {
		return "Proiezione [idProiezione=" + idProiezione + ", dataOra=" + dataOra + ", Film=" + film
				+ ", intervallo=" + intervallo + ", postiMax=" + postiMax + "]";
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

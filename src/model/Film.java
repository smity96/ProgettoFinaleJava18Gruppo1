package model;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@NamedQuery(name="Film.findAll", query="SELECT f FROM Film f")
public class Film implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_film")
	private int idFilm;

	@Column(name="anno_di_uscita")
	private String annoDiUscita;

	@Column(name="durata")
	private int durata;

	@Column(name="genere")
	private String genere;
	
	@Column(name="locandina")
	private String locandina;

	@Column(name="titolo")
	private String titolo;

	@Column(name="trama")
	private String trama;

	@Column(name="url_trailer")
	private String urlTrailer;

	public Film() {
	}

	public String getAnnoDiUscita() {
		return this.annoDiUscita;
	}

	public void setAnnoDiUscita(String annoDiUscita) {
		this.annoDiUscita = annoDiUscita;
	}

	public int getDurata() {
		return this.durata;
	}

	public void setDurata(int durata) {
		this.durata = durata;
	}

	public String getGenere() {
		return this.genere;
	}

	public void setGenere(String genere) {
		this.genere = genere;
	}

	public int getIdFilm() {
		return this.idFilm;
	}

	public void setIdFilm(int idFilm) {
		this.idFilm = idFilm;
	}

	public String getLocandina() {
		return this.locandina;
	}

	public void setLocandina(String locandina) {
		this.locandina = locandina;
	}

	public String getTitolo() {
		return this.titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getTrama() {
		return this.trama;
	}

	public void setTrama(String trama) {
		this.trama = trama;
	}

	public String getUrlTrailer() {
		return this.urlTrailer;
	}

	public void setUrlTrailer(String urlTrailer) {
		this.urlTrailer = urlTrailer;
	}

	@Override
	public String toString() {
		return "Film [idFilm=" + idFilm + ", annoDiUscita=" + annoDiUscita + ", durata=" + durata + ", genere=" + genere
				+ ", locandina=" + locandina + ", titolo=" + titolo + ", trama=" + trama + ", urlTrailer=" + urlTrailer
				+ "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Film other = (Film) obj;
		if (idFilm != other.idFilm)
			return false;
		if (locandina == null) {
			if (other.locandina != null)
				return false;
		} else if (!locandina.equals(other.locandina))
			return false;
		if (titolo == null) {
			if (other.titolo != null)
				return false;
		} else if (!titolo.equals(other.titolo))
			return false;
		return true;
	}
	
}
package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the film database table.
 * 
 */
@Entity
@Table(name="film")
@NamedQuery(name="Film.findAll", query="SELECT f FROM Film f")
public class Film implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_film", unique=true, nullable=false)
	private int idFilm;

	@Column(name="anno_di_uscita", nullable=false, length=10)
	private String annoDiUscita;

	@Column(nullable=false)
	private int durata;

	@Column(nullable=false, length=100)
	private String genere;

	@Column(length=500)
	private String locandina;

	@Column(nullable=false, length=100)
	private String titolo;

	@Lob
	private String trama;

	@Column(name="url_trailer", nullable=false, length=100)
	private String urlTrailer;

	//bi-directional many-to-one association to Proiezione
	@OneToMany(mappedBy="film")
	private List<Proiezione> proieziones;

	public Film() {
	}

	public int getIdFilm() {
		return this.idFilm;
	}

	public void setIdFilm(int idFilm) {
		this.idFilm = idFilm;
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

	public List<Proiezione> getProieziones() {
		return this.proieziones;
	}

	public void setProieziones(List<Proiezione> proieziones) {
		this.proieziones = proieziones;
	}

	public Proiezione addProiezione(Proiezione proiezione) {
		getProieziones().add(proiezione);
		proiezione.setFilm(this);

		return proiezione;
	}

	public Proiezione removeProiezione(Proiezione proiezione) {
		getProieziones().remove(proiezione);
		proiezione.setFilm(null);

		return proiezione;
	}

	@Override
	public String toString() {
		return "Film [idFilm=" + idFilm + ", annoDiUscita=" + annoDiUscita + ", durata=" + durata + ", genere=" + genere
				+ ", locandina=" + locandina + ", titolo=" + titolo + ", trama=" + trama + ", urlTrailer=" + urlTrailer
				+ ", proieziones=" + proieziones + "]";
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
		return true;
	}
	
	
	
}
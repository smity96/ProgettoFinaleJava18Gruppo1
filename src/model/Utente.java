package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the utente database table.
 * 
 */
@Entity
@Table(name="utente")
@NamedQuery(name="Utente.findAll", query="SELECT u FROM Utente u")
public class Utente implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_utente", unique=true, nullable=false)
	private int idUtente;

	@Column(nullable=false, length=50)
	private String cognome;

	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	private Date dataDiNascita;

	@Column(nullable=false, length=100)
	private String email;

	private int eta;

	@Column(length=500)
	private String immagine;

	@Column(length=50)
	private String indirizzo;

	@Column(nullable=false, length=50)
	private String nome;

	@Column(length=50)
	private String nomeSocieta;

	@Column(name="p_iva", length=100)
	private String pIva;

	@Column(nullable=false, length=100)
	private String password;

	private int ruolo;

	//bi-directional many-to-one association to Prenotazione
	@OneToMany(mappedBy="utente")
	private List<Prenotazione> prenotazioni;

	public Utente() {
	}

	public String getPIva() {
		return this.pIva;
	}

	public void setPIva(String pIva) {
		this.pIva = pIva;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRuolo() {
		return this.ruolo;
	}

	public void setRuolo(int ruolo) {
		this.ruolo = ruolo;
	}

	public List<Prenotazione> getPrenotazioni() {
		return this.prenotazioni;
	}

	public void setPrenotazioni(List<Prenotazione> prenotaziones) {
		this.prenotazioni = prenotaziones;
	}

	public Prenotazione addPrenotazione(Prenotazione prenotazione) {
		getPrenotazioni().add(prenotazione);
		prenotazione.setUtente(this);

		return prenotazione;
	}

	public Prenotazione removePrenotazione(Prenotazione prenotazione) {
		getPrenotazioni().remove(prenotazione);
		prenotazione.setUtente(null);

		return prenotazione;
	}



	public int getIdUtente() {
		return idUtente;
	}



	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}


	public String getCognome() {
		return cognome;
	}



	public void setCognome(String cognome) {
		this.cognome = cognome;
	}



	public Date getDataDiNascita() {
		return dataDiNascita;
	}



	public void setDataDiNascita(Date dataDiNascita) {
		this.dataDiNascita = dataDiNascita;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public int getEta() {
		return eta;
	}



	public void setEta(int eta) {
		this.eta = eta;
	}



	public String getImmagine() {
		return immagine;
	}



	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}



	public String getIndirizzo() {
		return indirizzo;
	}



	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}



	public String getNome() {
		return nome;
	}



	public void setNome(String nome) {
		this.nome = nome;
	}



	public String getNomeSocieta() {
		return nomeSocieta;
	}



	public void setNomeSocieta(String nomeSocieta) {
		this.nomeSocieta = nomeSocieta;
	}



	public String getpIva() {
		return pIva;
	}



	public void setpIva(String pIva) {
		this.pIva = pIva;
	}

}
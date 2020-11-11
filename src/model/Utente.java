package model;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;

import javax.persistence.*;


import java.util.Date;



@Entity
@NamedQueries({
	
@NamedQuery(name="Utente.findAll", query="SELECT u FROM Utente u"),
		@NamedQuery(name="Utente.email",query="SELECT u FROM Utente u WHERE u.email=:email")

})
public class Utente implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_utente")
	private int idUtente;
	private String cognome;
	@Temporal(TemporalType.DATE)
	private Date dataDiNascita;
	private String email;
	private String indirizzo;
	private String nome;
	private String nomeSocieta;
	@Column(name="p_iva")
	private String pIva;
	private String password;
	private int ruolo;
	@Column(name="immagine", nullable=true)
	private String immagine; 
	
	
	public Utente() {
	}

	public int getIdUtente() {
		return this.idUtente;
	}

	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}

	public String getCognome() {
		return this.cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	
	public Date getDataDiNascita() {
		return this.dataDiNascita;
	}

	public void setDataDiNascita(Date dataDiNascita) {		
		this.dataDiNascita = dataDiNascita;		
	}

	
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIndirizzo() {
		return this.indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNomeSocieta() {
		return this.nomeSocieta;
	}

	public void setNomeSocieta(String nomeSocieta) {
		this.nomeSocieta = nomeSocieta;
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
	
	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Utente other = (Utente) obj;
		if (idUtente != other.idUtente)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Utente: idUtente=" + idUtente + ", cognome=" + cognome + ", dataDiNascita=" + dataDiNascita + ", email="
				+ email + ", indirizzo=" + indirizzo + ", nome=" + nome + ", nomeSocieta=" + nomeSocieta + ", pIva="
				+ pIva + ", password=" + password + ", ruolo=" + ruolo + "immagine=" + immagine;
	}
	

}

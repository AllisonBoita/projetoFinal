package edu.unoesc.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

@SuppressWarnings("serial")
public class Pessoa implements Serializable {

	private int id;
	private String nome;
	private String email;
	private String telefone;
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date dataNasc;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public Date getDataNasc() {
		return dataNasc;
	}

	public void setDataNasc(Date dataNasc) {

		this.dataNasc = dataNasc;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getDataNasFormated() {
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		if (this.dataNasc == null)
			return format.format(new Date());

		return format.format(this.dataNasc);
	}

	public String getDataNasDateInput() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		if (this.dataNasc == null)
			return format.format(new Date());

		return format.format(this.dataNasc);
	}

}

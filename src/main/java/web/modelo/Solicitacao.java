package web.modelo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Solicitacao {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	private String recorrencia;

	@NotNull
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date data_inicio;

	@NotNull
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date data_fim;

	@NotNull
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "HH:mm")
	private Date horario_inicio;

	@NotNull
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "HH:mm")
	private Date horario_fim;

	@NotNull
	@Column(columnDefinition = "TEXT")
	private String justificativa;

	@NotNull
	private String status;

	@NotNull
	@ManyToOne
	private Servidor servidor;

	@NotNull
	@ManyToOne
	private Sala sala;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRecorrencia() {
		return recorrencia;
	}

	public void setRecorrencia(String recorrencia) {
		this.recorrencia = recorrencia;
	}

	public Date getData_inicio() {
		return data_inicio;
	}

	public void setData_inicio(Date data_inicio) {
		this.data_inicio = data_inicio;
	}

	public Date getData_fim() {
		return data_fim;
	}

	public void setData_fim(Date data_fim) {
		this.data_fim = data_fim;
	}

	public Date getHorario_inicio() {
		return horario_inicio;
	}

	public void setHorario_inicio(Date horario_inicio) {
		this.horario_inicio = horario_inicio;
	}

	public Date getHorario_fim() {
		return horario_fim;
	}

	public void setHorario_fim(Date horario_fim) {
		this.horario_fim = horario_fim;
	}

	public String getJustificativa() {
		return justificativa;
	}

	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Servidor getServidor() {
		return servidor;
	}

	public void setServidor(Servidor servidor) {
		this.servidor = servidor;
	}

	public Sala getSala() {
		return sala;
	}

	public void setSala(Sala sala) {
		this.sala = sala;
	}

}

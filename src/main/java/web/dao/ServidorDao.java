package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.modelo.Servidor;

@Repository
public class ServidorDao {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Servidor servidor) {
		manager.persist(servidor);
	}

	public void altera(Servidor servidor) {
		manager.merge(servidor);
	}

	public List<Servidor> lista() {
		return manager.createQuery("select c from Servidor c order by c.id desc", Servidor.class).getResultList();
	}

	public List<Servidor> buscaPorMatriculaEdita(Servidor servidor) {
		return manager
				.createQuery("select c from Servidor c where c.matricula = :matricula and c.id <> :id", Servidor.class)
				.setParameter("matricula", servidor.getMatricula()).setParameter("id", servidor.getId())
				.getResultList();
	}

	public List<Servidor> buscaPorMatriculaAdiciona(Servidor servidor) {
		return manager.createQuery("select c from Servidor c where c.matricula = :matricula", Servidor.class)
				.setParameter("matricula", servidor.getMatricula()).getResultList();
	}

	public Servidor buscaPorId(Long id) {
		return manager.find(Servidor.class, id);
	}

	public void remove(Long id) {
		manager.createQuery("delete from Servidor c where c.id = :id").setParameter("id", id).executeUpdate();
	}

}

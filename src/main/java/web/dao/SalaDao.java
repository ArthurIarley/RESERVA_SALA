
package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.modelo.Sala;

@Repository
public class SalaDao {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Sala sala) {
		manager.persist(sala);
	}

	public void altera(Sala sala) {
		manager.merge(sala);
	}

	public List<Sala> lista() {
		return manager.createQuery("select c from Sala c order by c.id desc", Sala.class).getResultList();
	}

	public List<Sala> buscaPorNomeEdita(Sala sala) {
		return manager
				.createQuery("select c from Sala c where c.nome = :nome and c.id <> :id", Sala.class)
				.setParameter("nome", sala.getNome()).setParameter("id", sala.getId())
				.getResultList();
	}

	public List<Sala> buscaPorNomeAdiciona(Sala sala) {
		return manager.createQuery("select c from Sala c where c.nome = :nome", Sala.class)
				.setParameter("nome", sala.getNome()).getResultList();
	}

	public Sala buscaPorId(Long id) {
		return manager.find(Sala.class, id);
	}

	public void remove(Long id) {
		manager.createQuery("delete from Sala c where c.id = :id").setParameter("id", id).executeUpdate();
	}
}
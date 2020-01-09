
package acme.features.authenticated.request;

import java.util.Collection;
import java.util.Date;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.entities.requests.Request;
import acme.framework.repositories.AbstractRepository;

@Repository
public interface AuthenticatedRequestRepository extends AbstractRepository {

	@Query("select a from Request a where a.id = ?1")
	Request findOneById(Integer id);

	@Query("select a from Request a where a.deadline > ?1")
	Collection<Request> findManyAll(Date ldt);

}

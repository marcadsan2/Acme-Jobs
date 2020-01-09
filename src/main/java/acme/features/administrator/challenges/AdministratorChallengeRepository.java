
package acme.features.administrator.challenges;

import java.util.Collection;
import java.util.Date;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.entities.challenges.Challenge;
import acme.framework.repositories.AbstractRepository;

@Repository
public interface AdministratorChallengeRepository extends AbstractRepository {

	@Query("select a from Challenge a where a.id = ?1")
	Challenge findOneById(int id);

	@Query("select a from Challenge a where a.deadline > ?1")
	Collection<Challenge> findManyAll(Date ldt);

}

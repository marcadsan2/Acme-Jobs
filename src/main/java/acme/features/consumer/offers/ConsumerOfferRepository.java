
package acme.features.consumer.offers;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.framework.repositories.AbstractRepository;

@Repository
public interface ConsumerOfferRepository extends AbstractRepository {

	//	@Query("select a from Offer a where a.id = ?1")
	//	Offer findOneById(int id);
	//
	//	@Query("select a from Offer a where a.deadline > CURRENT_DATE")
	//	Collection<Offer> findManyAll();
	//
	@Query("select count(a) from Offer a where a.ticker = ?1")
	Integer getTickers(String a);

}

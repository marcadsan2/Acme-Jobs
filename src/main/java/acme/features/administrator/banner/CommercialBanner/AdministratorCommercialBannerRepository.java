
package acme.features.administrator.banner.CommercialBanner;

import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.entities.banners.CommercialBanner;
import acme.framework.repositories.AbstractRepository;

@Repository
public interface AdministratorCommercialBannerRepository extends AbstractRepository {

	@Query("select s from CommercialBanner s where s.id = ?1")
	CommercialBanner findByid(int id);

	@Query("select s from CommercialBanner s")
	Collection<CommercialBanner> findMany();

}

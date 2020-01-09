
package acme.features.administrator.investorrecord;

import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.entities.investorRecords.InvestorRecord;
import acme.framework.repositories.AbstractRepository;

@Repository
public interface AdministratorInvestorrecordRepository extends AbstractRepository {

	@Query("select a from InvestorRecord a where a.id = ?1")
	InvestorRecord findOneById(int id);

	@Query("select a from InvestorRecord a")
	Collection<InvestorRecord> findMany();

	@Query("select a from InvestorRecord a where a.stars = 5")
	Collection<InvestorRecord> findTopInvestors();

}

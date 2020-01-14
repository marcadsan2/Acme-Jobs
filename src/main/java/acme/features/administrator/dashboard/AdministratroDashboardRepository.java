
package acme.features.administrator.dashboard;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.framework.repositories.AbstractRepository;

@Repository
public interface AdministratroDashboardRepository extends AbstractRepository {

	@Query("select count(s) from Announcement s")
	Integer totalNumberOfAnnouncements();
	@Query("select count (s) from CompanyRecord s")
	Integer totalNumberOfCompanyRecords();
	@Query("select count (s) from InvestorRecord s")
	Integer totalNumberOfInvestorRecords();

	@Query("select s.sector,count(s) from CompanyRecord s group by s.sector ")
	List<List<String>> getNumberOfCampaniesBySector();

	@Query("select s.sector,count(s) from InvestorRecord s group by s.sector ")
	List<List<String>> getNumberOfInvestorBySector();

}

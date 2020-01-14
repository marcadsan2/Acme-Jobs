
package acme.features.administrator.dashboard;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.forms.Dashboard;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.entities.Administrator;
import acme.framework.services.AbstractListService;

@Service
public class AdministratorDashboardListService implements AbstractListService<Administrator, Dashboard> {

	@Autowired
	AdministratroDashboardRepository repository;


	@Override
	public boolean authorise(final Request<Dashboard> request) {
		assert request != null;
		return true;
	}

	@Override
	public void unbind(final Request<Dashboard> request, final Dashboard entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;

		request.unbind(entity, model, "totalNumberAnnouncements", "totalNumberCompanyRecords", "totalNumberInvestorRecords", "numberOfCompaniesGroupedBySector", "numberOfInvestorsGroupedBySector");

	}

	@Override
	public Collection<Dashboard> findMany(final Request<Dashboard> request) {
		Calendar cal = Calendar.getInstance(TimeZone.getDefault());
		Date ldt = cal.getTime();
		List<Dashboard> result = new ArrayList<>();
		Dashboard d = new Dashboard();
		Integer totalNumberOfAnnouncements = this.repository.totalNumberOfAnnouncements();
		Integer totalNumberOfCompanyRecords = this.repository.totalNumberOfCompanyRecords();
		Integer totalNumberOfInvestorRecords = this.repository.totalNumberOfInvestorRecords();

		List<List<String>> companiesBySector = this.repository.getNumberOfCampaniesBySector();
		List<List<String>> investorsBySector = this.repository.getNumberOfInvestorBySector();
		d.setTotalNumberAnnouncements(totalNumberOfAnnouncements);
		d.setTotalNumberCompanyRecords(totalNumberOfCompanyRecords);
		d.setTotalNumberInvestorRecords(totalNumberOfInvestorRecords);

		d.setNumberOfCompaniesGroupedBySector(companiesBySector);
		d.setNumberOfInvestorsGroupedBySector(investorsBySector);
		result.add(d);

		return result;
	}

}

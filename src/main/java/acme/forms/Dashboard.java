
package acme.forms;

import java.io.Serializable;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Dashboard implements Serializable {

	private static final long	serialVersionUID	= 1L;

	Integer						totalNumberAnnouncements;
	Integer						totalNumberCompanyRecords;
	Integer						totalNumberInvestorRecords;

	List<List<String>>			numberOfCompaniesGroupedBySector;
	List<List<String>>			numberOfInvestorsGroupedBySector;

}

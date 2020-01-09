
package acme.features.administrator.investorrecord;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import acme.components.CustomCommand;
import acme.entities.investorRecords.InvestorRecord;
import acme.framework.components.BasicCommand;
import acme.framework.controllers.AbstractController;
import acme.framework.entities.Administrator;

@Controller
@RequestMapping("/administrator/investor-record/")
public class AdministratorInvestorrecordController extends AbstractController<Administrator, InvestorRecord> {

	@Autowired
	private AdministratorInvestorrecordListService		listService;

	@Autowired
	private AdministratorInvestorrecordShowService		showService;

	@Autowired
	private AdministratorInvestorrecordListTopService	listTopService;

	@Autowired
	private AdministratorInvestorrecordCreateService	createService;

	@Autowired
	private AdministratorInvestorrecordDeleteService	deleteService;

	@Autowired
	private AdministratorInvestorrecordUpdateService	updateService;


	@PostConstruct
	private void initialise() {
		super.addBasicCommand(BasicCommand.LIST, this.listService);
		super.addBasicCommand(BasicCommand.SHOW, this.showService);
		super.addCustomCommand(CustomCommand.LIST_TOP, BasicCommand.LIST, this.listTopService);
		super.addBasicCommand(BasicCommand.CREATE, this.createService);

		super.addBasicCommand(BasicCommand.DELETE, this.deleteService);
		super.addBasicCommand(BasicCommand.UPDATE, this.updateService);
	}

}

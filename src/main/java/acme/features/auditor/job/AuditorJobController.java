
package acme.features.auditor.job;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import acme.components.CustomCommand;
import acme.entities.jobs.Job;
import acme.entities.roles.Auditor;
import acme.framework.components.BasicCommand;
import acme.framework.controllers.AbstractController;

@Controller
@RequestMapping("/auditor/job/")
public class AuditorJobController extends AbstractController<Auditor, Job> {

	@Autowired
	private AuditorJobListAuditedService	listAuditedService;

	@Autowired
	private AuditorJobListNoAuditedService	listNoAuditedService;

	@Autowired
	private AuditorJobShowService			showService;


	@PostConstruct
	private void initialise() {
		super.addCustomCommand(CustomCommand.LIST_AUDITED, BasicCommand.LIST, this.listAuditedService);
		super.addCustomCommand(CustomCommand.LIST_NO_AUDITED, BasicCommand.LIST, this.listNoAuditedService);
		super.addBasicCommand(BasicCommand.SHOW, this.showService);
	}

}

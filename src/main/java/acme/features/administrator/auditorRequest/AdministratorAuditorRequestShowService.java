
package acme.features.administrator.auditorRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.auditorRequest.AuditorRequest;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.entities.Administrator;
import acme.framework.services.AbstractShowService;

@Service
public class AdministratorAuditorRequestShowService implements AbstractShowService<Administrator, AuditorRequest> {

	@Autowired
	private AdministratorAuditorRequestRepository repository;


	@Override
	public boolean authorise(final Request<AuditorRequest> request) {
		assert request != null;
		return true;
	}

	@Override
	public void unbind(final Request<AuditorRequest> request, final AuditorRequest entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;
		request.unbind(entity, model, "firm", "statement");

	}

	@Override
	public AuditorRequest findOne(final Request<AuditorRequest> request) {
		assert request != null;
		int arId = request.getModel().getInteger("id");
		AuditorRequest ar = this.repository.findOneById(arId);
		return ar;
	}

}

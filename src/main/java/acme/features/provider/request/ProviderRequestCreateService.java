
package acme.features.provider.request;

import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.requests.Request;
import acme.entities.roles.Provider;
import acme.framework.components.Errors;
import acme.framework.components.HttpMethod;
import acme.framework.components.Model;
import acme.framework.services.AbstractCreateService;

@Service
public class ProviderRequestCreateService implements AbstractCreateService<Provider, Request> {

	@Autowired
	ProviderRequestRepository repository;


	@Override
	public boolean authorise(final acme.framework.components.Request<Request> request) {
		assert request != null;

		return true;

	}

	@Override
	public void bind(final acme.framework.components.Request<Request> request, final Request entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;

		request.bind(entity, errors, "creationMoment");

	}

	@Override
	public void unbind(final acme.framework.components.Request<Request> request, final Request entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;

		request.unbind(entity, model, "title", "deadline", "description", "reward", "ticker");

		if (request.isMethod(HttpMethod.GET)) {
			model.setAttribute("aceptar", "false");
		} else {
			request.transfer(model, "aceptar");
		}

	}

	@Override
	public Request instantiate(final acme.framework.components.Request<Request> request) {
		Date t = new Date(System.currentTimeMillis() - 1);
		Request result;

		result = new Request();
		result.setCreationMoment(t);

		return result;
	}

	@Override
	public void validate(final acme.framework.components.Request<Request> request, final Request entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;

		Date date = new Date();
		Calendar cl = Calendar.getInstance(TimeZone.getDefault());
		cl.add(Calendar.DAY_OF_MONTH, 7);
		date = cl.getTime();

		if (!errors.hasErrors("deadline")) {
			boolean esAntes = entity.getDeadline().before(date);
			errors.state(request, !esAntes, "deadline", "provider.request.error.deadline");
		}

		if (!errors.hasErrors("reward")) {
			boolean moneyCurrencyMax = entity.getReward().getCurrency().equals("EUROS") || entity.getReward().getCurrency().equals("€");
			errors.state(request, moneyCurrencyMax, "reward", "provider.request.error.rewardCurrency");
			boolean noNegReward = entity.getReward().getAmount() < 0.0;
			errors.state(request, !noNegReward, "reward", "provider.request.error.noNegReward");
		}

		boolean repetido = this.repository.getTickers(entity.getTicker()) > 0;
		errors.state(request, !repetido, "ticker", "provider.request.error.ticker");

		boolean isAccepted = request.getModel().getBoolean("aceptar");
		errors.state(request, isAccepted, "aceptar", "provider.request.error.aceptar");

	}

	@Override
	public void create(final acme.framework.components.Request<Request> request, final Request entity) {
		Date moment;

		moment = new Date(System.currentTimeMillis() - 100);
		entity.setCreationMoment(moment);
		this.repository.save(entity);
	}

}

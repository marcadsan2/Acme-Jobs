
package acme.features.administrator.banner.CommercialBanner;

import java.time.YearMonth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.banners.CommercialBanner;
import acme.framework.components.Errors;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.entities.Administrator;
import acme.framework.services.AbstractUpdateService;

@Service
public class AdministratorCommercialBannerUpdateService implements AbstractUpdateService<Administrator, CommercialBanner> {

	@Autowired
	AdministratorCommercialBannerRepository repository;


	@Override
	public boolean authorise(final Request<CommercialBanner> request) {
		assert request != null;

		return false;
	}

	@Override
	public void bind(final Request<CommercialBanner> request, final CommercialBanner entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;

		request.bind(entity, errors);
	}

	@Override
	public void unbind(final Request<CommercialBanner> request, final CommercialBanner entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;

		request.unbind(entity, model, "slogan", "imageurl");
	}

	@Override
	public CommercialBanner findOne(final Request<CommercialBanner> request) {
		assert request != null;

		CommercialBanner result;
		int id;

		id = request.getModel().getInteger("id");
		result = this.repository.findByid(id);

		return result;
	}

	@Override
	public void validate(final Request<CommercialBanner> request, final CommercialBanner entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;

		if (!errors.hasErrors("expirationYear") && !errors.hasErrors("expirationMonth")) {
			YearMonth ym = YearMonth.now();
			YearMonth introducido = YearMonth.of(entity.getCreditCard().getExpirationYear(), entity.getCreditCard().getExpirationMonth());
			boolean cmp = introducido.isBefore(ym);
			errors.state(request, !cmp, "expirationYear", "administrator.commercialBanner.error.expiration");
			errors.state(request, !cmp, "expirationMonth", "administrator.commercialBanner.error.expiration");
		}
		if (!errors.hasErrors("cvv")) {
			boolean rangoCVV = String.valueOf(entity.getCreditCard().getCvv()).length() == 3;
			errors.state(request, rangoCVV, "cvv", "administrator.commercialBanner.error.cvv");
		}

	}

	@Override
	public void update(final Request<CommercialBanner> request, final CommercialBanner entity) {
		assert request != null;
		assert entity != null;

		this.repository.save(entity);
	}

}

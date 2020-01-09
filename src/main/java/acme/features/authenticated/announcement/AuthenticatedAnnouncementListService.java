
package acme.features.authenticated.announcement;

import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.announcements.Announcement;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.entities.Authenticated;
import acme.framework.services.AbstractListService;

@Service
public class AuthenticatedAnnouncementListService implements AbstractListService<Authenticated, Announcement> {

	@Autowired
	AuthenticatedAnnouncementRepository repository;


	@Override
	public boolean authorise(final Request<Announcement> request) {
		assert request != null;
		return true;
	}

	@Override
	public void unbind(final Request<Announcement> request, final Announcement entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;

		request.unbind(entity, model, "title", "text");

	}

	@Override
	public Collection<Announcement> findMany(final Request<Announcement> request) {
		assert request != null;
		Collection<Announcement> result;
		Calendar cal = Calendar.getInstance(TimeZone.getDefault());
		cal.add(Calendar.MONTH, -1);
		Date ldt = cal.getTime();
		result = this.repository.findManyLessThanOneMonth(ldt);
		return result;
	}
}

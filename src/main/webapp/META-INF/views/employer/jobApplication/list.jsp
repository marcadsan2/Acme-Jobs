<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:list>
	<acme:list-column code="employer.jobApplication.list.label.referenceNumber" path="referenceNumber" width="20%"/>
	<acme:list-column code="employer.jobApplication.list.label.status" path="status" width="20%"/>
	<acme:list-column code="employer.jobApplication.list.label.creationMoment" path="creationMoment" width="20%"/>
	<acme:list-column code="employer.jobApplication.list.label.qualifications" path="qualifications" width="20%"/>
	<acme:list-column code="employer.jobApplication.list.label.jobTitle" path="job.title" width="20%"/>
</acme:list>
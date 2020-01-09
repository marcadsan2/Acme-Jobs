<%--
- form.jsp
-
- Copyright (c) 2019 Rafael Corchuelo.
-
- In keeping with the traditional purpose of furthering education and research, it is
- the policy of the copyright owner to permit non-commercial use and redistribution of
- this software. It has been tested carefully, but it is not guaranteed for any particular
- purposes.  The copyright owner does not offer any warranties or representations, nor do
- they accept any liabilities with respect to them.
--%>

<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>
<acme:form>
	<acme:form-textbox code="administrator.commercialBanner.form.label.slogan" path="slogan"/>
	<acme:form-url code="administrator.commercialBanner.form.label.imageurl" path="imageurl"/>
	<acme:form-url code="administrator.commercialBanner.form.label.targeturl" path="targeturl"/>
	<acme:form-integer placeholder="5380724565863291" code="administrator.commercialBanner.form.label.cardNumber" path="creditCard.cardNumber"/>
	<acme:form-textbox code="administrator.commercialBanner.form.label.holder" path="creditCard.holder"/>
	<acme:form-integer code="administrator.commercialBanner.form.label.cvv" path="creditCard.cvv"/>
	<acme:form-textbox code="administrator.commercialBanner.form.label.brand" path="creditCard.brand"/>
	<acme:form-integer code="administrator.commercialBanner.form.label.expirationMonth" path="creditCard.expirationMonth"/>
	<acme:form-integer code="administrator.commercialBanner.form.label.expirationYear" path="creditCard.expirationYear"/>


	
	
	
	<acme:form-submit test="${command == 'show' }"
		code="administrator.commercialBanner.form.button.update"
		action="/administrator/commercial-banner/update"/>
	<acme:form-submit test="${command == 'show' }"
		code="administrator.commercialBanner.form.button.delete"
		action="/administrator/commercial-banner/delete"/>
	<acme:form-submit test="${command == 'create' }"
		code="administrator.commercialBanner.form.button.create"
		action="/administrator/commercial-banner/create"/>
	<acme:form-submit test="${command == 'update' }"
		code="administrator.commercialBanner.form.button.update"
		action="/administrator/commercial-banner/update"/>
	<acme:form-submit test="${command == 'delete' }"
		code="administrator.commercialBanner.form.button.delete"
		action="/administrator/commercial-banner/delete"/>
	<acme:form-return code="administrator.commercialBanner.form.button.return"/>
</acme:form>

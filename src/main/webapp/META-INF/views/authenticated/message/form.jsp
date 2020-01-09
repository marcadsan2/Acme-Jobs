<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<jstl:if test="${command != 'create'}">
<acme:form readonly="true">
	<acme:form-textbox code="autheticated.message.form.label.title" path="title" />
	<acme:form-moment 
		code="autheticated.message.form.label.creationMoment" 
		path="creationMoment"/>
	<acme:form-textarea code="autheticated.message.form.label.body" path="body" />
	<acme:form-textbox code="autheticated.message.form.label.tags" path="tags" />
	<acme:form-textbox code="autheticated.message.form.label.user.userAccount.username" path="user.userAccount.username" />
	<acme:form-textbox code="autheticated.message.form.label.user.userAccount.identity.name" path="user.userAccount.identity.name" />
	<acme:form-textbox code="autheticated.message.form.label.user.userAccount.identity.surname" path="user.userAccount.identity.surname"/>
	<acme:form-return code="autheticated.message.form.button.return"/>
</acme:form>

</jstl:if>

<jstl:if test="${command == 'create'}">
<acme:form>
	<acme:form-textbox code="autheticated.message.form.label.title" path="title" />
	<acme:form-textarea code="autheticated.message.form.label.body" path="body" />
	<acme:form-textbox code="autheticated.message.form.label.tags" path="tags" />
	<acme:form-checkbox code="autheticated.message.form.checkbox.aceptar" path="aceptar"/>
	<acme:form-return code="autheticated.message.form.button.return"/>
	<acme:form-hidden path="idThread" />
	<acme:form-submit  code="authenticated.message.form.button.create" action="/authenticated/message/create"/>
</acme:form>
</jstl:if>
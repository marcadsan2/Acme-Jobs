<%--
- menu.jsp
-
- Copyright (c) 2019 Rafael Corchuelo.
-
- In keeping with the traditional purpose of furthering education and research, it is
- the policy of the copyright owner to permit non-commercial use and redistribution of
- this software. It has been tested carefully, but it is not guaranteed for any particular
- purposes.  The copyright owner does not offer any warranties or representations, nor do
- they accept any liabilities with respect to them.
--%>

<%@page language="java" import="acme.framework.helpers.PrincipalHelper"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:menu-bar code="master.menu.home">
	<acme:menu-left>
	
		<acme:menu-option code="master.menu.anonymous" access="isAnonymous()">
			<%-- <acme:menu-suboption code="master.menu.anonymous.favourite-link" action="http://www.example.com/"/>
			<acme:menu-separator/> --%>
			<acme:menu-suboption code="master.menu.anonymous.list.companyrecord" action="/anonymous/company-record/list"/>
			<acme:menu-suboption code="master.menu.anonymous.top.companyrecord" action="/anonymous/company-record/list-top"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.anonymous.investorRecord.list" action="/anonymous/investor-record/list"/>
			<acme:menu-suboption code="master.menu.anonymous.top.investorRecord" action="/anonymous/investor-record/list-top"/>
			<acme:menu-separator/>
		   <acme:menu-suboption code="master.menu.anonymous.announcements.list" action="/anonymous/announcement/list"/>
		</acme:menu-option>
		
		
		
		<acme:menu-option code="master.menu.authenticated" access="isAuthenticated()">
			<acme:menu-suboption code="master.menu.authenticated.list.companyrecord" action="/authenticated/company-record/list"/>
			<acme:menu-suboption code="master.menu.authenticated.investorRecord.list" action="/authenticated/investor-record/list"/>
			<acme:menu-suboption code="master.menu.authenticated.announcements.list" action="/authenticated/announcement/list"/>
			<acme:menu-suboption code="master.menu.authenticated.challenge.list" action="/authenticated/challenge/list" />
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.authenticated.job.list" action="/authenticated/job/list"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.authenticated.message-thread.list" action="/authenticated/message-thread/list"/>
			<acme:menu-suboption code="master.menu.authenticated.message-thread.create" action="/authenticated/message-thread/create"/>
			
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.employer" access="hasRole('Employer')">
		<acme:menu-suboption code="master.menu.employer.job.list" action="/employer/job/list_mine"/>
		<acme:menu-suboption code="master.menu.employer.jobApplication.list" action="/employer/job-application/list_mine"/>
		<acme:menu-suboption code="master.menu.employer.job.create" action="/employer/job/create"/>
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.worker" access="hasRole('Worker')">
		<acme:menu-suboption code="master.menu.employer.jobApplication.list" action="/worker/job-application/list_mine"/>
		<acme:menu-suboption code="master.menu.employer.job.list" action="/worker/job/list"/>
		</acme:menu-option>
	
        
	<%-- 	<acme:menu-option code="master.menu.administrator.adminDisplay" access="hasRole('Administrator')">

		</acme:menu-option> --%>
    
		<acme:menu-option code="master.menu.administrator" access="hasRole('Administrator')">
			<acme:menu-suboption code="master.menu.administrator.user-accounts" action="/administrator/user-account/list"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.administrator.auditorRequest" action="/administrator/auditor-request/list"/>
			<acme:menu-suboption code="master.menu.administrator.dashboard" action="/administrator/dashboard/list"/>
			<acme:menu-suboption code="master.menu.administrator.dashboardJob" action="/administrator/dashboard-job/display"/>
			<acme:menu-suboption code="master.menu.administrator.dashboardJobApp" action="/administrator/dashboard-jobapp/display"/>
			<acme:menu-suboption code="master.menu.administrator.customParams" action="/administrator/custom-params/show"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.administrator.announcements.list" action="/administrator/announcement/list"/>
			<acme:menu-suboption code="master.menu.administrator.announcements.create" action="/administrator/announcement/create"/>
      		<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.administrator.companyrecord.list" action="/administrator/company-record/list"/>
			<acme:menu-suboption code="master.menu.administrator.companyrecord.create" action="/administrator/company-record/create"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.administrator.investorRecord.list" action="/administrator/investor-record/list"/>
			<acme:menu-suboption code="master.menu.administrator.investorRecord.create" action="/administrator/investor-record/create"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.administrator.challenge.list" action="/administrator/challenge/list"/>
			<acme:menu-suboption code="master.menu.administrator.challenge.create" action="/administrator/challenge/create"/>	
     		<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.administrator.shutdown" action="/master/shutdown"/>
		
		</acme:menu-option>
		
		
		<acme:menu-option code="master.menu.sponsor" access="hasRole('Sponsor')">
			<%-- <acme:menu-suboption code="master.menu.sponsor.favourite-link" action="http://www.example.com/"/> --%>
			<acme:menu-suboption code="master.menu.sponsor.commercialBanner.create" action="/sponsor/commercial-banner/create"/>
			<acme:menu-suboption code="master.menu.sponsor.commercialBanner" action="/sponsor/commercial-banner/list_mine"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.sponsor.nonCommercialBanner.create" action="/sponsor/non-commercial-banner/create"/>
			<acme:menu-suboption code="master.menu.sponsor.nonCommercialBanner" action="/sponsor/non-commercial-banner/list_mine"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.sponsor.creditCard.list" action="/sponsor/credit-card/list" />
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.auditor" access="hasRole('Auditor')">
			
			<acme:menu-suboption code="master.menu.auditor.jobAudited" action="/auditor/job/list_audited"/>
			<acme:menu-suboption code="master.menu.auditor.jobNoAudited" action="/auditor/job/list_no_audited"/>
			<acme:menu-suboption code="master.menu.auditor.auditRecord" action="/auditor/audit-record/list_mine"/>
		</acme:menu-option>
		
	</acme:menu-left>
	
	

	<acme:menu-right>
		<acme:menu-option code="master.menu.sign-up" action="/anonymous/user-account/create" access="isAnonymous()"/>
		<acme:menu-option code="master.menu.sign-in" action="/master/sign-in" access="isAnonymous()"/>

		<acme:menu-option code="master.menu.user-account" access="isAuthenticated()">
			<acme:menu-suboption code="master.menu.user-account.general-data" action="/authenticated/user-account/update"/>
			
			<acme:menu-suboption code="master.menu.user-account.become-employer" action="/authenticated/employer/create" access="!hasRole('Employer')"/>
			<acme:menu-suboption code="master.menu.user-account.employer" action="/authenticated/employer/update" access="hasRole('Employer')"/>
			
			<acme:menu-suboption code="master.menu.user-account.become-worker" action="/authenticated/worker/create" access="!hasRole('Worker')"/>
			<acme:menu-suboption code="master.menu.user-account.worker" action="/authenticated/worker/update" access="hasRole('Worker')"/>
			
			<acme:menu-suboption code="master.menu.user-account.become-auditor" action="/authenticated/auditor-request/create" access="!hasRole('Auditor')"/>
      
      <acme:menu-suboption code="master.menu.user-account.become-sponsor" action="/authenticated/sponsor/create" access="!hasRole('Sponsor')"/>
			<acme:menu-suboption code="master.menu.user-account.sponsor" action="/authenticated/sponsor/update" access="hasRole('Sponsor')"/>

		</acme:menu-option>

		<acme:menu-option code="master.menu.sign-out" action="/master/sign-out" access="isAuthenticated()"/>
	</acme:menu-right>
</acme:menu-bar>




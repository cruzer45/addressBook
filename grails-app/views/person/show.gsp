
<%@ page import="addressBook.Person" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-person" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list person">
			
				<g:if test="${personInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="person.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${personInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="person.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${personInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.picture}">
				<li class="fieldcontain">
					<span id="picture-label" class="property-label"><g:message code="person.picture.label" default="Picture" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.pictureType}">
				<li class="fieldcontain">
					<span id="pictureType-label" class="property-label"><g:message code="person.pictureType.label" default="Picture Type" /></span>
					
						<span class="property-value" aria-labelledby="pictureType-label"><g:fieldValue bean="${personInstance}" field="pictureType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.phones}">
				<li class="fieldcontain">
					<span id="phones-label" class="property-label"><g:message code="person.phones.label" default="Phones" /></span>
					
						<g:each in="${personInstance.phones}" var="p">
						<span class="property-value" aria-labelledby="phones-label"><g:link controller="phone" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.emails}">
				<li class="fieldcontain">
					<span id="emails-label" class="property-label"><g:message code="person.emails.label" default="Emails" /></span>
					
						<g:each in="${personInstance.emails}" var="e">
						<span class="property-value" aria-labelledby="emails-label"><g:link controller="emailAddress" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.addresses}">
				<li class="fieldcontain">
					<span id="addresses-label" class="property-label"><g:message code="person.addresses.label" default="Addresses" /></span>
					
						<g:each in="${personInstance.addresses}" var="a">
						<span class="property-value" aria-labelledby="addresses-label"><g:link controller="address" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.organizations}">
				<li class="fieldcontain">
					<span id="organizations-label" class="property-label"><g:message code="person.organizations.label" default="Organizations" /></span>
					
						<g:each in="${personInstance.organizations}" var="o">
						<span class="property-value" aria-labelledby="organizations-label"><g:link controller="organization" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="person.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${personInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.nickName}">
				<li class="fieldcontain">
					<span id="nickName-label" class="property-label"><g:message code="person.nickName.label" default="Nick Name" /></span>
					
						<span class="property-value" aria-labelledby="nickName-label"><g:fieldValue bean="${personInstance}" field="nickName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="person.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${personInstance?.user?.id}">${personInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${personInstance?.id}" />
					<g:link class="edit" action="edit" id="${personInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

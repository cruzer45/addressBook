<%@ page import="addressBook.Organization" %>



<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="organization.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${addressBook.Person.list()}" optionKey="id" required="" value="${organizationInstance?.person?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="organization.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${organizationInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'company', 'error')} ">
	<label for="company">
		<g:message code="organization.company.label" default="Company" />
		
	</label>
	<g:textField name="company" value="${organizationInstance?.company}"/>
</div>


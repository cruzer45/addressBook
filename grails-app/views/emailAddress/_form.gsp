<%@ page import="addressBook.EmailAddress" %>



<div class="fieldcontain ${hasErrors(bean: emailAddressInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="emailAddress.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${addressBook.Person.list()}" optionKey="id" required="" value="${emailAddressInstance?.person?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emailAddressInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="emailAddress.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${emailAddressInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emailAddressInstance, field: 'emailAddress', 'error')} ">
	<label for="emailAddress">
		<g:message code="emailAddress.emailAddress.label" default="Email Address" />
		
	</label>
	<g:field type="email" name="emailAddress" value="${emailAddressInstance?.emailAddress}"/>
</div>


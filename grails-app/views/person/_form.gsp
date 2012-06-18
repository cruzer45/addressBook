<%@ page import="addressBook.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="person.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${personInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="person.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${personInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'picture', 'error')} ">
	<label for="picture">
		<g:message code="person.picture.label" default="Picture" />
		
	</label>
	<input type="file" id="picture" name="picture" />
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'phones', 'error')} ">
	<label for="phones">
		<g:message code="person.phones.label" default="Phones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.phones?}" var="p">
    <li><g:link controller="phone" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="phone" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'phone.label', default: 'Phone')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'emails', 'error')} ">
	<label for="emails">
		<g:message code="person.emails.label" default="Emails" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.emails?}" var="e">
    <li><g:link controller="emailAddress" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="emailAddress" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'emailAddress.label', default: 'EmailAddress')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'addresses', 'error')} ">
	<label for="addresses">
		<g:message code="person.addresses.label" default="Addresses" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.addresses?}" var="a">
    <li><g:link controller="address" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="address" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'address.label', default: 'Address')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'organizations', 'error')} ">
	<label for="organizations">
		<g:message code="person.organizations.label" default="Organizations" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.organizations?}" var="o">
    <li><g:link controller="organization" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="organization" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'organization.label', default: 'Organization')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="person.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="1500" value="${personInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'nickName', 'error')} ">
	<label for="nickName">
		<g:message code="person.nickName.label" default="Nick Name" />
		
	</label>
	<g:textField name="nickName" value="${personInstance?.nickName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="person.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${addressBook.security.User.list()}" optionKey="id" required="" value="${personInstance?.user?.id}" class="many-to-one"/>
</div>


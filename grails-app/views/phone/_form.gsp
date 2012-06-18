<%@ page import="addressBook.Phone" %>



<div class="fieldcontain ${hasErrors(bean: phoneInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="phone.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${addressBook.Person.list()}" optionKey="id" required="" value="${phoneInstance?.person?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: phoneInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="phone.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${phoneInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: phoneInstance, field: 'number', 'error')} ">
	<label for="number">
		<g:message code="phone.number.label" default="Number" />
		
	</label>
	<g:textField name="number" value="${phoneInstance?.number}"/>
</div>


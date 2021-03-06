
<%@ page import="addressBook.EmailAddress" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'emailAddress.label', default: 'EmailAddress')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-emailAddress" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-emailAddress" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="emailAddress.person.label" default="Person" /></th>
					
						<g:sortableColumn property="title" title="${message(code: 'emailAddress.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="emailAddress" title="${message(code: 'emailAddress.emailAddress.label', default: 'Email Address')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${emailAddressInstanceList}" status="i" var="emailAddressInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${emailAddressInstance.id}">${fieldValue(bean: emailAddressInstance, field: "person")}</g:link></td>
					
						<td>${fieldValue(bean: emailAddressInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: emailAddressInstance, field: "emailAddress")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${emailAddressInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

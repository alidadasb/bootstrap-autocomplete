
<%@ page import="com.dorisoft.autocomplete.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-book" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list book">
			
				<g:if test="${bookInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="book.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${bookInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.pages}">
				<li class="fieldcontain">
					<span id="pages-label" class="property-label"><g:message code="book.pages.label" default="Pages" /></span>
					
						<span class="property-value" aria-labelledby="pages-label"><g:fieldValue bean="${bookInstance}" field="pages"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="book.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${bookInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.published}">
				<li class="fieldcontain">
					<span id="published-label" class="property-label"><g:message code="book.published.label" default="Published" /></span>
					
						<span class="property-value" aria-labelledby="published-label"><g:formatDate date="${bookInstance?.published}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:bookInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bookInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

<%@ page import="com.dorisoft.autocomplete.Book" %>



<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="book.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${bookInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'pages', 'error')} required">
	<label for="pages">
		<g:message code="book.pages.label" default="Pages" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pages" type="number" value="${bookInstance.pages}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="book.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" type="number" value="${bookInstance.price}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'published', 'error')} required">
	<label for="published">
		<g:message code="book.published.label" default="Published" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="published" precision="day"  value="${bookInstance?.published}"  />
</div>


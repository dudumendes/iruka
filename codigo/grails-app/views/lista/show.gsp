
<%@ page import="iruka.Lista" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lista.label', default: 'Lista')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-lista" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-lista" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list lista">
			
				<g:if test="${listaInstance?.atividade}">
				<li class="fieldcontain">
					<span id="atividade-label" class="property-label"><g:message code="lista.atividade.label" default="Atividade" /></span>
					
						<g:each in="${listaInstance.atividade}" var="a">
						<span class="property-value" aria-labelledby="atividade-label"><g:link controller="atividade" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${listaInstance?.data_de_inclusao}">
				<li class="fieldcontain">
					<span id="data_de_inclusao-label" class="property-label"><g:message code="lista.data_de_inclusao.label" default="Datadeinclusao" /></span>
					
						<span class="property-value" aria-labelledby="data_de_inclusao-label"><g:formatDate date="${listaInstance?.data_de_inclusao}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${listaInstance?.nome_Lista}">
				<li class="fieldcontain">
					<span id="nome_Lista-label" class="property-label"><g:message code="lista.nome_Lista.label" default="Nome Lista" /></span>
					
						<span class="property-value" aria-labelledby="nome_Lista-label"><g:fieldValue bean="${listaInstance}" field="nome_Lista"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:listaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${listaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

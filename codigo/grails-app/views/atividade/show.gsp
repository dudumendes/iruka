
<%@ page import="iruka.Atividade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'atividade.label', default: 'Atividade')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-atividade" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-atividade" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list atividade">
			
									
				<g:if test="${atividadeInstance?.nome_da_atividade}">
				<li class="fieldcontain">
					<span id="nome_da_atividade-label" class="property-label"><g:message code="atividade.nome_da_atividade.label" default="Nome da atividade" /></span>
					
						<span class="property-value" aria-labelledby="nome_da_atividade-label"><g:fieldValue bean="${atividadeInstance}" field="nome_da_atividade"/></span>
					
				</li>
				</g:if>

<g:if test="${atividadeInstance?.lista}">
				<li class="fieldcontain">
					<span id="lista-label" class="property-label"><g:message code="atividade.lista.label" default="Lista" /></span>
					
						<span class="property-value" aria-labelledby="lista-label"><g:link controller="lista" action="show" id="${atividadeInstance?.lista?.id}">${atividadeInstance?.lista?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
		
<g:if test="${atividadeInstance?.data_de_inclusao}">
				<li class="fieldcontain">
					<span id="data_de_inclusao-label" class="property-label"><g:message code="atividade.data_de_inclusao.label" default="Data de inclusao" /></span>
					
						<span class="property-value" aria-labelledby="data_de_inclusao-label"><g:formatDate format="dd/MM/yyyy" date="${atividadeInstance.data_de_inclusao}"/></span>
					
				</li>
				</g:if>
			
			
			</ol>
			<g:form url="[resource:atividadeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${atividadeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'voce tem certeza?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

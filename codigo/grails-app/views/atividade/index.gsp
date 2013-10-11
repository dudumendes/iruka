
<%@ page import="iruka.Atividade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'atividade.label', default: 'Atividade')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-atividade" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-atividade" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="data_de_inclusao" title="${message(code: 'atividade.data_de_inclusao.label', default: 'Datadeinclusao')}" />
					
						<th><g:message code="atividade.lista.label" default="Lista" /></th>
					
						<g:sortableColumn property="nome_da_atividade" title="${message(code: 'atividade.nome_da_atividade.label', default: 'Nomedaatividade')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${atividadeInstanceList}" status="i" var="atividadeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${atividadeInstance.id}">${fieldValue(bean: atividadeInstance, field: "data_de_inclusao")}</g:link></td>
					
						<td>${fieldValue(bean: atividadeInstance, field: "lista")}</td>
					
						<td>${fieldValue(bean: atividadeInstance, field: "nome_da_atividade")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${atividadeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

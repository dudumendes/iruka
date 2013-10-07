
<%@ page import="iruka.Lista" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lista.label', default: 'Lista')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-lista" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-lista" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="data_de_inclusao" title="${message(code: 'lista.data_de_inclusao.label', default: 'Datadeinclusao')}" />
					
						<g:sortableColumn property="nome_Lista" title="${message(code: 'lista.nome_Lista.label', default: 'Nome Lista')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${listaInstanceList}" status="i" var="listaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${listaInstance.id}">${fieldValue(bean: listaInstance, field: "data_de_inclusao")}</g:link></td>
					
						<td>${fieldValue(bean: listaInstance, field: "nome_Lista")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${listaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

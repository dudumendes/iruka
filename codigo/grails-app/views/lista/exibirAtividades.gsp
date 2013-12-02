
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
					
								
											<g:sortableColumn property="nome_da_atividade" title="${message(code: 'atividade.nome_da_atividade.label', default: 'Nome da atividade')}" />

<th><g:message code="atividade.lista.label" default="Lista" /></th>
					
	
<g:sortableColumn property="data_de_inclusao" title="${message(code: 'atividade.data_de_inclusao.label', default: 'Data de inclusao')}" />

<g:sortableColumn property="realizada" title="${message(code: 'atividade.realizada.label', default: 'Status')}" />

 								
					</tr>
				</thead>
				<tbody>
				<g:each in="${atividadeInstanceList}" status="i" var="atividadeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: atividadeInstance, field: "nome_da_atividade")}</td>
					
						<td>${fieldValue(bean: atividadeInstance, field: "lista")}</td>
					
						<td><g:formatDate format="dd/MM/yyyy" date="${atividadeInstance.data_de_inclusao}"/>		</td>
<td>
<g:if test="${atividadeInstance.realizada}">
Realizada
</g:if>
<g:else>
Pendente
</g:else>



</td>
					
					</tr>
				</g:each>

				</tbody>
			</table>
<g:link action="" >voltar
</g:link>
			<div class="pagination">
				<g:paginate total="${atividadeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

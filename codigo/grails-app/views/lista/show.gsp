
<%@ pae import="iruka.Lista" %>
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
<g:form url="[resource:listaInstance, action:'atualizarlista']" method="PUT" >

			<h1><g:fieldValue bean="${listaInstance}" field="nome_Lista"/> - <g:formatDate format="dd/MM/yyyy" date="${listaInstance.data_de_inclusao}"/></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list lista">

			
				<g:if test="${listaInstance?.atividade}">
				
:<li class="fieldcontain">
					<span id="atividade-label" class="property-label"><g:message code="lista.atividade.label" default="Atividade" /></span>

${fieldValue(bean: atividadeInstance, field: "nome_da_atividade")}


					
						<g:each in="${listaInstance.atividade}" var="a">
<g:if test="${a.realizada==false}" >
<span class="property-value" aria-labelledby="atividade-label">${a?.encodeAsHTML()}


<g:checkBox name="realizada" value="${a.id}"  checked="${false}"/>
	
</span>
</g:if>		</g:each>

<g:submitButton name="update" value="Atualizar" />
					
				</li>
				</g:if>
			
								
								
<g:hiddenField name="listaInstance.id" value="${listaInstance.id}" />						</g:form>
		</div>
	</body>
</html>

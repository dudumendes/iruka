<%@ page import="iruka.Lista" %>



<div class="fieldcontain ${hasErrors(bean: listaInstance, field: 'atividade', 'error')} ">
	<label for="atividade">
		<g:message code="lista.atividade.label" default="Atividade" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${listaInstance?.atividade?}" var="a">
    <li><g:link controller="atividade" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="atividade" action="create" params="['lista.id': listaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'atividade.label', default: 'Atividade')])}</g:link>
</li>
</ul>

</div>



<div class="fieldcontain ${hasErrors(bean: listaInstance, field: 'nome_Lista', 'error')} ">
	<label for="nome_Lista">
		<g:message code="lista.nome_Lista.label" default="Nome da Lista" />
		
	</label>
	<g:textField name="nome_Lista" value="${listaInstance?.nome_Lista}"/>
</div>



<div class="fieldcontain ${hasErrors(bean: listaInstance, field: 'data_de_inclusao', 'error')} required">
	<label for="data_de_inclusao">
		<g:message code="lista.data_de_inclusao.label" default="Data de inclusao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data_de_inclusao" precision="day"  value="${listaInstance?.data_de_inclusao}"  />
</div>
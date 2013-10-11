<%@ page import="iruka.Atividade" %>



<div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'data_de_inclusao', 'error')} required">
	<label for="data_de_inclusao">
		<g:message code="atividade.data_de_inclusao.label" default="Datadeinclusao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data_de_inclusao" precision="day"  value="${atividadeInstance?.data_de_inclusao}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'lista', 'error')} required">
	<label for="lista">
		<g:message code="atividade.lista.label" default="Lista" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lista" name="lista.id" from="${iruka.Lista.list()}" optionKey="id" required="" value="${atividadeInstance?.lista?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'nome_da_atividade', 'error')} ">
	<label for="nome_da_atividade">
		<g:message code="atividade.nome_da_atividade.label" default="Nomedaatividade" />
		
	</label>
	<g:textField name="nome_da_atividade" value="${atividadeInstance?.nome_da_atividade}"/>
</div>


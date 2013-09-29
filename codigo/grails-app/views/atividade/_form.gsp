<%@ page import="iruka.Atividade" %>





<div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'nome_da_atividade', 'error')} ">
	<label for="nome_da_atividade">
		<g:message code="atividade.nome_da_atividade.label" default="Nome da atividade" />
		
	</label>
	<g:textField name="nome_da_atividade" value="${atividadeInstance?.nome_da_atividade}"/>
</div>



<div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'data_de_inclusao', 'error')} required">
	<label for="data_de_inclusao">
		<g:message code="atividade.data_de_inclusao.label" default="Data de inclusao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data_de_inclusao" precision="day"  value="${atividadeInstance?.data_de_inclusao}"  />
</div>
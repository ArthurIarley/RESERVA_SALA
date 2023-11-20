<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Solicitacao</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="container py-5">
		<h1 class="display-5 fw-bold">Editar Solicitaçao</h1>
		<p class="col-md-12 fs-4">Preencha o formulário abaixo para
			realizar a alteração do solicitcao no sistema.</p>
	</div>
</div>

<main>
	<div class="container">
		<form action="altera" method="POST" class="row g-3">

			<security:csrfInput />

			<!-- ID -->
			<input type="hidden" name="id" value="${solicitacao.id}" required>

			<!-- Recorrencia -->
				<div class="form-group">
				<label for="recorrencia" class="form-label obrigatorio mt-4">Recorrencia</label>
				<select class="form-select" name="recorrencia" id="recorrencia"
					required>
					<option>Evento unico</option>
					<option>Diariamente</option>
					<option>Semanalmente</option>
					<option>Quinzenalmente</option>
				</select>
			</div>>	
					
			<!-- Horario de inicio -->
			<div class="form-group">
				<label for="horario_de_inicio" class="col-form-label obrigatorio">Horario de inicio</label>
				<input type="time" class="form-control" name="horario_de_inicio" autofocus
					MAXLENGTH="255" required value="${solicitacao.horario}">
			</div>

			<!-- Data inicio -->
			<div class="form-group">
				<label for="data_inicio" class="col-form-labe">data inicio</label> <input
					type="date" class="form-control" name="data_inicio" autofocus
					MAXLENGTH="255" required value="${solicitacao.data}">
			</div>

			<!-- Horario de fim -->
			<div class="form-group">
				<label for="horario_de_fim" class="col-form-label obrigatorio">Horario de fim</label>
				<input type="time" class="form-control" name="horario_de_fim" autofocus
					MAXLENGTH="255" required value="${solicitacao.horario}">
			</div>
			<!-- Data fim -->
			<div class="form-group">
				<label for="data_fim" class="col-form-labe">data fim</label> <input
					type="date" class="form-control" name="data_fim" autofocus
					MAXLENGTH="255" required value="${solicitacao.data}">
			</div>
			    <div class="form-group">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="status"
						name="status" ${solicitcao.status eq true ? 'checked' : '' }> <label
						class="form-check-label" for="status"> Status </label>
				</div>
			</div>
			
			<!-- Justificativa -->
			<div class="form-group">
				<label for="justificativa" class="col-form-labe">Justificativa</label> <input
					type="text" class="form-control" name="justificativa" autofocus
					MAXLENGTH="255" required value="${solicitacao.justificativa}">
			</div>

			<div class="text-center">
				<button type="submit" class="btn btn-primary btn-lg">
					<i class="bi bi-arrow-clockwise"></i> Atualizar
				</button>
				<a href="<c:url value="/solicitacao/lista" />"
					class="btn btn-secondary btn-lg"> <i class="bi bi-x"></i>
					Cancelar
				</a>
			</div>

		</form>
	</div>
</main>

<c:import url="../componentes/rodape.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Solicitacao</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="container py-5">
		<h1 class="display-5 fw-bold">Cadastrar Solicitaçao</h1>
		<p class="col-md-12 fs-4">Preencha o formulário abaixo para
			realizar o cadastro da solicitacao no sistema.</p>
	</div>
</div>

<main>
	<div class="container">
		<form action="adiciona" method="POST" class="row g-3">

			<security:csrfInput />

			<div class="form-group">
				<label for="recorrencia" class="form-label obrigatorio mt-4">Recorrencia</label>
				<select class="form-select" name="recorrencia" id="recorrencia"
					required>
					<option>Evento unico</option>
					<option>Diariamente</option>
					<option>Semanalmente</option>
					<option>Quinzenalmente</option>
				</select>
			</div>

			<!-- Horario de inicio -->
			<div class="form-group">
				<label for="horario_inicio" class="col-form-label obrigatorio">Horario
					de inicio</label> <input type="time" class="form-control"
					name="horario_de_inicio" MAXLENGTH="255" required />
			</div>

			<!-- data inicio -->
			<div class="form-group">
				<label for="data_inicio" class="col-form-label obrigatorio">Data
					inicio</label> <input type="date" class="form-control" name="data_inicio"
					MAXLENGTH="255" required>
			</div>

			<!-- Horario de fim -->
			<div class="form-group">
				<label for="horario_fim" class="col-form-label obrigatorio">Horario
					de fim</label> <input type="time" class="form-control"
					name="horario_de_fim" MAXLENGTH="255" required>
			</div>

			<!-- data fim -->
			<div class="form-group">
				<label for="data_fim" class="col-form-label obrigatorio">Data
					fim</label> <input type="date" class="form-control" name="data_fim"
					MAXLENGTH="255" required>
			</div>

			<!-- Justificativa -->
			<div class="form-group">
				<label for="justificativa" class="col-form-label obrigatorio">Justificativa</label>
				<textarea class="form-control" name="justificativa" rows="3"></textarea>
			</div>

			<input type="hidden" name="status" value="Solicitado" />

			<div class="form-group">
				<label for="sala.id" class="form-label obrigatorio mt-4">Sala</label>
				<select class="form-select" name="sala.id"
					id="sala.id" required>
					<c:forEach var="sala" items="${salas}">
						<option value="${sala.id}">${sala.nome}</option>
					</c:forEach>
				</select>
			</div>

			<div class="text-center">
				<button type="submit" class="btn btn-primary btn-lg">
					<i class="bi bi-plus-circle"></i> Cadastrar
				</button>
				<button type="reset" class="btn btn-secondary btn-lg">
					<i class="bi bi-trash"></i> Limpar
				</button>
			</div>

		</form>
	</div>
</main>

<c:import url="../componentes/rodape.jsp" />
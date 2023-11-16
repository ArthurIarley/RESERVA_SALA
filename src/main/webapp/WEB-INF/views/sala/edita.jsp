<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Sala</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="container py-5">
		<h1 class="display-5 fw-bold">Editar Sala</h1>
		<p class="col-md-12 fs-4">Preencha o formulário abaixo para
			realizar a alteração da sala no sistema.</p>
	</div>
</div>

<main>
	<div class="container">
		<form action="altera" method="POST" class="row g-3">

			<security:csrfInput />

			<!-- ID -->
			<input type="hidden" name="id" value="${sala.id}" required>

			<!-- NOME -->
			<div class="form-group">
				<label for="nome" class="col-form-label obrigatorio">Nome</label> <input
					type="text" class="form-control" name="nome" autofocus
					MAXLENGTH="255" required value="${sala.nome}">
			</div>



			<div class="form-group">
				<label for="responsavel.id" class="form-label obrigatorio mt-4">Responsável</label>
				<select class="form-select" name="responsavel.id"
					id="responsavel.id" required>
					<c:forEach var="servidor" items="${servidores}">
						<option value="${servidor.id}" ${sala.responsavel.id eq servidor.id ? 'selected' : '' }>${servidor.matricula}-
							${servidor.nome}</option>
					</c:forEach>
				</select>
			</div>

			<div class="form-group">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="status"
						name="status" ${sala.status eq true ? 'checked' : '' }> <label
						class="form-check-label" for="status"> Status </label>
				</div>
			</div>

			<div class="text-center">
				<button type="submit" class="btn btn-primary btn-lg">
					<i class="bi bi-arrow-clockwise"></i> Atualizar
				</button>
				<a href="<c:url value="/sala/lista" />"
					class="btn btn-secondary btn-lg"> <i class="bi bi-x"></i>
					Cancelar
				</a>
			</div>

		</form>
	</div>
</main>

<c:import url="../componentes/rodape.jsp" />
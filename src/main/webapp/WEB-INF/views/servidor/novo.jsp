<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Servidor</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="container py-5">
		<h1 class="display-5 fw-bold">Cadastrar Servidor</h1>
		<p class="col-md-12 fs-4">Preencha o formulário abaixo para
			realizar o cadastro do servidor no sistema.</p>
	</div>
</div>

<main>
	<div class="container">
		<form action="adiciona" method="POST" class="row g-3">

			<security:csrfInput />

			<!-- NOME -->
			<div class="form-group">
				<label for="nome" class="col-form-label obrigatorio">Nome</label> <input
					type="text" class="form-control" name="nome" autofocus
					MAXLENGTH="255" required>
			</div>

			<!-- EMAIL -->
			<div class="form-group">
				<label for="email" class="col-form-label obrigatorio">Email</label>
				<input type="text" class="form-control" name="email" MAXLENGTH="255"
					required>
			</div>

			<!-- TELEFONE -->
			<div class="form-group">
				<label for="telefone" class="col-form-label">Telefone</label> <input
					type="text" class="form-control" name="telefone" MAXLENGTH="255">
			</div>

			<!-- MATRICULA -->
			<div class="form-group">
				<label for="matricula" class="col-form-label obrigatorio">Matricula</label>
				<input type="text" class="form-control" name="matricula"
					MAXLENGTH="255" required>
			</div>
			
			<div class="form-group">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="status"
						name="status" checked="checked"> <label class="form-check-label"
						for="status"> Status </label>
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
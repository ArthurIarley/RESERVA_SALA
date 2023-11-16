<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Exibe os dados do sala</title>
<c:import url="../componentes/cabecalho.jsp" />

<main>
	<div class="container">
		<div class="card border-light mb-3">
			<div class="card-header">Exibe os dados do sala</div>
			<!-- Table -->
			<div class="card-body">
				<div class="table-responsive">
					<table
						class="table table-striped table-bordered dt-responsive nowrap">
						<tr>
							<th width="30%">ID</th>
							<td>${sala.id}</td>
						</tr>
						<tr>
							<th>Nome</th>
							<td style="font-weight: bold; color: white;">${sala.nome}</td>
						</tr>
						<tr>
					
							<th>Responsavel</th>
							<td>${sala.responsavel.nome}</td>
						</tr>
						
						<tr>
					
							<th>Status</th>
							<td>${sala.status eq true ? 'Ativo' : 'Inativo'}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div align="center">
			<!-- Cadastrar -->
			<a href="<c:url value="/sala/novo" />"
				class="btn btn-primary btn-lg"><i class="bi bi-plus-circle"></i>
				Cadastrar</a>
			<!-- Editar -->
			<a href="<c:url value="/sala/edita?id=${sala.id}" />"
				class="btn btn-warning btn-lg"><i class="bi bi-pencil-square"></i>
				Editar </a>
			<!-- Excluir -->
			<button type="button" class="btn btn-danger btn-lg"
				data-bs-toggle="modal" data-bs-target="#modal${sala.id}">
				<i class="bi bi-trash"></i>
				Excluir
			</button>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="modal${sala.id}" tabindex="-1">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Exclusão da sala</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<p>
							Deseja realmente excluir o Sala <br>ID (${sala.id}) ->
							${sala.nome}?
						</p>
					</div>
					<div class="modal-footer">
						<a href="<c:url value="/sala/remove?id=${sala.id}" />"
							class="btn btn-danger"> <i class="bi bi-trash"></i> Excluir
						</a>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">
							<i class="bi bi-x"></i>
							Fechar
						</button>
					</div>
				</div>
			</div>
		</div>
		<button class="btn btn-success" onclick="window.history.back()">
			<i class="bi bi-chevron-left"></i>
			Voltar
		</button>
	</div>
</main>
<c:import url="../componentes/rodape.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Sala</title>

<c:import url="../componentes/cabecalho.jsp" />
<main>
	<div class="container">

		<div class="card border-light mb-3">
			<div class="card-header">Listagem de Salas</div>

			<!-- Table -->
			<div class="card-body">
				<table class="table datatable" id="datatable">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Nome</th>
							<th scope="col">Responsável</th>
							<th scope="col">Status</th>
							<th scope="col">Ações</th>
						</tr>
					</thead>
					<tbody>
						<!-- percorre salas montando as linhas da tabela -->
						<c:forEach var="sala" items="${salas}">
							<tr>
								<td scope="row">${sala.id}</td>
								<td>${sala.nome}</td>
								<td>${sala.responsavel.nome}</td>
								<td>${sala.status eq true ? 'Ativo' : 'Inativo'}</td>
								<td>
									<!-- Exibir --> <a
									href="<c:url value="/sala/exibe?id=${sala.id}"/>"
									class="btn btn-info btn-sm" data-toggle="tooltip"
									data-bs-placement="bottom" title="Exibir"> <i
											class="bi bi-eye"></i>
								</a> <!-- Editar --> <a
									href="<c:url value="/sala/edita?id=${sala.id}" />"
									class="btn btn-warning btn-sm" data-toggle="tooltip"
									data-bs-placement="bottom" title="Editar"> <i
											class="bi bi-pencil-square"></i>
								</a> <!-- Excluir -->
									<button type="button" class="btn btn-danger btn-sm"
										data-toggle="tooltip" data-bs-placement="bottom"
										title="Excluir" data-bs-toggle="modal"
										data-bs-target="#modal${sala.id}">
										<i class="bi bi-trash"></i>
									</button>
									<div class="modal fade" id="modal${sala.id}" tabindex="-1">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Exclusão do sala</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close">
														<span aria-hidden="true"></span>
													</button>
												</div>
												<div class="modal-body">
													<p>
														Deseja realmente excluir o if <br>ID (${sala.id})
														-> ${sala.nome}?
													</p>
												</div>
												<div class="modal-footer">
													<a href="<c:url value="/sala/remove?id=${sala.id}" />"
														class="btn btn-danger"> <i class="bi bi-trash"></i>
														Excluir
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
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<div align="center">
			<a href="<c:url value="/sala/novo" />"
				class="btn btn-primary btn-lg"> <i class="bi bi-plus-circle"></i>
				Cadastrar
			</a>
		</div>
	</div>
</main>
<c:import url="../componentes/rodape.jsp" />
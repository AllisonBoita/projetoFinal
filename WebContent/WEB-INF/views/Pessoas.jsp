<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<title>Pessoas</title>
</head>
<body>

	<h1 class="font-weight-bold"
		style="margin-left: 320px; color: #120A8F; font: verdana">Drogaria
		Santa Catarina - Cadastro de Clientes</h1>


	<div
		style="position: relative; display: inline-block; width: 60%; margin-bottom: 40px; margin-left: 20%; margin-top: 40px; border-collapse: collapse;">
		<table class="table table-bordered bg-info">
			<tr>
				<th>Nome</th>
				<th>Email</th>
				<th>Telefone</th>
				<th>Data</th>

				<c:forEach var="p" items="${listPessoas}">
					<tr>
						<td>${p.nome}</td>
						<td>${p.email}</td>
						<td>${p.telefone}</td>
						<td><fmt:formatDate pattern="dd/MM/yyyy"
								value="${p.dataNasc}" /></td>
						<td><a href="pessoaDetail/${p.id}" style="color: red;">Edit</a></td>
						<td><a href="pessoaDelete/${p.id}" style="color: red;">Delete</a></td>
					</tr>
				</c:forEach>
		</table>
	</div>

	<div
		style="position: relative; display: inline-block; width: 50%; margin-bottom: 40px; margin-left: 15%; border-collapse: collapse;">
		<!--  Percebam que aqui no action eu to passando qual a página que elevai mandar os dados depois que eu clicar no botao -->
		<form action="pessoaSave" method="POST" modelAttribute="pessoa">

			<div class="form-row" style="margin-left: 73px;">
				<div class="col-3">
					<label for="descricao">Nome</label>
					<form:input path="pessoa.nome" class="form-control" />
				</div>
				<div class="col-4">
					<label for="preco">Email</label>
					<form:input path="pessoa.email" class="form-control" />
				</div>
				<div class="col-3">
					<label for="quantidade">Telefone</label>
					<form:input path="pessoa.telefone" class="form-control" />
				</div>
				<div class="col-2">
					<label for="fabricante">Data </label>
					<form:input path="pessoa.dataNasc" class="form-control" />
				</div>
			</div>


			<button class="btn btn-primary col-2" type="submit" value="Adicionar"
				style="margin-left: 780px; margin-top: -67px;">Cadastrar</button>

		</form>
	</div>

	<a href="/ProjetoFinal/">
		<button type="button" class="btn btn-primary"
			style="margin-left: 1160px; margin-top: -195px;">Voltar</button>
	</a>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>

</body>

</html>
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

<title>Produtos</title>
</head>
<body>

	<h1 class="font-weight-bold"
		style="margin-left: 320px; color: #120A8F; font: verdana">Drogaria
		Santa Catarina - Cadastro de Produtos</h1>

	<div
		style="position: relative; display: inline-block; width: 60%; margin-bottom: 40px; margin-left: 20%; margin-top: 40px; border-collapse: collapse;">
		<table class="table table-bordered bg-info">
			<tr>
				<th>Descrição</th>
				<th>Preço</th>
				<th>Quantidade</th>
				<th>Fabricante</th>

			</tr>
			<c:forEach var="z" items="${listProdutos}">
				<tr>
					<td>${z.descricao}</td>
					<td>${z.preco}</td>
					<td>${z.quantidade}</td>
					<td>${z.fabricante}</td>
					<td><a href="produtoDetail/${z.id}" style="color: red;">Edit</a></td>
					<td><a href="produtoDelete/${z.id}" style="color: red;">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div
		style="position: relative; display: inline-block; width: 50%; margin-bottom: 40px; margin-left: 15%; border-collapse: collapse;">
		<!--  Percebam que aqui no action eu to passando qual a página que elevai mandar os dados depois que eu clicar no botao -->
		<form action="produtoSave" method="POST" modelAttribute="produto">

			<form>
				<div class="form-row" style="margin-left: 72px;">
					<div class="col-7">
						<label for="descricao">Descricao</label>
						<form:input path="produto.descricao" class="form-control" />
					</div>
					<div class="col">
						<label for="preco">Preço</label>
						<form:input path="produto.preco" class="form-control" />
					</div>
					<div class="col">
						<label for="quantidade">Quantidade</label>
						<form:input path="produto.quantidade" class="form-control" />
					</div>
					<div class="col">
						<label for="fabricante">Fabricante</label>
						<form:input path="produto.fabricante" class="form-control"
							style="widht: 43px;" />
					</div>
				</div>


				<button type="submitbutton" class="btn btn-primary"
					value="Adicionar" style="margin-left: 800px; margin-top: -67px;">Cadastrar</button>

			</form>
	</div>
	<a href="/ProjetoFinal/">
		<button type="button" class="btn btn-primary"
			style="margin-left: 1140px; margin-top: -194px;">Voltar</button>
	</a>




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
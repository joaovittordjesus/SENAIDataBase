<?php
// Inclui o arquivo 'functions.php', que contém funções PHP reutilizáveis.
include 'functions.php';

// Estabelece uma conexão com o banco de dados PostgreSQL.
$pdo = pdo_connect_pgsql();

// Define a variável $pagina como o valor da query string 'pagina' se estiver definida, caso contrário, define como 1.
$pagina = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;

// Define o limite de registros por página.
$limite = 10;

// Calcula o offset com base na página atual e no limite de registros por página.
$offset = ($pagina - 1) * $limite;

// Consulta o número total de carros no banco de dados e armazena na variável $total_carros_alugados.
$total_carros_alugados = $pdo->query('SELECT COUNT(*) FROM carro WHERE disponibilidade = \'INDISPONIVEL\'')->fetchColumn();

// Calcula o número total de páginas com base no total de carros e no limite de registros por página.
$total_paginas = ceil($total_carros_alugados / $limite);

// Prepara e executa uma consulta SQL para selecionar os carros com ordenação por ano, limitando o resultado e definindo um offset.
//$stmt = $pdo->prepare('SELECT * FROM carro ORDER BY ano DESC LIMIT :limite OFFSET :offset');
$stmt = $pdo->prepare ('SELECT * FROM CARRO WHERE disponibilidade = \'INDISPONIVEL\' ORDER BY ano DESC LIMIT :limite OFFSET :offset');
$stmt->bindValue(':limite', $limite, PDO::PARAM_INT);
$stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
$stmt->execute();

// Armazena os resultados da consulta em um array associativo na variável $carros.
$carros = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<?= template_header('Visualizar') ?>

<div class="content read">
    <h2>Carros Indisponíveis</h2>
    <table>
        <thead>
            <tr>
                <td>#</td>
                <td>Número da Agência</td>
                <td>Placa</td>
                <td>Modelo</td>
                <td>Ano</td>
                <td>Tipo</td>
                <td>Disponibilidade</td>
                <td>Valor Total Aluguel Hora</td>
                <td></td>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($carros as $carro) : ?>
                <tr>
                    <td><?= $carro['id_carro'] ?></td>
                    <td><?= $carro['numero_agencia'] ?></td>
                    <td><?= $carro['placa'] ?></td>
                    <td><?= $carro['modelo'] ?></td>
                    <td><?= $carro['ano'] ?></td>
                    <td><?= $carro['tipo'] ?></td>
                    <td><?= $carro['disponibilidade'] ?></td>
                    <td><?= $carro['valor_total'] ?></td>
                    <td class="actions">
                        <!-- Botão para deletar o carro -->
                        <a href="delete.php?id=<?= $carro['id_carro'] ?>" class="delete">Deletar</a>
                        <!-- Botão para atualizar o carro -->
                        <a href="update.php?id=<?= $carro['id_carro'] ?>" class="update">Atualizar</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <div class="pagination">
        <?php for ($i = 1; $i <= $total_paginas; $i++) : ?>
            <a href="read.php?pagina=<?= $i ?>"><?= $i ?></a>
        <?php endfor; ?>
    </div>
</div>

<?= template_footer() ?>
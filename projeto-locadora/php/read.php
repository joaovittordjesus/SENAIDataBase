<?php
// Inclui o arquivo 'functions.php', que contém funções PHP reutilizáveis.
include 'functions.php';

// Estabelece uma conexão com o banco de dados PostgreSQL.
$pdo = pdo_connect_pgsql();

// Define os filtros padrão como vazio ou não definido.
$numero_agencia = '';
$placa = '';
$modelo = '';
$ano = '';
$tipo = '';

// Verifica se o formulário de filtro foi submetido.
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtém os dados do formulário de filtro, se definidos.
    $numero_agencia = isset($_POST['numero_agencia']) ? $_POST['numero_agencia'] : '';
    $placa = isset($_POST['placa']) ? $_POST['placa'] : '';
    $modelo = isset($_POST['modelo']) ? $_POST['modelo'] : '';
    $ano = isset($_POST['ano']) ? $_POST['ano'] : '';
    $tipo = isset($_POST['tipo']) ? $_POST['tipo'] : '';

    // Prepara a query SQL base com filtros opcionais.
    $sql = 'SELECT * FROM carro WHERE disponibilidade = \'DISPONIVEL\'';

    if (!empty($numero_agencia)) {
        $sql .= " AND numero_agencia = '$numero_agencia'";
    }
    if (!empty($placa)) {
        $sql .= " AND placa LIKE '%$placa%'";
    }
    if (!empty($modelo)) {
        $sql .= " AND modelo LIKE '%$modelo%'";
    }
    if (!empty($ano)) {
        $sql .= " AND ano = '$ano'";
    }
    if (!empty($tipo)) {
        $sql .= " AND tipo = '$tipo'";
    }

    // Prepara e executa a consulta SQL com os filtros.
    $stmt = $pdo->query($sql);
    $carros = $stmt->fetchAll(PDO::FETCH_ASSOC);
} else {
    // Consulta padrão sem filtros aplicados.
    $stmt = $pdo->query('SELECT * FROM carro WHERE disponibilidade = \'DISPONIVEL\' ORDER BY ano DESC');
    $carros = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>

<?= template_header('Visualizar') ?>

<div class="content read">
    <h2>Carros Disponíveis</h2>

    <!-- Formulário para filtros -->
    <form method="post" action="read.php">
        <label for="numero_agencia">Número da Agência:</label>
        <input type="text" name="numero_agencia" id="numero_agencia" value="<?= htmlspecialchars($numero_agencia) ?>"><br>

        <label for="placa">Placa:</label>
        <input type="text" name="placa" id="placa" value="<?= htmlspecialchars($placa) ?>"><br>

        <label for="modelo">Modelo:</label>
        <input type="text" name="modelo" id="modelo" value="<?= htmlspecialchars($modelo) ?>"><br>

        <label for="ano">Ano:</label>
        <input type="text" name="ano" id="ano" value="<?= htmlspecialchars($ano) ?>"><br>

        <label for="tipo">Tipo:</label>
        <input type="text" name="tipo" id="tipo" value="<?= htmlspecialchars($tipo) ?>"><br>

        <input type="submit" value="Filtrar">
    </form>

    <!-- Tabela de carros -->
    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Número da Agência</th>
                <th>Placa</th>
                <th>Modelo</th>
                <th>Ano</th>
                <th>Tipo</th>
                <th>Disponibilidade</th>
                <th>Valor Total Aluguel Hora</th>
                <th></th>
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
</div>

<?= template_footer() ?>

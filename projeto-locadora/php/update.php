<?php
// Inclui o arquivo de funções
include 'functions.php';

// Conecta ao banco de dados PostgreSQL
$pdo = pdo_connect_pgsql();

// Define uma variável para mensagem de feedback
$msg = '';

// Verifica se foi passado um ID válido na URL
if (isset($_GET['id'])) {
    // Verifica se o formulário foi submetido
    if (!empty($_POST)) {
        // Obtém os dados do formulário
        $numero_agencia = isset($_POST['numero_agencia']) ? $_POST['numero_agencia'] : NULL;
        $placa = isset($_POST['placa']) ? $_POST['placa'] : '';
        $modelo = isset($_POST['modelo']) ? $_POST['modelo'] : '';
        $ano = isset($_POST['ano']) ? $_POST['ano'] : '';
        $tipo = isset($_POST['tipo']) ? $_POST['tipo'] : '';
        $disponibilidade = isset($_POST['disponibilidade']) ? $_POST['disponibilidade'] : 'DISPONIVEL';
        $valor_total = isset($_POST['valor_total']) ? $_POST['valor_total'] : '';

        // Prepara e executa a consulta SQL para atualizar o carro
        $stmt = $pdo->prepare('UPDATE carro SET numero_agencia = ?, placa = ?, modelo = ?, ano = ?, tipo = ?, disponibilidade = ?, valor_total = ? WHERE id_carro = ?');
        $stmt->execute([$numero_agencia, $placa, $modelo, $ano, $tipo, $disponibilidade, $valor_total, $_GET['id']]);

        // Define a mensagem de sucesso
        $msg = 'Atualização Realizada com Sucesso!';
    }

    // Prepara e executa a consulta SQL para selecionar o carro com base no ID
    $stmt = $pdo->prepare('SELECT * FROM carro WHERE id_carro = ?');
    $stmt->execute([$_GET['id']]);

    // Obtém os detalhes do carro
    $carro = $stmt->fetch(PDO::FETCH_ASSOC);

    // Verifica se o carro foi encontrado
    if (!$carro) {
        exit('Carro Não Localizado!');
    }
} else {
    exit('Nenhum Carro Especificado!');
}
?>

<?= template_header('PROJETO LOCADORA - Atualizar') ?>

<div class="content update">
    <h2>Atualizar Carro</h2>
    <form action="update.php?id=<?= $carro['id_carro'] ?>" method="post">
        <label for="numero_agencia">Número da Agência</label>
        <br>
        <input type="text" name="numero_agencia" placeholder="1,..3,4" value="<?= $carro['numero_agencia'] ?>" id="numero_agencia">
        <br>

        <label for="placa">Placa do Carro</label>
        <br>
        <input type="text" name="placa" placeholder="GHI9012" value="<?= $carro['placa'] ?>" id="placa">
        <br>

        <label for="modelo">Modelo do Carro</label>
        <br>
        <input type="text" name="modelo" placeholder="Modelo do Carro" value="<?= $carro['modelo'] ?>" id="modelo">
        <br>

        <label for="ano">Ano do Carro</label>
        <br>
        <input type="date" name="ano" value="<?= $carro['ano'] ?>" id="ano">
        <br>

        <label for="tipo">Tipo do Carro</label>
        <br>
        <input type="text" name="tipo" placeholder="C, A, B" value="<?= $carro['tipo'] ?>" id="tipo">
        <br>

        <label for="disponibilidade">Disponibilidade</label>
        <br>
        <input type="text" name="disponibilidade" value="<?= $carro['disponibilidade'] ?>" id="disponibilidade">
        <br>

        <label for="valor_total">Valor Total Aluguel Hora</label>
        <br>
        <input type="decimal" name="valor_total" placeholder="Valor Total" value="<?= $carro['valor_total'] ?>" id="valor_total">
        <br>

        <input type="submit" value="Atualizar">
        <br>
    </form>
    <?php if ($msg): ?>
        <p><?= $msg ?></p>
    <?php endif; ?>
</div>

<?= template_footer() ?>

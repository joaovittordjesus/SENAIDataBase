<?php
// Inclui o arquivo 'functions.php', que contém funções PHP reutilizáveis.
include 'functions.php';

// Estabelece uma conexão com o banco de dados PostgreSQL.
$pdo = pdo_connect_pgsql();

// Inicializa a variável $msg como uma string vazia.
$msg = '';

// Verifica se o formulário foi submetido (se o array $_POST não está vazio).
if (!empty($_POST)) {
    // Obtém os dados do formulário, atribuindo valores padrão se não estiverem definidos.
    $numero_agencia = isset($_POST['numero_agencia']) ? $_POST['numero_agencia'] : NULL;
    $placa = isset($_POST['placa']) ? $_POST['placa'] : '';
    $modelo = isset($_POST['modelo']) ? $_POST['modelo'] : '';
    $ano = isset($_POST['ano']) ? $_POST['ano'] : '';
    $tipo = isset($_POST['tipo']) ? $_POST['tipo'] : '';
    $disponibilidade = isset($_POST['disponibilidade']) ? $_POST['disponibilidade'] : 'DISPONIVEL';
    $valor_total = isset($_POST['valor_total']) ? $_POST['valor_total'] : '';

    // Prepara e executa uma consulta SQL para inserir um novo registro na tabela 'carro'.
    $stmt = $pdo->prepare('INSERT INTO carro (numero_agencia, placa, modelo, ano, tipo, disponibilidade, valor_total) VALUES (?, ?, ?, ?, ?, ?, ?)');
    $stmt->execute([$numero_agencia, $placa, $modelo, $ano, $tipo, $disponibilidade, $valor_total]);

    // Define a mensagem de sucesso.
    $msg = 'Cadastro do carro realizado com sucesso';
}
?>

<?= template_header('PROJETO LOCADORA - Cadastrar Carro') ?>

<div class="content update">
    <h2>Realizar Cadastro de Carro</h2>
    <form action="create.php" method="post">
        <!-- Campos do formulário para inserir os dados do carro -->
        <label for="numero_agencia">Número da Agência</label>
        <br>
        <input type="text" name="numero_agencia" placeholder="1, 2, 3..., 44" id="numero_agencia">
        <br>

        <label for="placa">Placa do Carro</label>
        <br>
        <input type="text" name="placa" placeholder="GHI9012" id="placa">
        <br>

        <label for="modelo">Modelo do Carro</label>
        <br>
        <input type="text" name="modelo" placeholder="Modelo do Carro" id="modelo">
        <br>

        <label for="ano">Ano do Carro</label>
        <br>
        <input type="date" name="ano" placeholder="XXXX" id="ano">
        <br>

        <label for="tipo">Tipo do Carro</label>
        <br>
        <input type="text" name="tipo" placeholder="C, A, B" id="tipo">
        <br>

        <label for="valor_total">Valor Total Aluguel Hora</label>
        <br>
        <input type="decimal" name="valor_total" placeholder="Valor Total" id="valor_total">
        <br>

        <!-- Botão para submeter o formulário -->
        <input type="submit" value="Cadastrar">
        <br>
    </form>
    <!-- Exibe a mensagem de sucesso após o cadastro do carro -->
    <?php if ($msg): ?>
        <p><?= $msg ?></p>
    <?php endif; ?>
</div>

<?= template_footer() ?>

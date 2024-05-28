<?php
// Inclui o arquivo de funções que contém a função pdo_connect_pgsql() e template_header() e template_footer()
include 'functions.php';
// Conecta ao banco de dados PostgreSQL usando a função pdo_connect_pgsql() e armazena a conexão em $pdo
$pdo = pdo_connect_pgsql();
// Inicializa a variável $msg como uma string vazia
$msg = '';

// Verifica se o formulário foi submetido
if (!empty($_POST)) {
    // Obtém os dados do formulário ou define como NULL se não estiverem definidos
    $id_cliente = isset($_POST['id_cliente']) ? $_POST['id_cliente'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $celular = isset($_POST['celular']) ? $_POST['celular'] : 'celular';
    
    

    // Prepara a consulta SQL para inserir um novo pedido na tabela "pedidos"
    $stmt = $pdo->prepare('INSERT INTO pedidos (numero_agencia, data_devolucao, data_locacao, email, id_pagamento) VALUES (?, ?, ?, ?, ?, ?)');
    // Executa a consulta preparada, inserindo os valores dos campos do formulário na tabela
    $stmt->execute([$id_locacao, $id_cliente, $numero_agencia, $data_devolucao, $data_locacao, $email, $id_pagamento]);

    // Define a mensagem de sucesso para exibição após a submissão do formulário
    $msg = 'Locação Realizado com Sucesso!';
}
?>

<?= template_header('Locadora AutoMaster - Realizar Locação') ?>

<div class="content update">
    <h2>Realizar Locação de Carro</h2>
    <!-- Formulário locar um carro -->
    <form action="create.php" method="post">
        <!-- Campo para inserir o nome do cliente -->
        <input type="text" name="id_cliente" placeholder="Nome do Cliente" id="id_cliente">
        <!-- Campo para inserir o numero_agencia do cliente -->
        <label for="numero_agencia">n</label>
        <input type="text" name="numero_agencia" placeholder="seuemail@seuprovedor.com.br" id="numero_agencia">
        <!-- Campo para inserir o data_devolucao do cliente -->
        <input type="text" name="data_devolucao" placeholder="(XX) X.XXXX-XXXX" id="data_devolucao">
        <!-- Campo para inserir o modelo do carro -->
        <label for="data_locacao">Data Locação</label>
        <input type="text" name="data_locacao" placeholder="Data Locação" id="data_locacao">
        <!-- Campo para inserir a data e hora do aluguel do carro -->
        <label for="email">Data do Aluguel</label>
        <input type="datetime-local" name="email" value="<?= date('Y-m-d\TH:i') ?>" id="email">
        <!-- Botão de envio do formulário -->
        <input type="submit" value="Fazer Locação">
    </form>
    <!-- Exibe a mensagem de sucesso após a submissão do formulário -->
    <?php if ($msg) : ?>
        <p><?= $msg ?></p>
    <?php endif; ?>
</div>

<?= template_footer() ?>

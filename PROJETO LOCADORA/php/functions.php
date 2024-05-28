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
    $id_pedido = isset($_POST['id_pedido']) ? $_POST['id_pedido'] : NULL;
    $nome_cliente = isset($_POST['nome_cliente']) ? $_POST['nome_cliente'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $telefone = isset($_POST['telefone']) ? $_POST['telefone'] : '';
    $modelo_carro = isset($_POST['modelo_carro']) ? $_POST['modelo_carro'] : '';
    $data_aluguel = isset($_POST['data_aluguel']) ? $_POST['data_aluguel'] : date('Y-m-d H:i:s');

    // Prepara a consulta SQL para inserir um novo pedido na tabela "pedidos"
    $stmt = $pdo->prepare('INSERT INTO pedidos (id_pedido, nome_cliente, email, telefone, modelo_carro, data_aluguel) VALUES (?, ?, ?, ?, ?, ?)');
    // Executa a consulta preparada, inserindo os valores dos campos do formulário na tabela
    $stmt->execute([$id_pedido, $nome_cliente, $email, $telefone, $modelo_carro, $data_aluguel]);

    // Define a mensagem de sucesso para exibição após a submissão do formulário
    $msg = 'Pedido Realizado com Sucesso!';
}
?>

<?= template_header('Locadora AutoMaster - Realizar Pedido') ?>

<div class="content update">
    <h2>Realizar Pedido de Carro</h2>
    <!-- Formulário para criar um novo pedido de carro -->
    <form action="create.php" method="post">
        <!-- Campo para inserir o ID do pedido -->
        <label for="id_pedido">ID do Pedido</label>
        <input type="text" name="id_pedido" placeholder="" value="" id="id_pedido">
        <!-- Campo para inserir o nome do cliente -->
        <input type="text" name="nome_cliente" placeholder="Nome do Cliente" id="nome_cliente">
        <!-- Campo para inserir o email do cliente -->
        <label for="email">Email</label>
        <input type="text" name="email" placeholder="seuemail@seuprovedor.com.br" id="email">
        <!-- Campo para inserir o telefone do cliente -->
        <input type="text" name="telefone" placeholder="(XX) X.XXXX-XXXX" id="telefone">
        <!-- Campo para inserir o modelo do carro -->
        <label for="modelo_carro">Modelo do Carro</label>
        <input type="text" name="modelo_carro" placeholder="Modelo do Carro" id="modelo_carro">
        <!-- Campo para inserir a data e hora do aluguel do carro -->
        <label for="data_aluguel">Data do Aluguel</label>
        <input type="datetime-local" name="data_aluguel" value="<?= date('Y-m-d\TH:i') ?>" id="data_aluguel">
        <!-- Botão de envio do formulário -->
        <input type="submit" value="Criar Pedido">
    </form>
    <!-- Exibe a mensagem de sucesso após a submissão do formulário -->
    <?php if ($msg) : ?>
        <p><?= $msg ?></p>
    <?php endif; ?>
</div>

<?= template_footer() ?>

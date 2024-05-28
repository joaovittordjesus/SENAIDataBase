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
        $id_pedido = isset($_POST['id']) ? $_POST['id'] : NULL;
        $nome_cliente = isset($_POST['nome_cliente']) ? $_POST['nome_cliente'] : '';
        $email = isset($_POST['email']) ? $_POST['email'] : '';
        $telefone = isset($_POST['telefone']) ? $_POST['telefone'] : '';
        $modelo_carro = isset($_POST['modelo_carro']) ? $_POST['modelo_carro'] : '';
        $data_aluguel = isset($_POST['data_aluguel']) ? $_POST['data_aluguel'] : '';
        $status_aluguel = isset($_POST['status_aluguel']) ? $_POST['status_aluguel'] : '';
        
        // Prepara e executa a consulta SQL para atualizar o pedido
        $stmt = $pdo->prepare('UPDATE pedidos SET id_pedido = ?, nome_cliente = ?, email = ?, telefone = ?, modelo_carro = ?, data_aluguel = ?, status_aluguel = ? WHERE id_pedido = ?');
        $stmt->execute([$id_pedido, $nome_cliente, $email, $telefone, $modelo_carro, $data_aluguel, $status_aluguel, $_GET['id']]);
        
        // Define a mensagem de sucesso
        $msg = 'Atualização Realizada com Sucesso!';
    }

    // Prepara e executa a consulta SQL para selecionar o pedido com base no ID
    $stmt = $pdo->prepare('SELECT * FROM pedidos WHERE id_pedido = ?');
    $stmt->execute([$_GET['id']]);
    
    // Obtém os detalhes do pedido
    $pedido = $stmt->fetch(PDO::FETCH_ASSOC);
    
    // Verifica se o pedido foi encontrado
    if (!$pedido) {
        exit('Pedido Não Localizado!');
    }
} else {
    exit('Nenhum Pedido Especificado!');
}
?>

<?=template_header('Locadora AutoMaster - Atualizar Pedido de Aluguel')?>

<div class="content update">
    <h2>Atualizar Pedido de Aluguel</h2>
    <form action="update.php?id=<?=$pedido['id_pedido']?>" method="post">
        <label for="id_pedido">ID</label>
        <input type="text" name="id" placeholder="" value="<?=$pedido['id_pedido']?>" id="id">
        <label for="nome_cliente">Cliente</label>
        <input type="text" name="nome_cliente" placeholder="Nome do Cliente" value="<?=$pedido['nome_cliente']?>" id="nome_cliente">
        <label for="email">Email</label>
        <input type="text" name="email" placeholder="Email do Cliente" value="<?=$pedido['email']?>" id="email">
        <label for="telefone">Telefone</label>
        <input type="text" name="telefone" placeholder="Telefone do Cliente" value="<?=$pedido['telefone']?>" id="telefone">
        <label for="modelo_carro">Modelo do Carro</label>
        <input type="text" name="modelo_carro" placeholder="Modelo do Carro" value="<?=$pedido['modelo_carro']?>" id="modelo_carro">
        <label for="data_aluguel">Data do Aluguel</label>
        <input type="datetime-local" name="data_aluguel" value="<?=date('Y-m-d\TH:i', strtotime($pedido['data_aluguel']))?>" id="data_aluguel">
        <label for="status_aluguel">Status do Aluguel</label>
        <input type="text" name="status_aluguel" placeholder="Status do Aluguel" value="<?=$pedido['status_aluguel']?>" id="status_aluguel">
        <input type="submit" value="Update">
    </form>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php endif; ?>
</div>

<?=template_footer()?>

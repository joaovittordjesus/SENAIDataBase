<?php
// Inclui o arquivo de funções que contém a função pdo_connect_pgsql() e template_header()
include 'functions.php';
// Conecta ao banco de dados PostgreSQL usando a função pdo_connect_pgsql() e armazena a conexão em $pdo
$pdo = pdo_connect_pgsql();
// Inicializa a variável $msg como uma string vazia
$msg = '';

// Verifica se foi especificado um ID na query string ($_GET)
if (isset($_GET['id'])) {
    // Prepara uma consulta SQL para selecionar o pedido com o ID especificado na tabela "pedidos"
    $stmt = $pdo->prepare('SELECT * FROM pedidos WHERE id_pedido = ?');
    // Executa a consulta preparada, passando o ID como parâmetro
    $stmt->execute([$_GET['id']]);
    // Recupera a linha do pedido como um array associativo
    $pedido = $stmt->fetch(PDO::FETCH_ASSOC);
    // Verifica se o pedido foi encontrado
    if (!$pedido) {
        // Se não foi encontrado, exibe uma mensagem e encerra o script
        exit('Pedido Não Localizado!');
    }
    // Verifica se foi confirmada a exclusão do pedido
    if (isset($_GET['confirm'])) {
        // Se a confirmação foi enviada como 'yes'
        if ($_GET['confirm'] == 'yes') {
            // Prepara uma consulta SQL para excluir o pedido com o ID especificado
            $stmt = $pdo->prepare('DELETE FROM pedidos WHERE id_pedido = ?');
            // Executa a consulta preparada, passando o ID como parâmetro
            $stmt->execute([$_GET['id']]);
            // Define a mensagem de sucesso para exibição após a exclusão
            $msg = 'Pedido de Aluguel Apagado com Sucesso!';
        } else {
            // Se a confirmação foi enviada como 'no', redireciona para a página de leitura de pedidos e encerra o script
            header('Location: read.php');
            exit;
        }
    }
} else {
    // Se nenhum ID foi especificado na query string, exibe uma mensagem de erro e encerra o script
    exit('Nenhum ID especificado!');
}
?>

<?=template_header('Locadora AutoMaster - Apagar Pedido')?>

<div class="content delete">
	<h2>Apagar Pedido de Aluguel de Carro</h2>
    <?php if ($msg): ?>
    <!-- Exibe a mensagem de sucesso após a exclusão do pedido -->
    <p><?=$msg?></p>
    <?php else: ?>
	<!-- Exibe uma mensagem de confirmação para apagar o pedido -->
	<p>Você tem certeza que deseja apagar o pedido de aluguel de carro #<?=$pedido['id_pedido']?>?</p>
    <div class="yesno">
        <!-- Links para confirmar ou cancelar a exclusão -->
        <a href="delete.php?id=<?=$pedido['id_pedido']?>&confirm=yes">Sim</a>
        <a href="delete.php?id=<?=$pedido['id_pedido']?>&confirm=no">Não</a>
    </div>
    <?php endif; ?>
</div>

<?=template_footer()?>

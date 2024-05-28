<?php
// Inclui o arquivo de funções
include 'functions.php';

// Conecta ao banco de dados PostgreSQL
$pdo = pdo_connect_pgsql();

// Define o número da página a ser exibida, padrão é 1
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;

// Define a quantidade de registros a serem exibidos por página
$records_per_page = 5;

// Obtém o termo de pesquisa, se houver
$search = isset($_GET['search']) ? $_GET['search'] : '';

// Prepara a consulta SQL para selecionar os pedidos com base no termo de pesquisa e na paginação
$stmt = $pdo->prepare('SELECT * FROM pedidos WHERE nome_cliente LIKE :search OR email LIKE :search OR modelo_carro LIKE :search OR data_aluguel LIKE :search ORDER BY id_pedido OFFSET :offset LIMIT :limit');
$stmt->bindValue(':search', '%' . $search . '%');
$stmt->bindValue(':offset', ($page - 1) * $records_per_page, PDO::PARAM_INT);
$stmt->bindValue(':limit', $records_per_page, PDO::PARAM_INT);
$stmt->execute();

// Obtém todos os pedidos resultantes da consulta
$pedidos = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Prepara uma consulta para contar o número total de pedidos com base no termo de pesquisa
$num_pedidos = $pdo->prepare('SELECT COUNT(*) FROM pedidos WHERE nome_cliente LIKE :search OR email LIKE :search OR modelo_carro LIKE :search OR data_aluguel LIKE :search');
$num_pedidos->bindValue(':search', '%' . $search . '%');
$num_pedidos->execute();

// Obtém o número total de resultados
$num_results = $num_pedidos->fetchColumn();
?>

<?=template_header('Locadora AutoMaster - Visualizar Pedidos de Aluguel')?>

<div class="content read">
    <h2>Visualizar Pedidos de Aluguel de Carro</h2>
    <form action="read.php" method="get">
        <input type="text" name="search" placeholder="Buscar por cliente, email, modelo do carro ou data do aluguel" value="<?=htmlspecialchars($search, ENT_QUOTES)?>">
        <input type="submit" value="Buscar">
    </form>
    <table>
        <thead>
            <tr>
                <td>#</td>
                <td>Cliente</td>
                <td>Email</td>
                <td>Telefone</td>
                <td>Modelo do Carro</td>
                <td>Data do Aluguel</td>
                <td></td>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($pedidos as $pedido): ?>
            <tr>
                <td><?=$pedido['id_pedido']?></td>
                <td><?=$pedido['nome_cliente']?></td>
                <td><?=$pedido['email']?></td>
                <td><?=$pedido['telefone']?></td>
                <td><?=$pedido['modelo_carro']?></td>
                <td><?=$pedido['data_aluguel']?></td>
                <td class="actions">
                    <a href="update.php?id=<?=$pedido['id_pedido']?>" class="edit"><i class="fas fa-pen fa-xs"></i></a>
                    <a href="delete.php?id=<?=$pedido['id_pedido']?>" class="trash"><i class="fas fa-trash fa-xs"></i></a>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <div class="pagination">
        <?php if ($page > 1): ?>
        <a href="read.php?page=<?=$page-1?>&search=<?=htmlspecialchars($search, ENT_QUOTES)?>"><i class="fas fa-angle-double-left fa-sm"></i></a>
        <?php endif; ?>
        <?php if ($page*$records_per_page < $num_results): ?>
        <a href="read.php?page=<?=$page+1?>&search=<?=htmlspecialchars($search, ENT_QUOTES)?>"><i class="fas fa-angle-double-right fa-sm"></i></a>
        <?php endif; ?>
    </div>
</div>

<?=template_footer()?>

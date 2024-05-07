<?php
include 'functions.php';
$pdo = pdo_connect_pgsql();
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
$records_per_page = 5;

$search = isset($_GET['search']) ? $_GET['search'] : '';

// Prepara a instrução SQL para selecionar registros da tabela pedidos com base na pesquisa
$stmt = $pdo->prepare('SELECT pedidos.*, clientes.nome AS nome_cliente, pizzas.sabor AS sabor_pizza 
                      FROM pedidos 
                      INNER JOIN clientes ON pedidos.id_cliente = clientes.id_cliente 
                      INNER JOIN pizzas ON pedidos.id_pizza = pizzas.id_pizza 
                      WHERE clientes.nome LIKE :search 
                      OR clientes.email LIKE :search 
                      OR pizzas.sabor LIKE :search 
                      OR pedidos.data_pedido LIKE :search 
                      OR pedidos.status_pedido LIKE :search 
                      ORDER BY pedidos.id_pedido OFFSET :offset LIMIT :limit');
$stmt->bindValue(':search', '%' . $search . '%');
$stmt->bindValue(':offset', ($page - 1) * $records_per_page, PDO::PARAM_INT);
$stmt->bindValue(':limit', $records_per_page, PDO::PARAM_INT);
$stmt->execute();
$pedidos = $stmt->fetchAll(PDO::FETCH_ASSOC);

$num_pedidos = $pdo->prepare('SELECT COUNT(*) FROM pedidos 
                              INNER JOIN clientes ON pedidos.id_cliente = clientes.id_cliente 
                              INNER JOIN pizzas ON pedidos.id_pizza = pizzas.id_pizza 
                              WHERE clientes.nome LIKE :search 
                              OR clientes.email LIKE :search 
                              OR pizzas.sabor LIKE :search 
                              OR pedidos.data_pedido LIKE :search 
                              OR pedidos.status_pedido LIKE :search');
$num_pedidos->bindValue(':search', '%' . $search . '%');
$num_pedidos->execute();
$num_results = $num_pedidos->fetchColumn();
?>

<?=template_header('Visualizar Pedidos')?>

<div class="content read">
    <h2>Visualizar Pedidos</h2>
    <form action="read.php" method="get">
        <input type="text" name="search" placeholder="Buscar por cliente, email, sabor da pizza, data do pedido ou status do pedido" value="<?=htmlspecialchars($search, ENT_QUOTES)?>">
        <input type="submit" value="Buscar">
    </form>
    <table>
        <thead>
            <tr>
                <td>#</td>
                <td>Cliente</td>
                <td>Email</td>
                <td>Sabor Pizza</td>
                <td>Data do Pedido</td>
                <td>Status do Pedido</td>
                <td></td>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($pedidos as $pedido): ?>
            <tr>
                <td><?=$pedido['id_pedido']?></td>
                <td><?=$pedido['nome_cliente']?></td>
                <td><?=$pedido['email']?></td>
                <td><?=$pedido['sabor_pizza']?></td>
                <td><?=$pedido['data_pedido']?></td>
                <td><?=$pedido['status_pedido']?></td>
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

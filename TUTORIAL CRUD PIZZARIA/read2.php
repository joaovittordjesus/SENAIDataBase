<?php
// Inclui o arquivo de funções necessárias
include 'functions.php';
// Conecta ao banco de dados PostgreSQL usando a função pdo_connect_pgsql() definida em 'functions.php'
$pdo = pdo_connect_pgsql();
// Obtém o número da página da solicitação GET (parâmetro URL: page), se não existir, define a página como 1 por padrão
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
// Define o número de registros para mostrar em cada página
$records_per_page = 5;

// Prepara a instrução SQL para selecionar registros da tabela contacts, com uma ordenação por id_contato,
// usando OFFSET e LIMIT para determinar a página atual
$stmt = $pdo->prepare('SELECT * FROM contatos ORDER BY id_contato OFFSET :offset LIMIT :limit');
// Associa os valores para OFFSET e LIMIT na instrução preparada
$stmt->bindValue(':offset', ($page - 1) * $records_per_page, PDO::PARAM_INT);
$stmt->bindValue(':limit', $records_per_page, PDO::PARAM_INT);
// Executa a consulta preparada
$stmt->execute();
// Busca os registros retornados pela consulta e armazena-os em um array associativo
$contacts = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Obtém o número total de contatos na tabela, para determinar se devem ser exibidos botões de página anterior e próxima
$num_contacts = $pdo->query('SELECT COUNT(*) FROM contatos')->fetchColumn();
?>


<?=template_header('Visualizar Pedidos')?>

<div class="content read">
	<h2>Visualizar Pedidos</h2>
	<!-- Link para criar um novo pedido -->
	<a href="create.php" class="create-contact">Realizar Pedido</a>
	<table>
        <thead>
            <tr>
                <td>#</td>
                <td>Nome</td>
                <td>Email</td>
                <td>Celular</td>
                <td>Pizza</td>
                <td>Data do Pedido</td>
                <td></td>
            </tr>
        </thead>
        <tbody>
            <!-- Loop pelos contatos recuperados e exibição dos dados em uma tabela -->
            <?php foreach ($contacts as $contact): ?>
            <tr>
                <td><?=$contact['id_contato']?></td>
                <td><?=$contact['nome']?></td>
                <td><?=$contact['email']?></td>
                <td><?=$contact['cel']?></td>
                <td><?=$contact['pizza']?></td>
                <td><?=$contact['cadastro']?></td>
                <td class="actions">
                    <!-- Links para editar e excluir cada pedido -->
                    <a href="update.php?id=<?=$contact['id_contato']?>" class="edit"><i class="fas fa-pen fa-xs"></i></a>
                    <a href="delete.php?id=<?=$contact['id_contato']?>" class="trash"><i class="fas fa-trash fa-xs"></i></a>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
	<!-- Exibição da paginação, com links para páginas anterior e próxima, se aplicável -->
	<div class="pagination">
		<?php if ($page > 1): ?>
		<a href="read.php?page=<?=$page-1?>"><i class="fas fa-angle-double-left fa-sm"></i></a>
		<?php endif; ?>
		<?php if ($page*$records_per_page < $num_contacts): ?>
		<a href="read.php?page=<?=$page+1?>"><i class="fas fa-angle-double-right fa-sm"></i></a>
		<?php endif; ?>
	</div>
</div>

<?=template_footer()?>

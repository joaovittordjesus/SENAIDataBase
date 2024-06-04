<?php
// Inclui o arquivo de funções
include 'functions.php';
$pdo = pdo_connect_pgsql();
$msg = '';

if (isset($_GET['id'])) {
    // Verifica se foi fornecido um ID válido na URL
    $stmt = $pdo->prepare('SELECT * FROM carro WHERE id_carro = ?');
    $stmt->execute([$_GET['id']]);
    $carro = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$carro) {
        exit('Carro não localizado!');
    }

    if (isset($_GET['confirm'])) {
        if ($_GET['confirm'] == 'yes') {
            // Se a confirmação for 'yes', deleta o carro do banco de dados
            $stmt = $pdo->prepare('DELETE FROM carro WHERE id_carro = ?');
            $stmt->execute([$_GET['id']]);
            $msg = 'Carro apagado com sucesso!';
        } else {
            // Se a confirmação não for 'yes', redireciona para a página de visualização
            header('Location: read.php');
            exit;
        }
    }
} else {
    exit('Nenhum ID fornecido!');
}
?>

<?= template_header('Delete') ?>

<div class="content delete">
    <h2>Deletar Carro #<?= $carro['id_carro'] ?></h2>
    <?php if ($msg): ?>
        <!-- Exibe mensagem de sucesso se houver -->
        <p><?= $msg ?></p>
        <a href="read.php">Voltar</a>
    <?php else: ?>
        <!-- Exibe formulário de confirmação se não houver mensagem de sucesso -->
        <p>Tem certeza que deseja deletar o carro modelo: <?= $carro['modelo'] ?>?</p>
        <div class="yesno">
            <a href="delete.php?id=<?= $carro['id_carro'] ?>&confirm=yes">Yes</a>
            <a href="delete.php?id=<?= $carro['id_carro'] ?>&confirm=no">No</a>
        </div>
    <?php endif; ?>
</div>

<?= template_footer() ?>

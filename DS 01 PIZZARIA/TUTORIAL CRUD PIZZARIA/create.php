<?php
include 'functions.php';
$pdo = pdo_connect_pgsql();
$msg = '';

if (!empty($_POST)) {
    $id_contato = isset($_POST['id_contato']) ? $_POST['id_contato'] : NULL;
    $nome = isset($_POST['nome']) ? $_POST['nome'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $cel = isset($_POST['cel']) ? $_POST['cel'] : '';
    $pizza = isset($_POST['pizza']) ? $_POST['pizza'] : '';
    $cadastro = isset($_POST['cadastro']) ? $_POST['cadastro'] : date('Y-m-d H:i:s');

    $stmt = $pdo->prepare('INSERT INTO contatos (id_contato, nome, email, cel, pizza, cadastro) VALUES (?, ?, ?, ?, ?, ?)');
    $stmt->execute([$id_contato, $nome, $email, $cel, $pizza, $cadastro]);

    $msg = 'Pedido Realizado com Sucesso!';
}
?>

<?= template_header('Cadastro de Pedidos') ?>

<div class="content update">
    <h2>Registrar Pedido</h2>
    <form action="create.php" method="post">
        <label for="id_contato">ID</label>
        <input type="text" name="id_contato" placeholder="" value="" id="id_contato">
        <input type="text" name="nome" placeholder="Seu Nome" id="nome">
        <label for="email">Email</label>
        <input type="text" name="email" placeholder="seuemail@seuprovedor.com.br" id="email">
        <input type="text" name="cel" placeholder="(XX) X.XXXX-XXXX" id="cel">
        <label for="pizza">Pizza</label>
        <input type="text" name="pizza" placeholder="Pizza" id="pizza">
        <label for="cadastro">Data do Pedido</label>
        <input type="datetime-local" name="cadastro" value="<?= date('Y-m-d\TH:i') ?>" id="cadastro">
        <input type="submit" value="Criar">
    </form>
    <?php if ($msg) : ?>
        <p><?= $msg ?></p>
    <?php endif; ?>
</div>

<?= template_footer() ?>

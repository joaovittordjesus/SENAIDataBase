<?php
// Função para conectar ao banco de dados PostgreSQL
function pdo_connect_pgsql() {
    // Configurações de conexão ao banco de dados
    $DATABASE_HOST = 'localhost';
    $DATABASE_PORT = '5432';
    $DATABASE_NAME = 'locadoradb';
    $DATABASE_USER = 'postgres';
    $DATABASE_PASS = 'postgres';
    
    try {
        // Retorna uma nova instância de PDO conectada ao banco de dados PostgreSQL
        return new PDO(
            "pgsql:host=$DATABASE_HOST;port=$DATABASE_PORT;dbname=$DATABASE_NAME",
            $DATABASE_USER,
            $DATABASE_PASS
        );
    } catch (PDOException $exception) {
        // Encerra o script com uma mensagem de erro caso a conexão falhe
        exit('Failed to connect to database!');
    }
}

// Função para criar o cabeçalho HTML das páginas
// Função para criar o cabeçalho HTML das páginas
function template_header($title) {
    echo <<<EOT
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>$title</title>
    <!-- Caminho relativo para o arquivo CSS -->
    <link href="../css/styles.css" rel="stylesheet" type="text/css">
    <!-- Caminho relativo para o arquivo JavaScript -->
    <script src="../js/scripts.js"></script>
</head>
<body>
    <header>
        <div class="container">
            <div id="branding">
                <h1>Locadora AutoMaster</h1>
            </div>
            <nav>
                <ul>
                    <!-- Links para as diferentes páginas do site -->
                    <li><a href="index.php">Home</a></li>
                    <li><a href="create.php">Cadastrar</a></li>
                    <li><a href="read.php">Visualizar</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="container">
EOT;
}

// Função para criar o rodapé HTML das páginas
function template_footer() {
    echo <<<EOT
        </div>
    </body>
</html>
EOT;
}
?>

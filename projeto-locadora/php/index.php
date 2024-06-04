<?php
// Include the 'functions.php' file, which contains reusable PHP functions.
include 'functions.php';
?>

<!-- This line includes the header template defined in 'functions.php' and passes the title 'Locadora AutoMaster' as an argument. -->
<?=template_header('PROJETO LOCADORA')?>

<!-- This section contains the HTML content for the home page. -->
<div class="content">
    <!-- Display the heading 'Inicio'. -->
    <h2>Início</h2>
    <!-- Display a welcoming message. -->
    <p>Bem-vindo à Locadora AutoMaster! Aqui você pode solicitar o aluguel de carros.</p>
</div>

<!-- This line includes the footer template defined in 'functions.php'. -->
<?=template_footer()?>

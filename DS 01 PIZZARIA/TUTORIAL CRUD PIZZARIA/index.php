<?php
// Include the 'functions.php' file, which contains reusable PHP functions.
include 'functions.php';
?>

// This line includes the header template defined in 'functions.php' and passes the title 'Pizzaria Dom Bruno' as an argument.
<?=template_header('Pizzaria Dom Bruno')?>


// This section contains the HTML content for the home page.
<div class="content">
	// Display the heading 'Inicio'.
	<h2>Inicio</h2>
	// Display a welcoming message.
	<p>Seja Bem-Vindo!</p>
</div>

// This line includes the footer template defined in 'functions.php'.
<?=template_footer()?>


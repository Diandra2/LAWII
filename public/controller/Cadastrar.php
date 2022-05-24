<?php
class Cadastrar
{
    private $message = "";
    private $error = "";
    public function __construct()
 {
    Transaction::open();
 }
 public function controller()
 {
    $form = new Template("public/view/cadastrar.html");
    $this->message = $form->saida();
 }
 public function salvar()
 {
 if (isset($_POST["nome"]) && isset($_POST["email"]) && isset($_POST["senha"])) {
 try {
    $conexao = Transaction::get();
    $nome = $conexao->quote($_POST["nome"]);
    $email = $conexao->quote($_POST["email"]);
    $senha = $conexao->quote(sha1($_POST["senha"]));
    $crud = new Crud("usuario");
    $crud->insert(
        "nome,email,senha",
        "{$nome},{$email},{$senha}"
 );
 $this->message = $crud->getMessage();
 $this->error = $crud->getError();
 } catch (Exception $e) {
 $this->message = "Ocorreu um erro! " . $e->getMessage();
 $this->error = TRUE;
 }
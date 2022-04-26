<?php
class Form
{
  private $message = "";
  public function __construct()
  {
    Transaction::open();
  }
  public function controller()
  {
    $form = new Template("view/form.html");
    $this->message = $form->saida();
  }
  public function salvar()
  {
    if (isset($_POST["disciplina"]) && isset($_POST["professor"]) && isset($_POST["materia"])) {
      try {
        $conexao = Transaction::get();
        $avaliacao = new Crud("avaliacao ");
        $disciplina = $conexao->quote($_POST["disciplina"]);
        $professor = $conexao->quote($_POST["professor"]);
        $materia = $conexao->quote($_POST["materia"]);
        $resultado = $avaliacao->insert("disciplina, professor, materia", "$disciplina, $professor, $materia");
      } catch (Exception $e) {
        echo $e->getMessage();
      }
    }
  }
  public function getMessage()
  {
    return $this->message;
  }
  public function __destruct()
  {
    Transaction::close();
  }
}
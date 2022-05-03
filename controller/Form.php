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
    $form->set("id", "");
    $form->set("disciplina", "");
    $form->set("professor", "");
    $form->set("materia", "");
    $this->message = $form->saida();
  }
  public function salvar()
  {
    if (isset($_POST["disciplina"]) && isset($_POST["professor"]) && isset($_POST["materia"])) {
      try {
        $conexao = Transaction::get();
        $avaliacao = new Crud("avaliacao");
        $disciplina = $conexao->quote($_POST["disciplina"]);
        $config = $conexao->quote($_POST["professor"]);
        $materia = $conexao->quote($_POST["materia"]);
        if (empty($_POST["id"])) {
          $avaliacao->insert(
            "disciplina, professor, materia",
            "$disciplina, $config, $materia"
          );
        } else {
          $id = $conexao->quote($_POST["id"]);
          $avaliacao->update(
            "disciplina = $disciplina, professor = $config, materia = $materia",
            "id = $id"
          );
        }
      } catch (Exception $e) {
        echo $e->getMessage();
      }
    }
  }
  public function editar()
  {
    if (isset($_GET["id"])) {
      try {
        $conexao = Transaction::get();
        $id = $conexao->quote($_GET["id"]);
        $avaliacao = new Crud("avaliacao");
        $resultado = $avaliacao->select("*", "id = $id");
        $form = new Template("view/form.html");
        foreach ($resultado[0] as $cod => $materia) {
          $form->set($cod, $materia);
        }
        $this->message = $form->saida();
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
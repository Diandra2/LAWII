<?php
class Form
{
  private $message = "";
  private $error = "";
  public function __construct()
  {
    Transaction::open();
  }
  public function controller()
  {
    $form = new Template("restrict/view/form.html");
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
        $this->message = $avaliacao->getMessage();
        $this->error = $avaliacao->getError();
      } catch (Exception $e) {
        $this->message = $e->getMessage();
        $this->error = true;
      }
    } else {
      $this->message = "Campos não informados!";
      $this->error = true;
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
        if (!$avaliacao->getError()) {
          $form = new Template("view/form.html");
          foreach ($resultado[0] as $cod => $materia) {
            $form->set($cod, $materia);
          }
          $this->message = $form->saida();
        } else {
          $this->message = $avaliacao->getMessage();
          $this->error = true;
        }
      } catch (Exception $e) {
        $this->message = $e->getMessage();
        $this->error = true;
      }
    }
  }
  public function getMessage()
  {
    if (is_string($this->error)) {
      return $this->message;
    } else {
      $msg = new Template("view/msg.html");
      if ($this->error) {
        $msg->set("cor", "danger");
      } else {
        $msg->set("cor", "success");
      }
      $msg->set("msg", $this->message);
      $msg->set("uri", "?class=Tabela");
      return $msg->saida();
    }
  }
  public function __destruct()
  {
    Transaction::close();
  }
}
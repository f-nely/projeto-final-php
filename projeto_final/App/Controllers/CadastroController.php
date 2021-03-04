<?php


namespace App\Controllers;


use App\Models\Pessoa;
use Foundation\Controller;

class CadastroController extends Controller
{
    public function index()
    {
        return $this->render('cadastro/index');
    }

    public function salvar()
    {
        $dados = [
            'nome' => input()->get('nome'),
            'email' => input()->get('email')
        ];

        $pessoa = new Pessoa();
        $qtd = $pessoa->insert($dados);

        if ($qtd) {
            session()->put('_sucesso', 'incluido com sucesso');
            return redirect()->route('cadastro.index');
        }
        session()->put('_erro', 'erro ao incluir pessoa');
        return redirect()->route('cadastro.index');
    }
}
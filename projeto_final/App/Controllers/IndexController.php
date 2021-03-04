<?php
namespace App\Controllers;

use App\Models\Pessoa;
use Foundation\Controller;

class IndexController extends Controller
{
    public function index()
    {
        $pessoas = (new Pessoa())->getAll();
        return $this->render('index', [
            'pessoas' => $pessoas
        ]);
    }
}

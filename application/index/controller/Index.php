<?php
namespace app\index\controller;

use think\Controller;
use think\Request;

class Index extends Controller
{
    public function index()
    {
		header('HTTP/1.1 301 Moved Permanently');
		header("Location: ".Url('Index/User/index'));
		exit;
	}
}

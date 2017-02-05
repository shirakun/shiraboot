<?php
namespace app\index\controller;

use think\Controller;
use think\Request;

class Index extends Controller
{
    public function index()
    {
		header('HTTP/1.1 301 Moved Permanently');//发出301头部
		header('Location:/index.html');//跳转到带www的网址
		//return $this->fetch();
	}
	
	public function news()
	{
		$reData = file_get_contents('http://newgame-anime.com/news/');
		$reData = str_replace('src="/','src="//newgame-anime.com/',$reData);
		echo $reData;
		exit;
	}
}

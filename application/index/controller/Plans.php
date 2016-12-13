<?php
namespace app\index\controller;

use think\Controller;
use think\Request;

class Plans extends Controller
{
	public function __construct(){
		parent::__construct();
    }
	
	public function index(){
        if(!$userInfo = chickLogin(db('users')))
		{
			$this->error('未登录','User/login');
			exit;
		}
		$this->assign('userInfo',$userInfo);
		$this->assign('plansInfo',db('plans')->select());
		return $this->fetch();
	}
	
	public function buy(){
		$user = db('users');
        if(!$userInfo = chickLogin($user))
		{
			$this->error('未登录','User/login');
			exit;
		}
		$planId = input('param.id');
		$buy = db('plans');
		if(!$planInfo = $buy->where(['id'=>$planId,'status'=>1])->find())
		{
			$this->error('您购买的套餐不存在或处于停售状态!');
		}
		else
		{
			unset($userInfo['percent']); //删除用户数据的百分比
			$userInfo['plan'] = $planId;
			$userInfo['plan_name'] = $planInfo['name'];
			$userInfo['maxtime'] = $planInfo['maxtime'];
			$userInfo['maxboot'] = $planInfo['maxboot'];
			$userInfo['maxnum'] = $planInfo['maxnum'];
			$userInfo['remainder'] = $planInfo['maxnum'];
			$userInfo['expiration'] = time() + $planInfo['cycle'];
			$userInfo['vip'] = $planInfo['vip'];
			$user->where('id',$userInfo['id'])->update($userInfo);
			$this->success('购买成功','hub/index');
		}
	}
}
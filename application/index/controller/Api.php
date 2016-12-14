<?php
namespace app\index\controller;

use think\Controller;
use think\Request;

class Api extends Controller
{
	public index(){
		if(!input('key') || !$apiInfo = db('api')->where('api_key',input('key'))->find())
		{
			$this->error('您的密钥不正确或没有查询到您的api信息.');
			exit;
		}
		elseif($apiInfo['expiration'] > time())
		{
			$this->error('您的api服务已到期.');
			exit;
		}
		elseif($apiInfo['status']!=1)
		{
			$tmp = [
				0=>'您的api服务已停用.',
				2=>'您的api服务已被禁用'
			];
			$this->error($tmp[$apiInfo['status']]);
			exit;
		}
		
		$user = db('users'); //用户表
		if(!$userInfo = $user->where('id'=>$apiInfo['uid'])->find())
		{
			$this->error('没有查询到您的账户信息');
			exit;
		}
		elseif(!$userInfo['status']==1) //账户状态检测
		{
			$this->error('您的账户已被封禁或还没有激活!');
			exit;
		}
		elseif($userInfo['plan']==0){ //套餐购买检测
			$this->error('您没有购买套餐!');
			exit;
		}
		elseif($userInfo['expiration'] < time()) //套餐过期检测
		{
			$this->error('您的套餐已经过期,请购买新的套餐!');
			exit;
		}
		elseif($userInfo['maxtime'] < $hubInfo['time']) //最大时间检测
		{
			$this->error('您设置的攻击时间超过您套餐的最大时间,您最多有'.$userInfo['maxtime'].'秒的时间!');
			exit;
		}
		elseif($userInfo['remainder']==0) //剩余次数是否为0
		{
			$this->error('您当日剩余次数已经用完,请明日再试,或者购买临时次数补充包(暂未开放)!');
			exit;
		}
		elseif($userInfo['vip']==0 && !$hubInfo['vip']==0) //检测vip
		{
			$this->error('您必须购买包含vip的套餐包才能使用vip节点!');
			exit;
		}
		elseif(!$history=db('history') || getBooting($history)>=$userInfo['maxboot']) //检测最大并发
		{
			$this->error('您的并发攻击已经达到套餐上限,请停止部分攻击或购买补充包(暂未开放)!');
			exit;
		}
		elseif(db('white_list')->where('ip',$hubInfo['host'])->find()) //检测是否存在于白名单
		{
			$this->error('此ip存在于白名单中,您禁止攻击它!');
			exit;
		}
		
	}
}
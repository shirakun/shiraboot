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
		$this->assign('api',db('config')->where('name','api_buy')->find()['value']==1);
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
		if($planId == 'api')
		{
			if(db('config')->where('name','api_buy')->find()['value']==1)
			{
				$apiData = [
					'uid'=>$userInfo['id'],
					'api_key'=>cpwd($userInfo['passwd'].time()),
					'status'=>1,
					'expiration'=>time() + 2592000,
				];
				db('api')->insert($apiData);
				$this->success('购买成功,api权限已成功应用到您的账户!');
				
			}
			else
			{
				$this->error('当前禁止购买api,请联系管理员!');
			}
			exit;
		}
		
		if(!$planInfo = $buy->where(['id'=>$planId,'status'=>1])->find())
		{
			$this->error('您购买的套餐不存在或处于停售状态!');
			exit;
		}
		unset($userInfo['percent']); //删除用户数据的百分比
		if($planInfo['type'] == 1) //普通套餐
		{
			if($planInfo['id'] != $userInfo['plan'] && $userInfo['expiration'] > time())
			{
				$this->error('您当前套餐未到期且购买的套餐和您当前套餐不同,禁止购买(您可以购买相同套餐来续期或等待套餐过期后再购买其它套餐).');
				exit;
			}

			if($userInfo['expiration'] > time()) //用户套餐还没有到期(续期)
			{
				$userInfo['expiration'] = $userInfo['expiration'] + $planInfo['cycle'];
				$successMsg = '续期成功!';
				
			}
			else
			{
				$userInfo['plan'] = $planId;
				$userInfo['plan_name'] = $planInfo['name'];
				$userInfo['maxtime'] = $planInfo['maxtime'];
				$userInfo['maxboot'] = $planInfo['maxboot'];
				$userInfo['maxnum'] = $planInfo['maxnum'];
				$userInfo['remainder'] = $planInfo['maxnum'];
				$userInfo['vip'] = $planInfo['vip'];
				$userInfo['expiration'] = time() + $planInfo['cycle'];
				$successMsg = '购买成功!';
			}
			$user->where('id',$userInfo['id'])->update($userInfo);
			
		}
		elseif($planInfo['type'] == 2) //临时补充包
		{
			$userInfo['remainder'] = $userInfo['remainder'] + $planInfo['maxnum'];
			$user->where('id',$userInfo['id'])->update($userInfo);
			$successMsg = '临时补充包以应用到您的账户,请在次日0点前使用,预期失效!';
		}
		elseif($planInfo['type'] == 3) //套餐补充包
		{
			$userInfo['maxnum'] = $userInfo['maxnum'] + $planInfo['maxnum'];
			$userInfo['remainder'] = $userInfo['remainder'] + $planInfo['maxnum'];
			$user->where('id',$userInfo['id'])->update($userInfo);
			$successMsg = '套餐补充包以应用到您的账户,请注意套餐到期时间,套餐补充包将随着套餐的到期而失效!';
		}
		elseif($planInfo['type'] == 4) //api权限
		{
			$apiData = [
				'uid'=>$userInfo['id'],
				'api_key'=>cpwd($userInfo['passwd'].time()),
				'expiration'=>time() + $cdkeyInfo['expiration'],
				'status'=>1,
			];
			db('api')->insert($apiData);
			$successMsg = 'api已经成功应用到您的账户.';
			$this->success('购买成功','hub/index');
		}
		elseif($planInfo['type'] == 5) //并发补充包
		{
			$userInfo['maxboot'] = $userInfo['maxboot'] + $planInfo['maxboot'];
			$user->where('id',$userInfo['id'])->update($userInfo);
			$successMsg = '并发补充包以应用到您的账户,请注意套餐到期时间,并发补充包将随着套餐的到期而失效!';
		}
		else
		{
			$this->error("您购买的套餐类型不正确!");
			exit;
		}
		$this->success($successMsg,'hub/index');
	}
}
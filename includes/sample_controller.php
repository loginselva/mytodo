<?php
session_start();
include("Db.php");

if(!isset($_REQUEST)){
	return false;
}

Class sample_controller{
	public $db_handle;
	public function __construct(){ 
		$this->db_handle = new Db();
	}

	public function loggedin($req){
		$rec = $this->db_handle->select("SELECT id, username, email_id, profile_id FROM my_users WHERE email_id = '".$req['email']."' AND profile_id = '".$req['ID']."' LIMIT 1 ");
		if(count($rec) == 0){
			$this->db_handle->query("INSERT INTO my_users(username, profile_id, email_id, token_id, status) VALUES('".$req['full_name']."','".$req['ID']."','".$req['email']."','".$req['token_id']."','A') ");
			$last_id = mysql_insert_id();
			$userprofile = array('username'=>$req['full_name'], 'profile_id'=>$req['ID'], 'email' => $req['email'],"user_id" => $last_id);
		}else{
			$userprofile = array('username'=>$rec[0]['username'], 'profile_id'=>$rec[0]['profile_id'], 'email' => $rec[0]['email_id'], "user_id" => $rec[0]['id']);
		}
		$_SESSION['userprofile'] = $userprofile;
		return json_encode($_SESSION); exit;
	}

	public function loggedout(){
		if(isset($_SESSION['userprofile'])){
			unset($_SESSION['userprofile']);
			return "logged out"; 
		}
	}

	public function isAlive(){
		if(isset($_SESSION['userprofile'])){
			return json_encode($_SESSION['userprofile']);
		}else{
			return "loggedout";
		}
	}

	public function add($req){
		$userprofile = $_SESSION['userprofile'];
		$list_item = preg_replace("/[^0-9a-zA-Z\s]+/", '', $req['val']); 
		$this->db_handle->query("INSERT INTO my_users_todo(user_id, list_name, action) VALUES(".$userprofile['user_id'].", '".$list_item."', 'I') ");
		return "added";
	}

	public function getlist(){
		if(!isset($_SESSION['userprofile'])){
			return false;
		}
		$userprofile = $_SESSION['userprofile'];
		$res = $this->db_handle->select("SELECT id, list_name, action FROM my_users_todo WHERE user_id =".$userprofile['user_id']." ORDER BY id DESC ");
		if(count($res) > 0){
			return json_encode($res); 
		}else{
			return false;
		}
	}

	public function removeList($req){
		$del = $this->db_handle->query("DELETE FROM my_users_todo WHERE id = ".$req['list_id']." LIMIT 1 ");
		return "deleted";
	}

	public function checkeditem($req){
		$update = $this->db_handle->query("UPDATE my_users_todo SET action = '".$req['status']."' WHERE id = ".$req['list_id']." LIMIT 1 ");
		return "updated";
	}

}

$req = $_REQUEST;

$contrl= new sample_controller();

switch ($req['action']) {
	case 'loggedin':
		echo $contrl->loggedin($req); exit;
		break;

	case 'loggedout':
		echo $contrl->loggedout(); exit;
	break;

	case "isAlive":
		echo $contrl->isAlive(); exit;
	break;

	case 'add':
		echo $contrl->add($req); exit;
	break;

	case "getlist":
		echo $contrl->getlist(); exit;
	break;

	case "removeList":
		echo $contrl->removeList($req); exit;
	break;

	case 'checkeditem':
		echo $contrl->checkeditem($req); exit;
	break;

	default:
		# code...
		break;
}


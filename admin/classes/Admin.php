<?php

/**
 * 
 */
class Admin
{
	
	private $con;

	function __construct()
	{
		include_once("Database.php");
		$db = new Database();
		$this->con = $db->connect();
	}

	public function getAdminList(){
		$query = $this->con->query("SELECT `id`, `name`, `email`, `is_active` FROM `admin` WHERE 1");
		$ar = [];
		if ($query->num_rows > 0) {
			while ($row = $query->fetch_assoc()) {
				$ar[] = $row;
			}
			return ['status'=> 202, 'message'=> $ar];
		}
		return ['status'=> 303, 'message'=> 'No Admin'];
	}

	public function deleteAdmin($aid = null){
		if ($aid != null) {
			$q = $this->con->query("DELETE FROM admin WHERE id = '$aid'");
			if ($q) {
				return ['status'=> 202, 'message'=> 'Admin Dihapus dari Sistem'];
			}else{
				return ['status'=> 202, 'message'=> 'Failed to run query'];
			}
			
		}else{
			return ['status'=> 303, 'message'=>'Invalid admin id'];
		}

	}

}




if (isset($_POST['GET_ADMIN'])) {
	$a = new Admin();
	echo json_encode($a->getAdminList());
	exit();
	
}

if (isset($_POST['DELETE_ADMIN'])) {
	$p = new Admin();
	if (isset($_SESSION['admin_id'])) {
		if(!empty($_POST['aid'])){
			$aid = $_POST['aid'];
			echo json_encode($p->deleteAdmin($aid));
			exit();
		}else{
			echo json_encode(['status'=> 303, 'message'=> 'Invalid admin id']);
			exit();
		}
	}else{
		echo json_encode(['status'=> 303, 'message'=> 'Invalid Session']);
	}


}

?>
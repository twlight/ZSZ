<?php
/**
* resume class , controller, both connect the view page and the model page.
*/
class Resume extends CI_Controller
{
	function __construct()
	{
		# code...
		parent::__construct();
		$this->load->model('resume_model');
		$this->load->library('form_validation');
		$this->load->helper(array('form', 'url'));
		$this->load->library('session');//之前没有load这个类库才出错...
	}
	public function index()
	{
		
		$data['title'] = '填写基本信息';
		$iter = ($this->session->userdata('iter'));
		$UserName = $iter['name'];			
		$data['userid'] = $this->resume_model->getUserID($UserName);
		$data['normaluser'] = 1;
		$this->load->view('templates/header',$data);
		$this->load->view('resume/userbasic',$data);
		
		$this->load->view('templates/footer',$data);
	}
	
	public function updatebasic()
	{
		$this->load->model('normaluser_model');
		$data['normaluser'] = 1;
	  	$result = $this->normaluser_model->update_basic();
	  	
	  	if($result)
		{
			$data['title'] = '填写教育信息';
			$iter = ($this->session->userdata('iter'));
			$UserName = $iter['name'];			
			$data['userid'] = $this->resume_model->getUserID($UserName);
			$this->load->view('templates/header',$data);
			$this->load->view('resume/useredu');
			$this->load->view('templates/footer',$data);
		}
		else
		{
			
			$data['title'] =  "错误222！";
		    $this->load->view('templates/header',$data);
			$this->load->view('resume/index',$data);
		    $this->load->view('templates/footer',$data);
		}	  
	}
	public function update_edu()
	{
		$this->load->model('normaluser_model');
	  	$result = $this->normaluser_model->update_edu();
		//这里调用创建一份新的简历!
	  	if($result)
		{	
			$userid = $this->input->post('userid');
			
			$result2 = $this->resume_model->setResume($userid);
			if($result2)
			{
				
				$iter = ($this->session->userdata('iter'));
				
				$UserName = $iter['name'];
		
				
				$data['userid'] = $this->resume_model->getUserID($UserName);
				
				$userid = $data['userid'];
			
				$data['normaluser'] = true;
				
				$data['resumeid_list'] = $this->resume_model->getresumeid($userid);
				//print_r($data['resumeid_list']);
				$data['basicinfo'] = $this->resume_model->getbasicinfo($userid);
				
				$data['title'] = '设置我的简历';
				$this->load->view('templates/header',$data);
				$this->load->view('mysetting/mysettingview',$data);
				
				//包含重命名和删除文件，初步设想是如果没有命名，就把简历ID显示出来.
				$this->load->view('mysetting/mysetting',$data);
				
				//用户基本信息不能变...
				$this->load->view('mysetting/mysettingviewbasic',$data);
				
				//$this->load->view('mysetting/mysettingviewtotal');
				
				$this->load->view('mysetting/mysettingviewlang',$data);
				$this->load->view('mysetting/mysettingviewschoolwork',$data);
				$this->load->view('mysetting/mysettingviewsocial',$data);
				$this->load->view('mysetting/mysettingviewproject',$data);
				$this->load->view('mysetting/mysettingviewawards',$data);
				$this->load->view('mysetting/mysettingviewetc',$data);
				$this->load->view('mysetting/mysettingviewattached',$data);
				
				$this->load->view('templates/footer',$data);
				
			}
			else
			{
				echo "<h2>填写基本信息成功，但是没能成功创建一份新的简历</h2>";
			}
		}
		else
		{
			
			$data['title'] =  "错误222！";
		    $this->load->view('templates/header',$data);
			$this->load->view('resume/index',$data);
		    $this->load->view('templates/footer',$data);
		}	  
	}
	public function create($flag = FALSE)
	{
	 
	  	$result = $this->resume_model->setResume();
	  	if($result)
		{
			
			$this->load->view('resume/success');
		}
		else
		{
			echo "hehe";
			$data['title'] =  "错误222！";
		    $this->load->view('templates/header',$data);
			$this->load->view('resume/index',$data);
		    $this->load->view('templates/footer',$data);
		}
	}	  
	public function post()
	{
		if($this->input->post())
		{
		$userid = $this->input->post('userid');
		//echo $userid;//显示不出来userid,没有post过去详细的信息...why!!之前的那个已经改好了...
	  	$result = $this->resume_model->setResume();
	  	if($result)
		{
			  $data = array();
			  $data['title'] = "成功编辑简历";
			  $this->load->view('templates/header',$data);
			  $this->load->view('resume/success');
			  $this->load->view('templates/footer',$data);
		}
			else
			{
				echo "fail to create a !";
			}
		}
		else
		{
		    echo "你穿越了吧";
		}
	}
	
	public function addlang($ResumeID, $UserID)
	{
	
		if($ResumeID)
		{
			if($UserID)
			{
				if($this->input->post())
				{
					 $data = array(
						'category'  => $this->input->post('forcategorys'),
						'rank'  => $this->input->post('forranks'),
						'score'  => $this->input->post('forscores'),
						'userid' => $UserID,
						'resumeid' => $ResumeID,			
					 );
					// print_r($data);
					 $this->load->model('lang_model');
					$result = $this->lang_model->addlang($data);
					if($result)
					{	
						echo "<h2>\"添加语言成功！\"</h2>";
					}
				}
				else
				{
					echo "不能得到post的数据";
				}
			}
		}
	}
		
	public function update()
	{	
		$data['title'] = '首页';
		$iter = ($this->session->userdata('iter'));
		$UserName = $iter['name'];
		$data['resume_items'] = $this->resume_model->getResume($UserName);
		$this->load->view('templates/header',$data);
		$this->load->view('resume/index2',$data);
		$this->load->view('templates/footer',$data);
	}
	public function UpdateResume()
	{	
	  $this->load->helper('form');
	  $this->load->library('form_validation');
	  $data = array();
	  $this->form_validation->set_rules('WorkType','WorkType','required');	
	  $this->form_validation->set_rules('UserName','UserName','required');
	  $this->form_validation->set_rules('Tel','Tel','required');	
	  $this->form_validation->set_rules('School','School','required');	
	  $this->form_validation->set_rules('Education','WorkType','required');	
	  $this->form_validation->set_rules('Major','Major','required');		
	  $this->form_validation->set_rules('Gender','Gender','required');	
	  $this->form_validation->set_rules('Birth_of_Date','Birth_of_Date','required');	
  
	  $this->form_validation->set_rules('Identity','Identity','required');	
	  $this->form_validation->set_rules('PoliticyState','PoliticyState','required');	
	  $this->form_validation->set_rules('Address','Address','required');	
	  $this->form_validation->set_rules('Email','Email','required|valid_email');	
	  $this->form_validation->set_rules('Blog','Blog','required');
  
	  $this->form_validation->set_rules('EmergencyContacter','EmergencyContacter','required');	
	  $this->form_validation->set_rules('EmergencyTel','EmergencyTel','required');
	  if($this->form_validation->run() === FALSE)
	  {
	  	$this->load->view('templates/header',$data);
		$this->load->view('resume/index',$data);
	    $this->load->view('templates/footer',$data);
	  }
	  else
	  {
	  	$result = $this->resume_model->UpdateResume();
	  	if($result != "FALSE")
		$this->load->view('news/success');
		else
		{
		    $this->load->view('templates/header',$data);
			$this->load->view('resume/index',$data);
		    $this->load->view('templates/footer',$data);
		}
	  }	  
	}
	
	  public function regist($value='')
	    {
	    	$data['title'] = '注册'; 
	        $this->load->helper('form');
	        $submitted  = $this->input->post('submitted');
	        if ($submitted) {
	        	$name      = $this->input->post('name');
	            $password   = $this->input->post('password');
	            $email  = $this->input->post('email');
	            $tel = $this->input->post('tel');
	            $regist  = $this->iter_model->regist($name, $password, $email,$tel);
	            if($regist)
	            {
	            	$data['noNavbar'] = TRUE;
	            	$data['success'] = TRUE;
			    	$this->load->view('templates/header',$data);
					$this->load->view('iter/success',$data);
					$this->load->view('templates/footer',$data);
	            	//redirect("/iter/login");
	            }
	            else
	            {
	            	$data['noNavbar'] = TRUE;
	            	$data['error'] = TRUE;
			    	$this->load->view('templates/header',$data);
					$this->load->view('iter/regist',$data);
					$this->load->view('templates/footer',$data);
	            }
	        }
	        else
	        {
		    	$data['noNavbar'] = TRUE;
		    	$data['error'] = false;
		    	$this->load->view('templates/header',$data);
				$this->load->view('iter/regist',$data);
				$this->load->view('templates/footer',$data);
			}
	    }
	    function upload() {
      		  $config['upload_path'] = './uploads/';
			  $config['allowed_types'] = 'gif|jpg|png';
			  $config['max_size'] = '1000000';
			  $config['max_width']  = '102400';
			  $config['max_height']  = '76800';

			  $this->load->library('upload', $config);
			 
			  if ( ! $this->upload->do_upload())
			  {
			   $error = array('error' => $this->upload->display_errors());
			   
			   $this->load->view('resume/index', $error);
			  } 
			  else
			  {
			   $data = array('upload_data' => $this->upload->data());
			   
			   $this->load->view('news/success', $data);
			  }
		}

}
?>
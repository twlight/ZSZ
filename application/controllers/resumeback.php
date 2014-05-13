<?php
/**
* resume class , controller, both connect the view page and the model page.
*/
class Resume extends CI_Controller
{
	public function index()
	{
		$this->load->library('form_validation');
		$this->load->helper(array('form', 'url'));
		$this->load->library('session');//之前没有load这个类库才出错...
		$data['title'] = '填写基本信息';
		$iter = ($this->session->userdata('iter'));
		$UserName = $iter['name'];
		echo $UserName;			
		
		$this->load->model('resum_model');
		
		$data['userid'] = $this->resum_model->getUserID($UserName);
		echo $UserName;
		$data['normaluser'] = true;
		$this->load->view('templates/header',$data);
		$this->load->view('resume/userbasic',$data);	
		$this->load->view('templates/footer',$data);
	}
	
	public function updatebasic()
	{
		$this->load->model('normaluser_model');
		$data['normaluser'] = true;
	  	$result = $this->normaluser_model->update_basic();
	  	if($result)
		{
			$data['title'] = '填写教育信息';
			$iter = ($this->session->userdata('iter'));
			$UserName = $iter['name'];			
			$data['userid'] = $this->resumes_model->getUserID($UserName);
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
	  	
	  	$userid = $this->input->post('userid');
	  	echo $userid;
	  	if($result)
	  	{
		  		
			redirect("index.php/iter/mysetting");
				
		}
		else
		{
			
			$data['title'] =  "错误222！";
		    	$this->load->view('templates/header',$data);
			$this->load->view('resume/index',$data);
		   	 $this->load->view('templates/footer',$data);
		}	  
	}
	public function create($userid = FALSE)
	{
		echo "test";
		$data['userid'] = $userid;
	             
	             $createresult = $this->resumes_model->setResume($data['userid']);

	             if($createresult)
	             {
	             	    		$data['resumeid_list'] = $this->resumes_model->getResume($userid);

	             	    		$this->load->view('templates/header',$data);
				$this->load->view('mysetting/mysettingview',$data);
				
			//	$this->load->view('mysetting/mysettingviewbasic',$data);
			//	$this->load->view('mysetting/mysettingviewtotal');
				/*
				$this->load->view('mysetting/mysettingviewlang',$data);
				$this->load->view('mysetting/mysettingviewschoolwork',$data);
				$this->load->view('mysetting/mysettingviewsocial',$data);
				$this->load->view('mysetting/mysettingviewproject',$data);
				$this->load->view('mysetting/mysettingviewawards',$data);
				$this->load->view('mysetting/mysettingviewetc',$data);
				$this->load->view('mysetting/mysettingviewattached',$data);
				*/
				$this->load->view('templates/footer',$data);
	             }
	             else
	             {
	             	echo "<h2>fail to create a resume</h2>";
	             }
	}
	public function update()
	{	
		$data['title'] = '修改我的简历';
		$data['noNavbar'] = false;
		$data['normaluser'] = TRUE; 
		$iter = ($this->session->userdata('iter'));
		$UserName = $iter['name'];
		$data['resume_items'] = $this->resumes_model->getResume($UserName);
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
	  	$result = $this->resumes_model->UpdateResume();
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

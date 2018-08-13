<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use \Firebase\JWT\JWT;

class Persons extends API
{
	
	public function __construct()
	{
		parent::__construct();
		$this->load->model('model_api_persons');
	}

	/**
	 * @api {get} /persons/all Get all personss.
	 * @apiVersion 0.1.0
	 * @apiName AllPersons 
	 * @apiGroup persons
	 * @apiHeader {String} X-Api-Key Personss unique access-key.
	 * @apiPermission Persons Cant be Accessed permission name : api_persons_all
	 *
	 * @apiParam {String} [Filter=null] Optional filter of Personss.
	 * @apiParam {String} [Field="All Field"] Optional field of Personss : ID, LastName, FirstName, Age, image.
	 * @apiParam {String} [Start=0] Optional start index of Personss.
	 * @apiParam {String} [Limit=10] Optional limit data of Personss.
	 *
	 *
	 * @apiSuccess {Boolean} Status status response api.
	 * @apiSuccess {String} Message message response api.
	 * @apiSuccess {Array} Data data of persons.
	 *
	 * @apiSuccessExample Success-Response:
	 *     HTTP/1.1 200 OK
	 *
	 * @apiError NoDataPersons Persons data is nothing.
	 *
	 * @apiErrorExample Error-Response:
	 *     HTTP/1.1 403 Not Acceptable
	 *
	 */
	public function all_get()
	{
		$this->is_allowed('api_persons_all', false);

		$filter = $this->get('filter');
		$field = $this->get('field');
		$limit = $this->get('limit') ? $this->get('limit') : $this->limit_page;
		$start = $this->get('start');

		$select_field = ['ID', 'LastName', 'FirstName', 'Age', 'image'];
		$personss = $this->model_api_persons->get($filter, $field, $limit, $start, $select_field);
		$total = $this->model_api_persons->count_all($filter, $field);

		$data['persons'] = $personss;
				
		$this->response([
			'status' 	=> true,
			'message' 	=> 'Data Persons',
			'data'	 	=> $data,
			'total' 	=> $total
		], API::HTTP_OK);
	}

	
	/**
	 * @api {get} /persons/detail Detail Persons.
	 * @apiVersion 0.1.0
	 * @apiName DetailPersons
	 * @apiGroup persons
	 * @apiHeader {String} X-Api-Key Personss unique access-key.
	 * @apiPermission Persons Cant be Accessed permission name : api_persons_detail
	 *
	 * @apiParam {Integer} Id Mandatory id of Personss.
	 *
	 * @apiSuccess {Boolean} Status status response api.
	 * @apiSuccess {String} Message message response api.
	 * @apiSuccess {Array} Data data of persons.
	 *
	 * @apiSuccessExample Success-Response:
	 *     HTTP/1.1 200 OK
	 *
	 * @apiError PersonsNotFound Persons data is not found.
	 *
	 * @apiErrorExample Error-Response:
	 *     HTTP/1.1 403 Not Acceptable
	 *
	 */
	public function detail_get()
	{
		$this->is_allowed('api_persons_detail', false);

		$this->requiredInput(['ID']);

		$id = $this->get('ID');

		$select_field = ['ID', 'LastName', 'FirstName', 'Age', 'image'];
		$data['persons'] = $this->model_api_persons->find($id, $select_field);

		if ($data['persons']) {
			
			$this->response([
				'status' 	=> true,
				'message' 	=> 'Detail Persons',
				'data'	 	=> $data
			], API::HTTP_OK);
		} else {
			$this->response([
				'status' 	=> true,
				'message' 	=> 'Persons not found'
			], API::HTTP_NOT_ACCEPTABLE);
		}
	}

	
	/**
	 * @api {post} /persons/add Add Persons.
	 * @apiVersion 0.1.0
	 * @apiName AddPersons
	 * @apiGroup persons
	 * @apiHeader {String} X-Api-Key Personss unique access-key.
	 * @apiPermission Persons Cant be Accessed permission name : api_persons_add
	 *
 	 * @apiParam {String} LastName Mandatory LastName of Personss. Input LastName Max Length : 255. 
	 * @apiParam {String} FirstName Mandatory FirstName of Personss. Input FirstName Max Length : 255. 
	 * @apiParam {String} Age Mandatory Age of Personss. Input Age Max Length : 11. 
	 * @apiParam {String} Image Mandatory image of Personss.  
	 *
	 * @apiSuccess {Boolean} Status status response api.
	 * @apiSuccess {String} Message message response api.
	 *
	 * @apiSuccessExample Success-Response:
	 *     HTTP/1.1 200 OK
	 *
	 * @apiError ValidationError Error validation.
	 *
	 * @apiErrorExample Error-Response:
	 *     HTTP/1.1 403 Not Acceptable
	 *
	 */
	public function add_post()
	{
		$this->is_allowed('api_persons_add', false);

		$this->form_validation->set_rules('LastName', 'LastName', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('FirstName', 'FirstName', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('Age', 'Age', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('image', 'Image', 'trim|required');
		
		if ($this->form_validation->run()) {

			$save_data = [
				'LastName' => $this->input->post('LastName'),
				'FirstName' => $this->input->post('FirstName'),
				'Age' => $this->input->post('Age'),
				'image' => $this->input->post('image'),
			];
			
			$save_persons = $this->model_api_persons->store($save_data);

			if ($save_persons) {
				$this->response([
					'status' 	=> true,
					'message' 	=> 'Your data has been successfully stored into the database'
				], API::HTTP_OK);

			} else {
				$this->response([
					'status' 	=> false,
					'message' 	=> cclang('data_not_change')
				], API::HTTP_NOT_ACCEPTABLE);
			}

		} else {
			$this->response([
				'status' 	=> false,
				'message' 	=> validation_errors()
			], API::HTTP_NOT_ACCEPTABLE);
		}
	}

	/**
	 * @api {post} /persons/update Update Persons.
	 * @apiVersion 0.1.0
	 * @apiName UpdatePersons
	 * @apiGroup persons
	 * @apiHeader {String} X-Api-Key Personss unique access-key.
	 * @apiPermission Persons Cant be Accessed permission name : api_persons_update
	 *
	 * @apiParam {String} LastName Mandatory LastName of Personss. Input LastName Max Length : 255. 
	 * @apiParam {String} FirstName Mandatory FirstName of Personss. Input FirstName Max Length : 255. 
	 * @apiParam {String} Age Mandatory Age of Personss. Input Age Max Length : 11. 
	 * @apiParam {String} Image Mandatory image of Personss.  
	 * @apiParam {Integer} ID Mandatory ID of Persons.
	 *
	 * @apiSuccess {Boolean} Status status response api.
	 * @apiSuccess {String} Message message response api.
	 *
	 * @apiSuccessExample Success-Response:
	 *     HTTP/1.1 200 OK
	 *
	 * @apiError ValidationError Error validation.
	 *
	 * @apiErrorExample Error-Response:
	 *     HTTP/1.1 403 Not Acceptable
	 *
	 */
	public function update_post()
	{
		$this->is_allowed('api_persons_update', false);

		
		$this->form_validation->set_rules('LastName', 'LastName', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('FirstName', 'FirstName', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('Age', 'Age', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('image', 'Image', 'trim|required');
		
		if ($this->form_validation->run()) {

			$save_data = [
				'LastName' => $this->input->post('LastName'),
				'FirstName' => $this->input->post('FirstName'),
				'Age' => $this->input->post('Age'),
				'image' => $this->input->post('image'),
			];
			
			$save_persons = $this->model_api_persons->change($this->post('ID'), $save_data);

			if ($save_persons) {
				$this->response([
					'status' 	=> true,
					'message' 	=> 'Your data has been successfully updated into the database'
				], API::HTTP_OK);

			} else {
				$this->response([
					'status' 	=> false,
					'message' 	=> cclang('data_not_change')
				], API::HTTP_NOT_ACCEPTABLE);
			}

		} else {
			$this->response([
				'status' 	=> false,
				'message' 	=> validation_errors()
			], API::HTTP_NOT_ACCEPTABLE);
		}
	}
	
	/**
	 * @api {post} /persons/delete Delete Persons. 
	 * @apiVersion 0.1.0
	 * @apiName DeletePersons
	 * @apiGroup persons
	 * @apiHeader {String} X-Api-Key Personss unique access-key.
	 	 * @apiPermission Persons Cant be Accessed permission name : api_persons_delete
	 *
	 * @apiParam {Integer} Id Mandatory id of Personss .
	 *
	 * @apiSuccess {Boolean} Status status response api.
	 * @apiSuccess {String} Message message response api.
	 *
	 * @apiSuccessExample Success-Response:
	 *     HTTP/1.1 200 OK
	 *
	 * @apiError ValidationError Error validation.
	 *
	 * @apiErrorExample Error-Response:
	 *     HTTP/1.1 403 Not Acceptable
	 *
	 */
	public function delete_post()
	{
		$this->is_allowed('api_persons_delete', false);

		$persons = $this->model_api_persons->find($this->post('ID'));

		if (!$persons) {
			$this->response([
				'status' 	=> false,
				'message' 	=> 'Persons not found'
			], API::HTTP_NOT_ACCEPTABLE);
		} else {
			$delete = $this->model_api_persons->remove($this->post('ID'));

			}
		
		if ($delete) {
			$this->response([
				'status' 	=> true,
				'message' 	=> 'Persons deleted',
			], API::HTTP_OK);
		} else {
			$this->response([
				'status' 	=> false,
				'message' 	=> 'Persons not delete'
			], API::HTTP_NOT_ACCEPTABLE);
		}
	}

}

/* End of file Persons.php */
/* Location: ./application/controllers/api/Persons.php */
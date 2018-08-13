<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use \Firebase\JWT\JWT;

class Blog extends API
{
	
	public function __construct()
	{
		parent::__construct();
		$this->load->model('model_api_blog');
	}

	/**
	 * @api {get} /blog/all Get all blogs.
	 * @apiVersion 0.1.0
	 * @apiName AllBlog 
	 * @apiGroup blog
	 * @apiHeader {String} X-Api-Key Blogs unique access-key.
	 * @apiHeader {String} X-Token Blogs unique token.
	 * @apiPermission Blog Cant be Accessed permission name : api_blog_all
	 *
	 * @apiParam {String} [Filter=null] Optional filter of Blogs.
	 * @apiParam {String} [Field="All Field"] Optional field of Blogs : id, title, content, image, category, created_at.
	 * @apiParam {String} [Start=0] Optional start index of Blogs.
	 * @apiParam {String} [Limit=10] Optional limit data of Blogs.
	 *
	 *
	 * @apiSuccess {Boolean} Status status response api.
	 * @apiSuccess {String} Message message response api.
	 * @apiSuccess {Array} Data data of blog.
	 *
	 * @apiSuccessExample Success-Response:
	 *     HTTP/1.1 200 OK
	 *
	 * @apiError NoDataBlog Blog data is nothing.
	 *
	 * @apiErrorExample Error-Response:
	 *     HTTP/1.1 403 Not Acceptable
	 *
	 */
	public function all_get()
	{
		$this->is_allowed('api_blog_all');

		$filter = $this->get('filter');
		$field = $this->get('field');
		$limit = $this->get('limit') ? $this->get('limit') : $this->limit_page;
		$start = $this->get('start');

		$select_field = ['id', 'title', 'content', 'image', 'category', 'created_at'];
		$blogs = $this->model_api_blog->get($filter, $field, $limit, $start, $select_field);
		$total = $this->model_api_blog->count_all($filter, $field);

		$data['blog'] = $blogs;
				
		$this->response([
			'status' 	=> true,
			'message' 	=> 'Data Blog',
			'data'	 	=> $data,
			'total' 	=> $total
		], API::HTTP_OK);
	}

	
	/**
	 * @api {get} /blog/detail Detail Blog.
	 * @apiVersion 0.1.0
	 * @apiName DetailBlog
	 * @apiGroup blog
	 * @apiHeader {String} X-Api-Key Blogs unique access-key.
	 * @apiHeader {String} X-Token Blogs unique token.
	 * @apiPermission Blog Cant be Accessed permission name : api_blog_detail
	 *
	 * @apiParam {Integer} Id Mandatory id of Blogs.
	 *
	 * @apiSuccess {Boolean} Status status response api.
	 * @apiSuccess {String} Message message response api.
	 * @apiSuccess {Array} Data data of blog.
	 *
	 * @apiSuccessExample Success-Response:
	 *     HTTP/1.1 200 OK
	 *
	 * @apiError BlogNotFound Blog data is not found.
	 *
	 * @apiErrorExample Error-Response:
	 *     HTTP/1.1 403 Not Acceptable
	 *
	 */
	public function detail_get()
	{
		$this->is_allowed('api_blog_detail');

		$this->requiredInput(['id']);

		$id = $this->get('id');

		$select_field = ['id', 'title', 'content', 'image', 'category', 'created_at'];
		$data['blog'] = $this->model_api_blog->find($id, $select_field);

		if ($data['blog']) {
			
			$this->response([
				'status' 	=> true,
				'message' 	=> 'Detail Blog',
				'data'	 	=> $data
			], API::HTTP_OK);
		} else {
			$this->response([
				'status' 	=> true,
				'message' 	=> 'Blog not found'
			], API::HTTP_NOT_ACCEPTABLE);
		}
	}

	
	/**
	 * @api {post} /blog/add Add Blog.
	 * @apiVersion 0.1.0
	 * @apiName AddBlog
	 * @apiGroup blog
	 * @apiHeader {String} X-Api-Key Blogs unique access-key.
	 * @apiHeader {String} X-Token Blogs unique token.
	 * @apiPermission Blog Cant be Accessed permission name : api_blog_add
	 *
 	 * @apiParam {String} Title Mandatory title of Blogs. Input Title Max Length : 200. 
	 * @apiParam {String} Content Mandatory content of Blogs.  
	 * @apiParam {String} Image Mandatory image of Blogs.  
	 * @apiParam {String} Category Mandatory category of Blogs. Input Category Max Length : 200. 
	 * @apiParam {String} Created_at Mandatory created_at of Blogs.  
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
		$this->is_allowed('api_blog_add');

		$this->form_validation->set_rules('title', 'Title', 'trim|required|max_length[200]');
		$this->form_validation->set_rules('content', 'Content', 'trim|required');
		$this->form_validation->set_rules('image', 'Image', 'trim|required');
		$this->form_validation->set_rules('category', 'Category', 'trim|required|max_length[200]');
		$this->form_validation->set_rules('created_at', 'Created At', 'trim|required');
		
		if ($this->form_validation->run()) {

			$save_data = [
				'title' => $this->input->post('title'),
				'content' => $this->input->post('content'),
				'image' => $this->input->post('image'),
				'category' => $this->input->post('category'),
				'created_at' => $this->input->post('created_at'),
			];
			
			$save_blog = $this->model_api_blog->store($save_data);

			if ($save_blog) {
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
	 * @api {post} /blog/update Update Blog.
	 * @apiVersion 0.1.0
	 * @apiName UpdateBlog
	 * @apiGroup blog
	 * @apiHeader {String} X-Api-Key Blogs unique access-key.
	 * @apiHeader {String} X-Token Blogs unique token.
	 * @apiPermission Blog Cant be Accessed permission name : api_blog_update
	 *
	 * @apiParam {String} Title Mandatory title of Blogs. Input Title Max Length : 200. 
	 * @apiParam {String} Content Mandatory content of Blogs.  
	 * @apiParam {String} Image Mandatory image of Blogs.  
	 * @apiParam {String} Category Mandatory category of Blogs. Input Category Max Length : 200. 
	 * @apiParam {String} Created_at Mandatory created_at of Blogs.  
	 * @apiParam {Integer} id Mandatory id of Blog.
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
		$this->is_allowed('api_blog_update');

		
		$this->form_validation->set_rules('title', 'Title', 'trim|required|max_length[200]');
		$this->form_validation->set_rules('content', 'Content', 'trim|required');
		$this->form_validation->set_rules('image', 'Image', 'trim|required');
		$this->form_validation->set_rules('category', 'Category', 'trim|required|max_length[200]');
		$this->form_validation->set_rules('created_at', 'Created At', 'trim|required');
		
		if ($this->form_validation->run()) {

			$save_data = [
				'title' => $this->input->post('title'),
				'content' => $this->input->post('content'),
				'image' => $this->input->post('image'),
				'category' => $this->input->post('category'),
				'created_at' => $this->input->post('created_at'),
			];
			
			$save_blog = $this->model_api_blog->change($this->post('id'), $save_data);

			if ($save_blog) {
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
	 * @api {post} /blog/delete Delete Blog. 
	 * @apiVersion 0.1.0
	 * @apiName DeleteBlog
	 * @apiGroup blog
	 * @apiHeader {String} X-Api-Key Blogs unique access-key.
	 * @apiHeader {String} X-Token Blogs unique token.
	 	 * @apiPermission Blog Cant be Accessed permission name : api_blog_delete
	 *
	 * @apiParam {Integer} Id Mandatory id of Blogs .
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
		$this->is_allowed('api_blog_delete');

		$blog = $this->model_api_blog->find($this->post('id'));

		if (!$blog) {
			$this->response([
				'status' 	=> false,
				'message' 	=> 'Blog not found'
			], API::HTTP_NOT_ACCEPTABLE);
		} else {
			$delete = $this->model_api_blog->remove($this->post('id'));

			}
		
		if ($delete) {
			$this->response([
				'status' 	=> true,
				'message' 	=> 'Blog deleted',
			], API::HTTP_OK);
		} else {
			$this->response([
				'status' 	=> false,
				'message' 	=> 'Blog not delete'
			], API::HTTP_NOT_ACCEPTABLE);
		}
	}

}

/* End of file Blog.php */
/* Location: ./application/controllers/api/Blog.php */
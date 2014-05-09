class JobsController < ApplicationController
  before_filter :authenticate_user
  before_filter :auth_admin, :only => [:index, :new, :edit, :create, :update]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end
  
  # GET /jobs_user
  def index_user
	@jobs = Job.all

    respond_to do |format|
      format.html # index_user.html.erb
      format.json { render json: @jobs }
    end
  end
  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(params[:job])
    @job.status = 0
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    @job.status = 1
    @job.save
    redirect_to jobs
    # @job.destroy

    # respond_to do |format|
    #   format.html { redirect_to jobs_url }
    #   format.json { head :no_content }
    # end
  end
  def del
    @job = Job.find(params[:id])
    @job.status = 1
    @job.save
    redirect_to Job
    # @job.destroy

    # respond_to do |format|
    #   format.html { redirect_to jobs_url }
    #   format.json { head :no_content }
    # end
  end
  def restore
    @job = Job.find(params[:id])
    @job.status = 0
    @job.save
    redirect_to Job
  end
end

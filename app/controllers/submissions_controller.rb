class SubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  # GET /submissions
  # GET /submissions.json
  def index
    if !current_user.admin
      redirect_to root_path
    end
    @submissions = Submission.where(:approval => true).order(:last_name)
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
    if !current_user.admin
      redirect_to root_path
    end
  end

  # GET /submissions/new
  def new
    if current_user.submission
      redirect_to action: "edit", id: current_user.submission.id
    end

    @submission = Submission.new
    @submission.relatives.build
    4.times do
      @submission.honors.build
    end
    4.times do
      @submission.volunteers.build
    end
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.create
    @submission.attributes = submission_params
    @submission.user_id = current_user.id if current_user

    respond_to do |format|
      if @submission.save
        SubmissionMailer.submission_confirmation(@submission).deliver
        format.html { redirect_to dashboard_home_path, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        SubmissionMailer.submission_confirmation(@submission).deliver
        format.html { redirect_to dashboard_home_path, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(
        :acceptance,
        :citizen,
        :current_address,
        :current_city,
        :current_phone,
        :current_state,
        :current_zip,
        :degree_id,
        :degree_explanation,
        :expense,
        :fall_board,
        :fall_books,
        :fall_hours,
        :fall_other,
        :fall_tuition,
        :field_explanation,
        :field_id,
        :first_name,
        :frequency,
        :institution_city,
        :institution_name,
        :institution_state,
        :last_name,
        :last_year,
        :last_year_explanation,
        :license,
        :maiden_name,
        :middle_name,
        :motivation,
        :permanent_address,
        :permanent_city,
        :permanent_phone,
        :permanent_state,
        :permanent_zip,
        :reapply,
        :resume,
        :spring_board,
        :spring_books,
        :spring_hours,
        :spring_other,
        :spring_tuition,
        :start_date,
        :state_id,
        :summer_board,
        :summer_books,
        :summer_hours,
        :summer_other,
        :summer_tuition,
        :winter_board,
        :winter_books,
        :winter_hours,
        :winter_other,
        :winter_tuition,
        employments_attributes:[
          :employer,
          :title,
          :start,
          :end,
          :_destroy,
          :id,
        ],
        relatives_attributes:[
          :name,
          :relationship,
          :address,
          :city,
          :state,
          :zip,
          :_destroy,
          :id,
        ],
        institutions_attributes:[
          :name,
          :start,
          :end,
          :degree,
          :gpa,
          :_destroy,
          :id,
        ],
        honors_attributes:[
          :name,
          :_destroy,
          :id,
        ],
        volunteers_attributes:[
          :name,
          :_destroy,
          :id,
        ],
      )
    end
end


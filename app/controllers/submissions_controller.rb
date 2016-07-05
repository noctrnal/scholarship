class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    @submission = Submission.new
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new(submission_params)

    respond_to do |format|
      if @submission.save
        format.html { redirect_to @submission, notice: 'Submission was successfully created.' }
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
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
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
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
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
      # params.fetch(:submission, {})
      params.require(:submission).permit(
        :first_name,
        :middle_name,
        :last_name,
        :permanent_address,
        :permanent_city,
        :permanent_state,
        :permanent_zip,
        :permanent_phone,
        :current_address,
        :current_city,
        :current_state,
        :current_zip,
        :current_phone,
        :citizen,
        :field_id,
        :field_explanation,
        :degree_id,
        :degree_explanation,
        :institution_name,
        :institution_city,
        :institution_state,
        :acceptance,
        :start_month,
        :last_year,
        :last_year_explanation,
        :summer_tuition,
        :summer_books,
        :summer_board,
        :summer_other,
        :summer_hours,
        :fall_tuition,
        :fall_books,
        :fall_board,
        :fall_other,
        :fall_hours,
        :winter_tuition,
        :winter_books,
        :winter_board,
        :winter_other,
        :winter_hours,
        :spring_tuition,
        :spring_books,
        :spring_board,
        :spring_other,
        :spring_hours,
        :frequency,
        :motivation,
      )
    end
end

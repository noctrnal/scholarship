class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  def create
    @evaluation = Evaluation.create
    @evaluation.attributes = evaluation_params
    @evaluation.user = current_user

    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to submissions_path }
        format.json { render :show, status: :created, location: @evaluation }
      else
        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @options = [0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5]
    @submission = @evaluation.submission
  end

  def index
  end

  def new
    evaluation = Evaluation.find_by(
      :submission_id => params[:submission],
      :user => current_user
    )
    if evaluation
      redirect_to(action: "edit", id: evaluation.id)
    end

    @submission = Submission.find(params[:submission])
    @evaluation = Evaluation.new(:submission => @submission)
    @options = [0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5]
  end

  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to submissions_path }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def authenticate_admin
    if !current_user.admin
      redirect_to root_path
    end
  end

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def evaluation_params
    params.require(:evaluation).permit(
      :submission_id,
      :commitment,
      :scholarship,
      :recommendations,
      :goals,
      :remarks,
      :user,
    )
  end
end


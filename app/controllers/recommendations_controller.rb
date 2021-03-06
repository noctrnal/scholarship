class RecommendationsController < ApplicationController
  before_action :authenticate_user!, except: [:edit, :update]
  before_action :is_active?, except: [:show]
  before_action :set_recommendation, only: [:show, :edit, :update, :destroy]

  # GET /recommendations
  # GET /recommendations.json
  def index
    @recommendations = Recommendation.all
  end

  # GET /recommendations/1
  # GET /recommendations/1.json
  def show
    if !current_user.admin
      redirect_to root_path
    end
    @submission = @recommendation.submission
  end

  # GET /recommendations/new
  def new
    if current_user.submission
      @recommendation = Recommendation.new
    else
      redirect_to dashboard_home_path, :notice => "Please complete scholarship application first."
    end
  end

  # GET /recommendations/1/edit
  def edit
    unless params[:token] == @recommendation.token
      redirect_to root_path
    end
    @submission = @recommendation.submission
  end

  # POST /recommendations
  # POST /recommendations.json
  def create
    @recommendation = Recommendation.new(recommendation_params)
    @submission = Submission.find_by_user_id(current_user.id)
    @recommendation.submission_id = @submission.id

    respond_to do |format|
      if @recommendation.save
        RecommendationRequestMailer.recommendation_request(@recommendation).deliver
        format.html { redirect_to dashboard_home_path, notice: 'Recommendation was successfully created.' }
        format.json { render :show, status: :created, location: @recommendation }
      else
        format.html { render :new }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recommendations/1
  # PATCH/PUT /recommendations/1.json
  def update
    @submission = @recommendation.submission

    respond_to do |format|
      if @recommendation.update(recommendation_params)
        RecommendationMailer.recommendation_confirmation(@recommendation).deliver
        format.html { redirect_to root_url, notice: 'Recommendation was successfully updated.' }
        format.json { render :show, status: :ok, location: @recommendation }
      else
        format.html { render :edit }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recommendations/1
  # DELETE /recommendations/1.json
  def destroy
    @recommendation.destroy
    respond_to do |format|
      format.html { redirect_to recommendations_url, notice: 'Recommendation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def is_active?
      if !Setting.first.active
        redirect_to dashboard_home_path, :notice => "Sorry, applications are currently closed. Applications are open between September and February."
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_recommendation
      @recommendation = Recommendation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recommendation_params
      params.require(:recommendation).permit(
        :address,
        :email,
        :capacity,
        :communication,
        :department,
        :habits,
        :institution,
        :maturity,
        :motivation,
        :name,
        :personality,
        :rating,
        :recommendation,
        :responsibility,
        :title,
        :years,
      )
    end
end

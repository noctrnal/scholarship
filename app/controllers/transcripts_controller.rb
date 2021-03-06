class TranscriptsController < ApplicationController
  before_action :authenticate_user!, except: [:edit, :update]
  before_action :is_active?
  before_action :set_transcript, only: [:show, :edit, :update, :destroy]

  # GET /transcripts
  # GET /transcripts.json
  def index
  end

  # GET /transcripts/1
  # GET /transcripts/1.json
  def show
  end

  # GET /transcripts/new
  def new
    if current_user.submission
      @transcript = Transcript.new
      @submission = Submission.find_by_user_id(current_user.id)
      @transcripts = Transcript.where(:institution => [@submission.institutions.pluck(:id)])
    else
      redirect_to dashboard_home_path, :notice => "Please complete scholarship application first."
    end
  end

  # GET /transcripts/1/edit
  def edit
    unless params[:token] == @transcript.token
      redirect_to root_path
    end

    @submission = @transcript.institution.submission
  end

  # POST /transcripts
  # POST /transcripts.json
  def create
    @transcript = Transcript.new(transcript_params)

    respond_to do |format|
      if @transcript.save
        TranscriptRequestMailer.transcript_request(@transcript).deliver
        format.html { redirect_to dashboard_home_path, notice: 'Transcript was successfully created.' }
        format.json { render :show, status: :ok, location: @transcript }
      else
        format.html { render :new }
        format.json { render json: @transcript.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transcripts/1
  # PATCH/PUT /transcripts/1.json
  def update
    @submission = @transcript.institution.submission

    respond_to do |format|
      if @transcript.update(transcript_params)
        TranscriptMailer.transcript_confirmation(@transcript).deliver
        format.html { redirect_to root_url, notice: 'Transcript was successfully updated.' }
        format.json { render :show, status: :ok, location: @transcript }
      else
        format.html { render :edit }
        format.json { render json: @transcript.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transcripts/1
  # DELETE /transcripts/1.json
  def destroy
    @transcript.destroy
    respond_to do |format|
      format.html { redirect_to transcripts_url, notice: 'Transcript was successfully destroyed.' }
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
    def set_transcript
      @transcript = Transcript.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transcript_params
      params.require(:transcript).permit(:institution_id, :upload, :email, :submission)
    end
end

class LeadsController < ApplicationController
  before_action :set_lead, only: %i[ show edit update destroy ]

  def index
    redirect_to root_url
  end

  def message

  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)

    respond_to do |format|
      if @lead.save
        EmailSendJob.perform_later @lead
        format.html { render :message, notice: "Lead was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lead_params
      params.require(:lead).permit(:email, :womans_fashion, :mens_fashion, :children_fashion)
    end
end

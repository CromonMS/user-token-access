# frozen_string_literal: true
# Promo Controller
class PromosController < ApplicationController
  before_action :check_expiry_date, only: [:show]

  def index
    @promos = Promo.all
  end

  def show
    @recipient = PromoRecipient.find_by_access_token(params[:access_token]).recipient
  end

  def new
    @promo = Promo.new
    2.times { @promo.recipients.build }
  end

  def create
    @promo = Promo.new(promo_params)
    respond_to do |format|
      if @promo.save
        @promo.recipients.each do |recipient|
          PromoMailer.send_mail(recipient, @promo).deliver_now
        end
        format.html { redirect_to root_url, notice: 'Succesfully created Promo' }
      else
        format.html { render action: 'new', notice: 'Please try again' }
      end
    end
  end

  def destroy
    @promo = Promo.find_by_id(params[:id])
    @promo.delete
    flash[:notice] = 'Promo Deleted'
    redirect_to :back
  end

  private

  def promo_params
    params.require(:promo).permit(:id, :title, :start_date, :expiry_date, recipients_attributes: [:id, :name, :email])
  end

  def check_access_token
    if Promo.find_by_id(params[:promo_id]).promo_recipients.where(access_token: params[:access_token]).exists?
      @promo = Promo.find_by_id(params[:promo_id])
      @recipient = PromoRecipient.find_by_access_token(params[:access_token]).recipient
      render :show
    else
      render :denied
    end
  end

  def check_expiry_date
    @promo = Promo.find_by_id(params[:promo_id])
    if @promo.nil?
      render :expired
    elsif @promo.expiry_date < Time.zone.now
      render :expired
    else
      check_access_token
    end
  end
end

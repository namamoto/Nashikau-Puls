# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :farmer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
   def after_sign_in_path_for(resource)
    public_customers_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
    protected

   def farmer_state
     @farmer = Farmer.find_by(email: params[:farmer][:email].downcase)
     return if !@farmer
       if @farmer.valid_password?(params[:farmer][:password]) && @farmer.is_deleted == true
        flash[:alert] = "退会済みです。申し訳ございませんが、再度ご登録をしてご利用ください。"
        redirect_to new_farmer_registration_path
       end
   end
end

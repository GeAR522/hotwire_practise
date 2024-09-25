# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :ensure_frame_response, only: [:new]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    respond_to do |format|
      format.html { render partial: "devise/sessions/new", locals: { resource: User.new } }
    end


    # render turbo_stream: turbo_stream.replace("modal", partial: "devise/sessions/new", locals: { resource: User.new } )
  end

  # POST /resource/sign_in
  # def create
  #   super do |resource|
  #     respond_to do |format|
  #       format.turbo_stream { redirect_to after_sign_in_path_for(resource) }
  #       format.html { super }
  #     end
  #   end
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name])
  # end

  def ensure_frame_response
    # return unless Rails.env.development?
    redirect_to root_path unless turbo_frame_request?
  end
end

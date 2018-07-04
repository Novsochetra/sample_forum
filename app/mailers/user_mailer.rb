class UserMailer < ApplicationMailer
	default from: 'sochetra12.nov@gmail.com'
 
  def welcome_email
    # @user = params[:user]
    # @url  = 'http://example.com/login'
    mail(to: 'sochetra.nov.freestyler@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end

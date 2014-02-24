class BetaMailer < ActionMailer::Base

    def beta_email(buser)
    	@buser = buser
    	mail(:to => buser.email, :subject => "Bubblify - You're on the list!", :from => "hello@bubblify.com")
	end

end

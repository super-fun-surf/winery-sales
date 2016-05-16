module UserMailgun
  extend ActiveSupport::Concern
  #require 'sendgrid-ruby'
  #require 'premailer'
  require 'mailgun'


  def send_user_activation_mail(user, tag = 'Donkey')
    @mail_client = Mailgun::Client.new(ENV['MAILGUN_KEY']) #unless @mail_client.present?
    email = user.email
    #inlined = premailer.to_inline_css
    #texted = premailer.to_plain_text
    donkey = user_activation_html(user)
    donkey = donkey.gsub("\n", "")
    #debugger
    message_params =  {
      from: "Thought-Post <lukeallen@gmail.com>",
      to:   email,
      subject: 'Winery Sales Improvment Project | Account Activation',
      html: donkey
      #"o:tag" => tag
      # "o:testmode" => 'true'
    }

    @mail_client.send_message('sandboxd6b7f18ab603450dab7cd5357a88d7c2.mailgun.org', message_params)
  #  donkey = "monkey"
  #  donkey = "donkey"
#    response
  #rescue Mailgun::CommunicationError => error
  #  return '500'
  end



  def user_activation_html(user)
    render_to_string partial: 'user_email/account_activation', locals: {user: user}
  end
end

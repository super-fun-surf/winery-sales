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
      from: "john@westcompany.org",
      to:   email,
      subject: 'Account Activation | Winery Sales Improvment Project',
      html: donkey,
      "o:tag" => tag
      # "o:testmode" => 'true'
    }

    response = @mail_client.send_message('mg.thoughtpost.io', message_params)

  rescue Mailgun::CommunicationError => error
    return '500'
  end

  # render_to_string(:action => "users/profile", :layout => false)

  def user_activation_html(user)
    render_to_string partial: 'user_email/account_activation', locals: {user: user}
  end

  def send_password_reset_mail(user, tag = 'Donkey')
    @mail_client = Mailgun::Client.new(ENV['MAILGUN_KEY']) #unless @mail_client.present?
    email = user.email
    #inlined = premailer.to_inline_css
    #texted = premailer.to_plain_text
    mail = password_reset_html(user)
    mail = mail.gsub("\n", "")
    #debugger
    message_params =  {
      from: "john@westcompany.org",
      to:   email,
      subject: 'Reset Password | Winery Sales Improvment Project',
      html: mail,
      "o:tag" => tag
      # "o:testmode" => 'true'
    }

    response = @mail_client.send_message('mg.thoughtpost.io', message_params)
  #rescue Mailgun::CommunicationError => error
  #  return '500'
end
  def password_reset_html(user)
    render_to_string partial: 'user_email/password_reset', locals: {user: user}
  end
end

class Notifier < ActionMailer::Base
  default :from => 'noreply@company.com'

  def instructions(user)
    @user = user

    # normal syntax
    xlsx = render_to_string handlers: [:axlsx], template: 'users/send_instructions', layout: false
    attachments["user_#{user.id}.xlsx"] = {mime_type: Mime::XLSX, content: xlsx}

    mail :to => user.email, :subject => 'Instructions'
  end

end
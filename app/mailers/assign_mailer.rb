class AssignMailer < ApplicationMailer
  default from: 'from@example.com'

  def assign_mail(email, password)
    @email = email
    @password = password
    mail to: @email, subject: I18n.t('views.messages.complete_registration')
  end

  def contact_mail(email, team)
    @email = email
    @team = team
    mail to: @email, subject: "#{@team.name}のリーダー権を付与されました！"
  end
end